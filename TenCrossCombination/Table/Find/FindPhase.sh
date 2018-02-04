#!/bin/bash

for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombination/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != Find.sh ]]; then
 sed -n '8,8p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombination/logfile/$index >> Phase.txt
 sed -i 's/par6//g' Phase.txt 
 sed -i 's/err6//g' Phase.txt
 echo "The file $index has been extracted..."
 fi
done
