#!/bin/bash

for (( i =1;i<51;i= i+1))
do
   cd Combination/Combination$i
   cp ../../seed_combination/ ./combination -rf
   cp ../../GenCombination/combination.txt ./combination/ -rf
   cd combination
   seed -i "s/Combination_Seed/Combination$i/g" fit_ks_phase.C
   ./ROOTCompile fit_ks_phase
   ./job
   cd ../../../
done
