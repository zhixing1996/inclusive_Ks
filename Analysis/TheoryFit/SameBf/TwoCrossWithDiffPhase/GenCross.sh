#!/bin/bash

for i in 0 90 
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
  ./job
  cd ../
#  bash sub
done
