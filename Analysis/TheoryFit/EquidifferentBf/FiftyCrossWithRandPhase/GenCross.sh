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
  for i in 0.01 0.0104 0.0108 0.0112 0.0116 0.012 0.0124 0.0128 0.0132 0.0136 0.014 0.0144 0.0148 0.0152 0.0156 0.016 0.0164 0.0168 0.0172 0.0176 0.018 0.0184 0.0188 0.0192 0.0196 0.02 0.0204 0.0208 0.0212 0.0216 0.022 0.0224 0.0228 0.0232 0.0236 0.024 0.0244 0.0248 0.0252 0.0256 0.026 0.0264 0.0268 0.0272 0.0276 0.028 0.0284 0.0288 0.0292 0.0296
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
