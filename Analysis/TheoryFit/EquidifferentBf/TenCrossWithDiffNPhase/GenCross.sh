#!/bin/bash

for i in 0.01 0.015 0.02 0.025 0.03 0.035 0.04 0.045 0.05 0.055
do
  mkdir $i
  cd $i
  for j in 0 90
  do
    mkdir $j
    cd $j
    cp ../../seed_gencross/* . -rf
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
    cd ../
  #  bash sub
  done
  cd ../
done
