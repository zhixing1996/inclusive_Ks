#!/bin/bash

# A function to generate random number
function rand(){
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s%N)
    echo $(($num%$max+$min))    
}

mkdir Combination
cd Combination
for (( k =1; k<101; k= k+1 ))
do
  mkdir Combination$k
  cd Combination$k
  for i in 0.01 0.015 0.02 0.025 0.03 0.035 0.04 0.045 0.05 0.055 0.06 0.065 0.07 0.075 0.08 0.085 0.09 0.095 0.1 0.105 0.11 0.115 0.12 0.125 0.13 0.135 0.14 0.145 0.15 0.155 0.16 0.165 0.17 0.175 0.18 0.185 0.19 0.195 0.2 0.205 0.21 0.215 0.22 0.225 0.23 0.235  0.24 0.245 0.25 0.255
  do
    j=$(rand 0 90)
    BfPhaseFile="BfPhase_combination.txt"
    touch $BfPhaseFile
    echo "$i $j" >> $BfPhaseFile
    mkdir $i
    cd $i
    cp ../../../seed_gencross/* . -rf
    sed -i s/'seed_Bf/'$i''/g fit_ks_phase.C
    sed -i s/'seed_Phase/'$j''/g fit_ks_phase.C
    touch job
    echo "#!/bin/bash" > job
    echo "./ROOTCompile fit_ks_phase" >> job
    echo "./fit_ks_phase" >> job
    touch sub
    echo "hep_sub -g physics job" > sub
    chmod 700 job
    ./job
    #  bash sub
    cd ../
  done
  cd ../
done
