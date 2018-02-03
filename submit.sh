#!/usr/bin/env bash

# Main driver to run 
# Author Maoqiang Jing <jingmq@ihep.ac.cn>
# Created [2018-02-03 Sat 20:07]


usage() {
    printf "NAME\n\trun.sh - Main driver to run\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./run.sh [OPTION]"
    printf "\nOPTIONS\n"
    printf "\n\t%-9s  %-40s"  "0.1"      "[Two cross section with different relative phase(0~90)]" 
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Generate ten cross section with different relative phase]" 
    printf "\n\t%-9s  %-40s"  "0.2"      "[get cce]"
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

    0.1) echo "0.1 is for dealing two cross section with different relative phase(0~90)..."
         ;;
    0.1.1) echo "Generating ten cross section with different relative phase..."
           cd TwoCrossCombination
           ./MkdirGenjob.sh
           ;;
    0.2) echo "Getting CCE..."
         ;;
esac
