#!/bin/bash

echo "Dealing 0 0 combinations..."
for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != FindBf.sh ]]; then
 sed -n '6,6p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/logfile/$index >> Bf_0_0.txt
 sed -i 's/par4//g' Bf_0_0.txt
 sed -i 's/err4//g' Bf_0_0.txt
 echo "The file $index has been extracted..."
 fi
done

echo "Dealing 0 90 combinations..."
for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != FindBf.sh ]]; then
 sed -n '6,6p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/logfile/$index >> Bf_0_90.txt
 sed -i 's/par4//g' Bf_0_90.txt
 sed -i 's/err4//g' Bf_0_90.txt
 echo "The file $index has been extracted..."
 fi
done

echo "Dealing 90 90 combinations..."
for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != FindBf.sh ]]; then
 sed -n '6,6p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/logfile/$index >> Bf_90_90.txt
 sed -i 's/par4//g' Bf_90_90.txt
 sed -i 's/err4//g' Bf_90_90.txt
 echo "The file $index has been extracted..."
 fi
done
