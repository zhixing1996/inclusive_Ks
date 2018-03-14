#!/bin/bash

function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s%N)
    echo $(($num%$max+$min))    
}

mkdir Combination
cd Combination

for (( i =1; i<2; i= i+1))
do
  mkdir Combination$i
  cd Combination$i
  sum=0
  for (( k =0; k<10; k= k+1))
  do
      IntRnd[$k]=$(rand 1 100)
      let "sum = ${IntRnd[$k]} + $sum"
  done

  mkdir results
  for (( j =0; j<10; j= j+1))
  do
    let "k = $k - 1"
    if [ $k -ge 0 ]; then
      bf=`echo "scale=8; 0.1 * ${IntRnd[$k]} / $sum " | bc -l`
      dir="0$bf"
      mkdir $dir
      cd $dir
      for phase in 0 90
      do 
        mkdir $phase
        cd $phase
        cp ../../../../seed_gencross/* . -rf
        sed -i s/'seed_Bf/'$bf''/g fit_ks_phase.C
        sed -i s/'seed_Phase/'$phase''/g fit_ks_phase.C
        touch job
        echo "#!/bin/bash" > job
        echo "./ROOTCompile fit_ks_phase" >> job
        echo "./fit_ks_phase" >> job
        touch sub
        echo "hep_sub -g physics job" > sub
        chmod 700 job
        ./job
        cd ../
        mv $phase/fit_ks_phase.txt ../results/"result_"$j"_"$phase".txt"
      done
    fi
    cd ../
  #  bash sub
  done
  cd ../
done
