#!/usr/bin/env bash

# Main driver to run 
# Author Maoqiang Jing <jingmq@ihep.ac.cn>
# Created [2018-02-03 Sat 20:07]


usage() {
    printf "NAME\n\trun.sh - Main driver to run\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./run.sh [OPTION]"
    printf "\nOPTIONS\n"
    printf "\n\t%-9s  %-40s"  "0.1"      "[Build necessary directories for two cross section with different relative phase(0~90)]" 
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Generate ten cross section with different relative phase]" 
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Generate Combinations]"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "[Submit jobs]"
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
    #  0.1 Two cross section with different relative phase(0_90)
    # --------------------------------------------------------------------------

    0.1) echo "Building necessary directories..."
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination/rootfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination/logfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination/cross
         ;;
    0.1.1) echo "Generating ten cross section with different relative phase..."
           cd TwoCrossCombination
           ./GenCross.sh
           cd ../
           ;;
    0.1.2) echo "Generating Combinations..."
           cd TwoCrossCombination/GenCombination
           g++ -o combination combination.C
           ./combination
           ./combination           cd ../../
           ./combination           ;;
    0.1.3) echo "Submitting jobs..."
           cd TwoCrossCombination/Combination
           cp ../GenCombination/combination.txt .
           ./ROOTCompile fit_ks_phase
           bash sub
           ;;
    0.2) echo "Getting CCE..."
         ;;
esac
