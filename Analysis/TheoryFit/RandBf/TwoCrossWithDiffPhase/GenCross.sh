#!/bin/bash

function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s%N)
    echo $(($num%$max+$min))    
}

mkdir Combination_0_0
cd Combination_0_0
for (( i =1; i<101; i= i+1))
do
  mkdir Combination$i
  cd Combination$i
  sum=0
  for (( k =0; k<2; k= k+1))
  do
      IntRnd[$k]=$(rand 1 100)
      let "sum = ${IntRnd[$k]} + $sum"
  done
  for j in 10 20
  do
    let "k = $k - 1"
    if [ $k -ge 0 ]; then
      bf=`echo "scale=8; 0.025 * ${IntRnd[$k]} / $sum " | bc -l`
      BfPhaseFile="BfPhase_combination.txt"
      touch $BfPhaseFile
      echo "$bf $j" >> $BfPhaseFile
      mkdir $j
      cd $j
      cp ../../../seed_gencross/* . -rf
      sed -i s/'seed_Bf/'$bf''/g fit_ks_phase.C
      sed -i s/'seed_Phase/'$j''/g fit_ks_phase.C
      touch job
      echo "#!/bin/bash" > job
      echo "./ROOTCompile fit_ks_phase" >> job
      echo "./fit_ks_phase" >> job
      touch sub
      echo "hep_sub -g physics job" > sub
      chmod 700 job
      ./job
    fi
    cd ../
    #  bash sub
  done
  cd ../
done
cd ../

mkdir Combination_0_90
cd Combination_0_90
for (( i =1; i<101; i= i+1))
do
  mkdir Combination$i
  cd Combination$i
  sum=0
  for (( k =0; k<2; k= k+1))
  do
      IntRnd[$k]=$(rand 1 100)
      let "sum = ${IntRnd[$k]} + $sum"
  done
  for j in 0 90
  do
    let "k = $k - 1"
    if [ $k -ge 0 ]; then
      bf=`echo "scale=8; 0.025 * ${IntRnd[$k]} / $sum " | bc -l`
      BfPhaseFile="BfPhase_combination.txt"
      touch $BfPhaseFile
      echo "$bf $j" >> $BfPhaseFile
      mkdir $j
      cd $j
      cp ../../../seed_gencross/* . -rf
      sed -i s/'seed_Bf/'$bf''/g fit_ks_phase.C
      sed -i s/'seed_Phase/'$j''/g fit_ks_phase.C
      touch job
      echo "#!/bin/bash" > job
      echo "./ROOTCompile fit_ks_phase" >> job
      echo "./fit_ks_phase" >> job
      touch sub
      echo "hep_sub -g physics job" > sub
      chmod 700 job
      ./job
    fi
    cd ../
    #  bash sub
  done
  cd ../
done
cd ../

mkdir Combination_90_90
cd Combination_90_90
for (( i =1; i<101; i= i+1))
do
  mkdir Combination$i
  cd Combination$i
  sum=0
  for (( k =0; k<2; k= k+1))
  do
      IntRnd[$k]=$(rand 1 100)
      let "sum = ${IntRnd[$k]} + $sum"
  done
  for j in 190 290
  do
    let "k = $k - 1"
    if [ $k -ge 0 ]; then
      bf=`echo "scale=8; 0.025 * ${IntRnd[$k]} / $sum " | bc -l`
      BfPhaseFile="BfPhase_combination.txt"
      touch $BfPhaseFile
      echo "$bf $j" >> $BfPhaseFile
      mkdir $j
      cd $j
      cp ../../../seed_gencross/* . -rf
      sed -i s/'seed_Bf/'$bf''/g fit_ks_phase.C
      sed -i s/'seed_Phase/'$j''/g fit_ks_phase.C
      touch job
      echo "#!/bin/bash" > job
      echo "./ROOTCompile fit_ks_phase" >> job
      echo "./fit_ks_phase" >> job
      touch sub
      echo "hep_sub -g physics job" > sub
      chmod 700 job
      ./job
    fi
    cd ../
    #  bash sub
  done
  cd ../
done
cd ../
