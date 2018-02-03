#!/usr/bin/env bash

# Reset the programs
# Author Maoqiang Jing <jingmq@ihep.ac.cn>
# Created [2018-02-03 Sat 21:19]

usage() {
    printf "NAME\n\trun.sh - Reset the programs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./cleanup.sh [OPTION]"
    printf "\nOPTIONS\n"    
    printf "\n\t%-9s  %-40s"  "0.1"      "[Clean files for two cross section with different relative phase(0~90)]"       
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Clean files in /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination]"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Clean files in inclusive_Ks/TwoCrossCombination]"
    printf "\n\t%-9s  %-40s"  "0.6"      "[End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)]"
    printf "\n\t%-9s  %-40s"  "0.7"      "[Clean all]"
}


if [[ $# -eq 0 ]]; then
    usage
    printf "\nPlease enter your option: "
    read option
else
    option=$1
fi

case $option in

    # --------------------------------------------------------------------------
    #  0.1 Clean files for two cross section with different relative phase(0_90)
    # --------------------------------------------------------------------------

    0.1) echo "Cleaning files for two cross section with different relative phase(0~90)]..."
         ;;
    0.1.1) echo "Cleaning files in /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination -rf
           ;;
    0.1.2) echo "Cleaning files in inclusive_Ks/TwoCrossCombination..."
           cd TwoCrossCombination
           for (( i =0; i<100; i= i+10))
           do
               rm $i -rf
           done
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../
           ;;

    # -------------------------------------------------------------------------------
    #  0.6 End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)
    # -------------------------------------------------------------------------------

    0.6) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks..."
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

    # --------------------------------------------------------------------------
    #  0.7 Clean all
    # --------------------------------------------------------------------------

    0.7) echo "Cleaning all..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
           cd TwoCrossCombination
           for (( i =0; i<100; i= i+10))
           do
               rm $i -rf
           done
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../
         ;;

esac
