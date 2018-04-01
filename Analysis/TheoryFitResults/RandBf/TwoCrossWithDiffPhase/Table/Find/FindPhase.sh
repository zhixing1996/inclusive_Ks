#!/bin/bash

echo "Dealing 0 0 combinations..."
for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != Find.sh ]]; then
 sed -n '8,8p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/logfile/$index >> Phase_0_0.txt
 sed -i 's/par6//g' Phase_0_0.txt 
 sed -i 's/err6//g' Phase_0_0.txt
 echo "The file $index has been extracted..."
 fi
done

echo "Dealing 0 90 combinations..."
for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != Find.sh ]]; then
 sed -n '8,8p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/logfile/$index >> Phase_0_90.txt
 sed -i 's/par6//g' Phase_0_90.txt 
 sed -i 's/err6//g' Phase_0_90.txt
 echo "The file $index has been extracted..."
 fi
done

echo "Dealing 90 90 combinations..."
for index in `ls /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/logfile -lrt | awk '{print $9}'`
do
 if [[ $index != Find.sh ]]; then
 sed -n '8,8p' /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/logfile/$index >> Phase_90_90.txt
 sed -i 's/par6//g' Phase_90_90.txt 
 sed -i 's/err6//g' Phase_90_90.txt
 echo "The file $index has been extracted..."
 fi
done
