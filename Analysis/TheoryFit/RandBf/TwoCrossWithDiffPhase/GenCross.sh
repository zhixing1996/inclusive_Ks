#!/bin/bash

function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s%N)
    echo $(($num%$max+$min))    
}

mkdir Combination
cd Combination
for (( i =1; i<51; i= i+1))
do
  mkdir Combination$i
  cd Combination$i
  for j in 0 90
  do
    intbf=$(rand 10 15)
    bf=`echo "scale=4; $intbf / 1000 " | bc -l`
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
    cd ../
    #  bash sub
  done
  cd ../
done
