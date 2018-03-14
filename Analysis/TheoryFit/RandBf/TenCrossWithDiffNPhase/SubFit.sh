#!/bin/bash

for (( i =1;i<2;i= i+1))
do
   cd Combination/Combination$i
   cp ../../seed_combination/ ./combination -rf
   cp ../../GenCombination/combination.txt ./combination
   cd combination
   sed -i s/'num_combination/Combination'$i''/g fit_ks_phase.C
   ./ROOTCompile fit_ks_phase
   if [ -e combination.txt ]; then
      while read index a b c d e f g h i j k 
      do
         ./fit_ks_phase $a $b $c $d $e $f $g $h $i $j $k
      done < combination.txt
   fi
   cd ../../../
done
