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
  for i in 0.001 0.00136 0.00172 0.00208 0.00244 0.0028 0.00316 0.00352 0.00388 0.00424 0.0046 0.00496 0.00532 0.00568 0.00604 0.0064 0.00676 0.00712 0.00748 0.00784 0.0082 0.00856 0.00892 0.00928 0.00964 0.01 0.01036 0.01072 0.01108 0.01144 0.0118 0.01216 0.01252 0.01288 0.01324 0.0136 0.01396 0.01432 0.01468 0.01504 0.0154 0.01576 0.01612 0.01648 0.01684 0.0172 0.01756 0.01792 0.01828 0.01864
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
