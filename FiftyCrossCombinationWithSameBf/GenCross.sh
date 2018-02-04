#!/bin/bash

for (( i =0; i<91; i= i+1))  
do
  mkdir $i
  cd $i
  cp ../seed_gencross/* . -rf
  sed -i s/'seed/'$i''/g fit_ks_phase.C
  touch job
  echo "#!/bin/bash" > job
  echo "./ROOTCompile fit_ks_phase" >> job
  echo "./fit_ks_phase" >> job
  touch sub
  echo "hep_sub -g physics job" > sub
  chmod 700 job
  #./job
  bash sub
  cd ../
done
