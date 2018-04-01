#!/bin/bash

for (( i =1;i<101;i= i+1))
do
   cd Combination_0_0/Combination$i
   cp ../../seed_combination_0_0/ ./combination -rf
   cd combination
   ./ROOTCompile fit_ks_phase
   ./fit_ks_phase $i $i
   cd ../../../
done

for (( i =1;i<101;i= i+1))
do
   cd Combination_0_90/Combination$i
   cp ../../seed_combination_0_90/ ./combination -rf
   cd combination
   ./ROOTCompile fit_ks_phase
   ./fit_ks_phase $i $i
   cd ../../../
done

for (( i =1;i<101;i= i+1))
do
   cd Combination_90_90/Combination$i
   cp ../../seed_combination_90_90/ ./combination -rf
   cd combination
   ./ROOTCompile fit_ks_phase
   ./fit_ks_phase $i $i
   cd ../../../
done
