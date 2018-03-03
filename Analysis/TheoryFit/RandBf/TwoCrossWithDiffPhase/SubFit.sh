#!/bin/bash

for (( i =1;i<51;i= i+1))
do
   cd Combination/Combination$i
   cp ../../seed_combination/ ./combination -rf
   cd combination
   ./ROOTCompile fit_ks_phase
   ./fit_ks_phase $i $i
   cd ../../../
done
