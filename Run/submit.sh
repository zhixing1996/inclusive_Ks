#!/usr/bin/env bash

# Main driver to run 
# Author Maoqiang Jing <jingmq@ihep.ac.cn>
# Created [2018-02-03 Sat 20:07]


echo "Building /besfs/groups/tauqcd/jingmq/inclusive_Ks if not existed..."
if [ ! -d "/besfs/groups/tauqcd/jingmq/inclusive_Ks" ]; then
  mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks
fi

usage() {
    printf "NAME\n\trun.sh - Main driver to run\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./submit.sh [OPTION]"
    printf "\nOPTIONS\n"
    printf "\n\t%-9s  %-40s"  "0.1"      "[Build necessary directories for combinations of two cross sections with different relative phase(0~90)]" 
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Generate ten cross sections with different relative phase]" 
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Generate combinations]"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "[Submit jobs]"
    printf "\n\t%-9s  %-40s"  "0.1.4"      "[Get branch fractions and relative phases]"
    printf "\n\t%-9s  %-40s"  "0.1.5"      "[Make table]"
    printf "\n\t%-9s  %-40s"  "0.2"      "[Build necessary directories for combinations of ten cross sections with different number of relative phase 90]" 
    printf "\n\t%-9s  %-40s"  "0.2.1"      "[Generate two cross sections with relative phase 0 and 90]" 
    printf "\n\t%-9s  %-40s"  "0.2.2"      "[Generate combinations]"
    printf "\n\t%-9s  %-40s"  "0.2.3"      "[Submit jobs]"
    printf "\n\t%-9s  %-40s"  "0.2.4"      "[Get branch fractions and relative phases]"
    printf "\n\t%-9s  %-40s"  "0.2.5"      "[Make table]"
    printf "\n\t%-9s  %-40s"  "0.3"      "[Build necessary directories for combinations of fifty cross sections with same branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.3.1"      "[Generate ninety-one cross sections with same branch fractions]" 
    printf "\n\t%-9s  %-40s"  "0.3.2"      "[Generate combinations]"
    printf "\n\t%-9s  %-40s"  "0.3.3"      "[Submit jobs]"
    printf "\n\t%-9s  %-40s"  "0.3.4"      "[Get branch fractions and relative phases]"
    printf "\n\t%-9s  %-40s"  "0.3.5"      "[Make table]"
    printf "\n\t%-9s  %-40s"  "0.4"      "[Build necessary directories for combinations of fifty cross sections with divided branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.4.1"      "[Generate fifty cross sections with divided branch fractions and random relative phases as well as combinations and fit]" 
    printf "\n\t%-9s  %-40s"  "0.4.2"      "[]"
    printf "\n\t%-9s  %-40s"  "0.4.3"      "[]"
    printf "\n\t%-9s  %-40s"  "0.4.4"      "[]"
    printf "\n\t%-9s  %-40s"  "0.4.5"      "[]"
}


if [[ $# -eq 0 ]]; then
    usage
    printf "\nPlease enter your option: "
    read option
else
    option=$1
fi

case $option in

    # ---------------------------------------------------------------------------
    #  0.1 Combinations of two cross sections with different relative phase(0~90)
    # ---------------------------------------------------------------------------

    0.1) echo "Building necessary directories..."
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase/rootfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase/logfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase/cross
         ;;
    0.1.1) echo "Generating ten cross sections with different relative phase..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase
           ./GenCross.sh
           cd ../../../Run
           ;;
    0.1.2) echo "Generating combinations..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/GenCombination
           g++ -o combination combination.C
           ./combination
           cd ../../../../Run
           ;;
    0.1.3) echo "Submitting jobs..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/Combination
           cp ../GenCombination/combination.txt .
           ./ROOTCompile fit_ks_phase
           bash sub
           cd ../../../../Run
           ;;
    0.1.4) echo "Getting branch fractions and relative phases..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/Table/Find
           ./FindBf.sh
           ./FindPhase.sh
           cd ../../../../../Run
           ;;
    0.1.5) echo "Making table..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/Table/MakeTable
           root -l -q MakeTable.cxx
           cd ../../../../../Run
           ;;

    # ----------------------------------------------------------------------------------
    #  0.2 Combinations of ten cross sections with different number of relative phase 90
    # ----------------------------------------------------------------------------------

    0.2) echo "Building necessary directories..."
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase/rootfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase/logfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase/cross
         ;;
    0.2.1) echo "Generating two cross sections with relative phase 0 and 90..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase
           ./GenCross.sh
           cd ../../../Run
           ;;
    0.2.2) echo "Generating combinations..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/GenCombination
           g++ -o combination combination.C
           ./combination
           cd ../../../../Run
           ;;
    0.2.3) echo "Submitting jobs..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/Combination
           cp ../GenCombination/combination.txt .
           ./ROOTCompile fit_ks_phase
           bash sub
           cd ../../../../Run
           ;;
    0.2.4) echo "Getting branch fractions and relative phases..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/Table/Find
           ./FindBf.sh
           ./FindPhase.sh
           cd ../../../../../Run
           ;;
    0.2.5) echo "Making table..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/Table/MakeTable
           root -l -q MakeTable.cxx
           cd ../../../../../Run
           ;;

    # ----------------------------------------------------------------------------------------------
    #  0.3 Combinations of fifty cross sections with same branch fractions and random relative pases
    # ----------------------------------------------------------------------------------------------

    0.3) echo "Building necessary directories..."
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase 
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase/rootfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase/logfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase/cross
         ;;
    0.3.1) echo "Generating ninety-one cross sections with same branch fraction..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase
           ./GenCross.sh
           cd ../../../Run
           ;;
    0.3.2) echo "Generating combinations..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/GenCombination
           g++ -o combination combination.C
           ./combination
           cd ../../../../Run
           ;;
    0.3.3) echo "Submitting jobs..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/Combination
           cp ../GenCombination/combination.txt .
           ./ROOTCompile fit_ks_phase
           bash sub
           cd ../../../../Run
           ;;
    0.3.4) echo "Getting branch fractions and relative phases..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/Table/Find
           ./FindBf.sh
           ./FindPhase.sh
           cd ../../../../../Run
           ;;
    0.3.5) echo "Making table..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/Table/MakeTable
           root -l -q MakeTable.cxx
           cd ../../../../../Run
           ;;

    # -------------------------------------------------------------------------------------------------
    #  0.4 Combinations of fifty cross sections with divided branch fractions and random relative pases
    # -------------------------------------------------------------------------------------------------

    0.4) echo "Building necessary directories..."
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithDividedBfRandPhase 
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithDividedBfRandPhase/rootfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithDividedBfRandPhase/logfile
         mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithDividedBfRandPhase/cross
         ;;
    0.4.1) echo "Generating fifty cross sections with divided branch fractions and random relative pases as well as combinations and fitting..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithDividedBfRandPhase
           hep_sub -g physics job
           cd ../../../Run
           ;;
    0.4.2) echo "..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithDividedBfRandPhase
           cd ../../../../Run
           ;;
    0.4.3) echo "..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithDividedBfRandPhase
           cd ../../../../Run
           ;;
    0.4.4) echo "..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithDividedBfRandPhase
           cd ../../../../../Run
           ;;
    0.4.5) echo "..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithDividedBfRandPhase
           cd ../../../../../Run
           ;;

esac
