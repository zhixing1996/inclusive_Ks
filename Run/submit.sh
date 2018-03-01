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
    printf "\n\t%-9s  %-40s"  "0.1"      "Build necessary directory for same branch ratio" 
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Combinations of two cross sections with different relative phase(0~90)]"
    printf "\n\t%-9s  %-40s"  "0.1.1.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.1.1.2"      "Generate ten cross sections with different relative phase" 
    printf "\n\t%-9s  %-40s"  "0.1.1.3"      "Generate combinations"
    printf "\n\t%-9s  %-40s"  "0.1.1.4"      "Submit jobs"
    printf "\n\t%-9s  %-40s"  "0.1.1.5"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.1.1.6"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Combinations of ten cross sections with different number of relative phase 90]" 
    printf "\n\t%-9s  %-40s"  "0.1.2.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.1.2.2"      "Generate two cross sections with relative phase 0 and 90" 
    printf "\n\t%-9s  %-40s"  "0.1.2.3"      "Generate combinations"
    printf "\n\t%-9s  %-40s"  "0.1.2.4"      "Submit jobs"
    printf "\n\t%-9s  %-40s"  "0.1.2.5"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.1.2.6"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "[Combinations of fifty cross sections with same branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.1.3.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.1.3.2"      "Generate ninety-one cross sections with same branch fractions" 
    printf "\n\t%-9s  %-40s"  "0.1.3.3"      "Generate combinations"
    printf "\n\t%-9s  %-40s"  "0.1.3.4"      "Submit jobs"
    printf "\n\t%-9s  %-40s"  "0.1.3.5"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.1.3.6"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.3"      "Build necessary directory for random branch ratio"
    printf "\n\t%-9s  %-40s"  "0.3.3"      "[Combinations of fifty cross sections with random branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.3.3.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.3.3.2"      "Generate fifty cross sections with divided branch fractions and random relative phases as well as combinations and fit" 
    printf "\n\t%-9s  %-40s"  "0.3.3.3"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.3.3.4"      "Make table"
}


if [[ $# -eq 0 ]]; then
    usage
    printf "\nPlease enter your option: "
    read option
else
    option=$1
fi

case $option in

    # -----------
    #  0.1 SameBf
    # -----------
  
    0.1) echo "Building necessary directory for same branch ratio..."
         echo "Building /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf if not existed..."
         if [ ! -d "/besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf" ]; then
           mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf
         fi
         ;;

    0.1.1) echo "Combinations of two cross sections with different relative phase(0~90)"   
           ;;

    0.1.1.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase/cross
             ;;
    0.1.1.2) echo "Generating ten cross sections with different relative phase..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase
             ./GenCross.sh
             cd ../../../../Run
             ;;
    0.1.1.3) echo "Generating combinations..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/GenCombination
             g++ -o combination combination.C
             ./combination
             cd ../../../../../Run
             ;;
    0.1.1.4) echo "Submitting jobs..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination
             cp ../GenCombination/combination.txt .
             ./ROOTCompile fit_ks_phase
             bash sub
             cd ../../../../../Run
             ;;
    0.1.1.5) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Table/Find
             ./FindBf.sh
             ./FindPhase.sh
             cd ../../../../../../Run
             ;;
    0.1.1.6) echo "Making table..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Table/MakeTable
             root -l -q MakeTable.cxx
             cd ../../../../../../Run
             ;;

    0.1.2) echo "Combinations of ten cross sections with different number of relative phase 90"
           ;;

    0.1.2.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithDiffNPhase
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithDiffNPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithDiffNPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithDiffNPhase/cross
             ;;
    0.1.2.2) echo "Generating two cross sections with relative phase 0 and 90..."
             cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase
             ./GenCross.sh
             cd ../../../../Run
             ;;
    0.1.2.3) echo "Generating combinations..."
             cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination
             g++ -o combination combination.C
             ./combination
             cd ../../../../../Run
             ;;
    0.1.2.4) echo "Submitting jobs..."
             cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Combination
             cp ../GenCombination/combination.txt .
             ./ROOTCompile fit_ks_phase
             bash sub
             cd ../../../../../Run
             ;;
    0.1.2.5) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Table/Find
             ./FindBf.sh
             ./FindPhase.sh
             cd ../../../../../../Run
             ;;
    0.1.2.6) echo "Making table..."
             cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Table/MakeTable
             root -l -q MakeTable.cxx
             cd ../../../../../../Run
             ;;

    0.1.3) echo "Combinations of fifty cross sections with same branch fractions and random relative pases"
           ;;

    0.1.3.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossCombinationWithSameBfRandPhase 
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossCombinationWithSameBfRandPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossCombinationWithSameBfRandPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossCombinationWithSameBfRandPhase/cross
             ;;
    0.1.3.2) echo "Generating ninety-one cross sections with same branch fraction..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase
             ./GenCross.sh
             cd ../../../../Run
             ;;
    0.1.3.3) echo "Generating combinations..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/GenCombination
             g++ -o combination combination.C
             ./combination
             cd ../../../../../Run
             ;;
    0.1.3.4) echo "Submitting jobs..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination
             cp ../GenCombination/combination.txt .
             ./ROOTCompile fit_ks_phase
             bash sub
             cd ../../../../../Run
             ;;
    0.1.3.5) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Table/Find
             ./FindBf.sh
             ./FindPhase.sh
             cd ../../../../../../Run
             ;;
    0.1.3.6) echo "Making table..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Table/MakeTable
             root -l -q MakeTable.cxx
             cd ../../../../../../Run
             ;;

    # --------------------
    #  0.2 EquidifferentBf
    # --------------------

    # -----------
    #  0.3 RandBf
    # -----------

    0.3) echo "Building necessary directory for random branch ratio..."
         echo "Building /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf if not existed..."
         if [ ! -d "/besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf" ]; then
           mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf
         fi
         ;;

    0.3.3) echo "Combinations of fifty cross sections with random relative pases"
           ;;

    0.3.3.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase 
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase/cross
             ;;
    0.3.3.2) echo "Generating fifty cross sections with random branch fractions and random relative pases as well as combinations and fitting..."
             cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase
             hep_sub -g physics job
             cd ../../../../Run
             ;;
    0.3.3.3) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/Table/Find
             ./FindBf.sh
             ./FindPhase.sh
             cd ../../../../../../Run
             ;;
    0.3.3.4) echo "Making table..."
             cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/Table/MakeTable
             root -l -q MakeTable.cxx
             cd ../../../../../../Run
             ;;

esac
