#!/bin/bash

cd Combination/
for (( i =1;i<2;i= i+1))
do
   cd Combination$i
   cp ../../seed_combination/ ./combination -rf
   cp ../../GenCombination/combination.txt ./combination
   cd combination
   sed -i s/'num_combination/Combination'$i''/g fit_ks_phase.C
   ./ROOTCompile fit_ks_phase
   ./job
   cd ../../
done
