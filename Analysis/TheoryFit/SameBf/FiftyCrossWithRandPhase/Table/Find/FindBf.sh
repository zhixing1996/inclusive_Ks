#!/bin/bash

for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != FindBf.sh ]]; then
 sed -n '6,6p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase/logfile/$index >> Bf.txt
 sed -i 's/par4//g' Bf.txt
 sed -i 's/err4//g' Bf.txt
 echo "The file $index has been extracted..."
 fi
done
