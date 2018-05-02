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
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Combinations of two cross sections with different relative phase(0,90)]"
    printf "\n\t%-9s  %-40s"  "0.1.1.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.1.1.2"      "Generate cross sections with different relative phase" 
    printf "\n\t%-9s  %-40s"  "0.1.1.3"      "Generate combinations"
    printf "\n\t%-9s  %-40s"  "0.1.1.4"      "Submit jobs"
    printf "\n\t%-9s  %-40s"  "0.1.1.5"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.1.1.6"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Combinations of ten cross sections with random relative phase 90]" 
    printf "\n\t%-9s  %-40s"  "0.1.2.1"      "Build necessary directories"
    # printf "\n\t%-9s  %-40s"  "0.1.2.2"      "Generate cross sections with relative phase 0 and 90" 
    # printf "\n\t%-9s  %-40s"  "0.1.2.3"      "Generate combinations"
    printf "\n\t%-9s  %-40s"  "0.1.2.2"      "Generate cross sections with random branch fractions and random relative pases as well as combinations and fit"
    printf "\n\t%-9s  %-40s"  "0.1.2.3"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.1.2.4"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.1.2.5"      "Get and fit relative difference"
    printf "\n\t%-9s  %-40s"  "0.1.2.6"      "Get and fit phase"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "[Combinations of fifty cross sections with same branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.1.3.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.1.3.2"      "Generate cross sections with same branch fractions" 
    printf "\n\t%-9s  %-40s"  "0.1.3.3"      "Generate combinations"
    printf "\n\t%-9s  %-40s"  "0.1.3.4"      "Submit jobs"
    printf "\n\t%-9s  %-40s"  "0.1.3.5"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.1.3.6"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.1.3.7"      "Get and fit relative difference"
    printf "\n\t%-9s  %-40s"  "0.1.3.8"      "Get and fit phase"
    # printf "\n\t%-9s  %-40s"  "0.2"      "Build necessary directory for equidifferent branch ratio" 
    # printf "\n\t%-9s  %-40s"  "0.2.1"      "[Combinations of two cross sections with different relative phase(0,90)]"
    # printf "\n\t%-9s  %-40s"  "0.2.1.1"      "Build necessary directories"
    # printf "\n\t%-9s  %-40s"  "0.2.1.2"      "Generate cross sections with different relative phase" 
    # printf "\n\t%-9s  %-40s"  "0.2.1.3"      "Generate combinations"
    # printf "\n\t%-9s  %-40s"  "0.2.1.4"      "Submit jobs"
    # printf "\n\t%-9s  %-40s"  "0.2.1.5"      "Get branch fractions and relative phases"
    # printf "\n\t%-9s  %-40s"  "0.2.1.6"      "Make table"
    # printf "\n\t%-9s  %-40s"  "0.2.2"      "[Combinations of ten cross sections with different number of relative phase 90]"
    # printf "\n\t%-9s  %-40s"  "0.2.2.1"      "Build necessary directories"
    # printf "\n\t%-9s  %-40s"  "0.2.2.2"      "Generate cross sections with relative phase 0 and 90"
    # printf "\n\t%-9s  %-40s"  "0.2.2.3"      "Generate combinations"
    # printf "\n\t%-9s  %-40s"  "0.2.2.4"      "Submit jobs"
    # printf "\n\t%-9s  %-40s"  "0.2.2.5"      "Get branch fractions and relative phases"
    # printf "\n\t%-9s  %-40s"  "0.2.2.6"      "Make table"
    # printf "\n\t%-9s  %-40s"  "0.2.2.7"      "Get and fit relative difference"
    # printf "\n\t%-9s  %-40s"  "0.2.2.8"      "Get and fit phase"
    # printf "\n\t%-9s  %-40s"  "0.2.3"      "[Combinations of fifty cross sections with equidifferent branch fractions and random relative phases]" 
    # printf "\n\t%-9s  %-40s"  "0.2.3.1"      "Build necessary directories"
    # printf "\n\t%-9s  %-40s"  "0.2.3.2"      "Generate cross sections with random branch fractions and random relative phases as well as combinations and fit" 
    # printf "\n\t%-9s  %-40s"  "0.2.3.3"      "Get branch fractions and relative phases"
    # printf "\n\t%-9s  %-40s"  "0.2.3.4"      "Make table"
    # printf "\n\t%-9s  %-40s"  "0.2.3.5"      "Get and fit relative difference"
    # printf "\n\t%-9s  %-40s"  "0.2.3.6"      "Get and fit phase"
    printf "\n\t%-9s  %-40s"  "0.3"      "Build necessary directory for random branch ratio"
    printf "\n\t%-9s  %-40s"  "0.3.1"      "[Combinations of two cross sections with different relative phase(0,90)]"
    printf "\n\t%-9s  %-40s"  "0.3.1.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.3.1.2"      "Generate cross sections with random branch fractions and different relative phases as well as combinations and fit"
    printf "\n\t%-9s  %-40s"  "0.3.1.3"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.3.1.4"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.3.1.5"      "Get and fit relative difference"
    printf "\n\t%-9s  %-40s"  "0.3.1.6"      "Get and fit phase"
    printf "\n\t%-9s  %-40s"  "0.3.2"      "[Combinations of ten cross sections with random relative phase]"
    printf "\n\t%-9s  %-40s"  "0.3.2.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.3.2.2"      "Generate cross sections with random branch fractions and random relative phases as well as combinations and fit"
    printf "\n\t%-9s  %-40s"  "0.3.2.3"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.3.2.4"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.3.2.5"      "Get and fit relative difference"
    printf "\n\t%-9s  %-40s"  "0.3.2.6"      "Get and fit phase"
    printf "\n\t%-9s  %-40s"  "0.3.3"      "[Combinations of fifty cross sections with random branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.3.3.1"      "Build necessary directories"
    printf "\n\t%-9s  %-40s"  "0.3.3.2"      "Generate cross sections with random branch fractions and random relative phases as well as combinations and fit" 
    printf "\n\t%-9s  %-40s"  "0.3.3.3"      "Get branch fractions and relative phases"
    printf "\n\t%-9s  %-40s"  "0.3.3.4"      "Make table"
    printf "\n\t%-9s  %-40s"  "0.3.3.5"      "Get and fit relative difference"
    printf "\n\t%-9s  %-40s"  "0.3.3.6"      "Get and fit phase"
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

    0.1.1) echo "Combinations of two cross sections with different relative phase(0,90)"   
           ;;

    0.1.1.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase/cross
             ;;
    0.1.1.2) echo "Generating cross sections with different relative phase..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/
             ./GenCross.sh
             ;;

    0.1.1.3) echo "Generating combinations..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/GenCombination/
             g++ -o combination combination.C
             ./combination
             ;;

    0.1.1.4) echo "Submitting jobs..."
             cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/
             cp ../GenCombination/combination.txt .
             ./ROOTCompile fit_ks_phase
             bash sub
             ;;

    0.1.1.5) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFitResults/SameBf/TwoCrossWithDiffPhase/Table/Find/
             ./FindBf.sh
             ./FindPhase.sh
             ;;

    0.1.1.6) echo "Making table..."
             cd ../Analysis/TheoryFitResults/SameBf/TwoCrossWithDiffPhase/Table/MakeTable/
             root -l -q MakeTable.cxx
             ;;

    0.1.2) echo "Combinations of ten cross sections with random relative phase"
           ;;

    0.1.2.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithRandPhase
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithRandPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithRandPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithRandPhase/cross
             ;;

    #0.1.2.2) echo "Generating cross sections with relative phase 0 and 90..."
    #         cd ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/
    #         ./GenCross.sh
    #         ;;

    # 0.1.2.3) echo "Generating combinations..."
    #          cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination/combination
    #          g++ -o combination combination.C
    #          ./combination
    #          ;;

    0.1.2.2) echo "Generating cross sections with random branch fractions and random relative pases as well as combinations and fitting..."
             # cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Combination/
             # cp ../GenCombination/combination.txt .
             # ./ROOTCompile fit_ks_phase
             # bash sub
             cd ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/
             hep_sub -g physics job
             ;;

    0.1.2.3) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/Table/Find/
             ./FindBf.sh
             ./FindPhase.sh
             ;;

    0.1.2.4) echo "Making table..."
             cd ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/Table/MakeTable/
             root -l -q MakeTable.cxx
             ;;

    0.1.2.5) echo "Getting and fitting relative difference..."
             cd ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/FitBfRelativeDiff/
             cd CalRelativeDiff/
             root -l -q CalRelativeDiff.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

    0.1.2.6) echo "Getting and fitting phase..."
             cd ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/FitPhase/
             cd GetPhase/
             root -l -q GetPhase.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

    0.1.3) echo "Combinations of fifty cross sections with same branch fractions and random relative pases"
           ;;

    0.1.3.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase 
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase/cross
             ;;

    0.1.3.2) echo "Generating cross sections with same branch fraction..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/
             ./GenCross.sh
             ;;

    0.1.3.3) echo "Generating combinations..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/GenCombination/
             g++ -o combination combination.C
             ./combination
             ;;

    0.1.3.4) echo "Submitting jobs..."
             cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/
             cp ../GenCombination/combination.txt .
             ./ROOTCompile fit_ks_phase
             bash sub
             ;;

    0.1.3.5) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/Table/Find/
             ./FindBf.sh
             ./FindPhase.sh
             ;;

    0.1.3.6) echo "Making table..."
             cd ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/Table/MakeTable/
             root -l -q MakeTable.cxx
             ;;

    0.1.3.7) echo "Getting and fitting relative difference..."
             cd ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/
             cd CalRelativeDiff/
             root -l -q CalRelativeDiff.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

    0.1.3.8) echo "Getting and fitting phase..."
             cd ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitPhase/
             cd GetPhase/
             root -l -q GetPhase.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;


    # --------------------
    #  0.2 EquidifferentBf
    # --------------------

    # 0.2) echo "Building necessary directory for equidifferent branch ratio..."
    #      echo "Building /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf if not existed..."
    #      if [ ! -d "/besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf" ]; then
    #        mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf
    #      fi
    #      ;;

    # 0.2.1) echo "Combinations of two cross sections with different relative phase(0,90)"
    #        ;;

    # 0.2.1.1) echo "Building necessary directories..."
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase 
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase/rootfile
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase/logfile
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase/cross
    #          ;;

    # 0.2.1.2) echo "Generating cross sections with different relative pases and branch fraction(0.01 and 0.015)..."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/
    #          ./GenCross.sh
    #          ;;

    # 0.2.1.3) echo "Generating combinations..."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/GenCombination/
    #          g++ -o combination combination.C
    #          ./combination
    #          ;;

    # 0.2.1.4) echo "Submitting jobs..."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/
    #          cp ../GenCombination/combination.txt .
    #          ./ROOTCompile fit_ks_phase
    #          bash sub
    #          ;;

    # 0.2.1.5) echo "Getting branch fractions and relative phases..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/TwoCrossWithDiffPhase/Table/Find/
    #          ./FindBf.sh
    #          ./FindPhase.sh
    #          ;;

    # 0.2.1.6) echo "Making table..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/TwoCrossWithDiffPhase/Table/MakeTable/
    #          root -l -q MakeTable.cxx
    #          ;;

    # 0.2.2) echo "Combinations of ten cross sections with different number of relative phase 90"
    #        ;;

    # 0.2.2.1) echo echo "Building necessary directories..."
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TenCrossWithDiffNPhase
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TenCrossWithDiffNPhase/rootfile
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TenCrossWithDiffNPhase/logfile
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TenCrossWithDiffNPhase/cross
    #          ;;

    # 0.2.2.2) echo "Generating cross sections with relative phase 0 and 90..."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/
    #          ./GenCross.sh
    #          ;;

    # 0.2.2.3) echo "Generating combinations..."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/
    #          g++ -o combination combination.C
    #          ./combination
    #          ;;

    # 0.2.2.4) echo "Submitting jobs..."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/
    #          cp ../GenCombination/combination.txt .
    #          ./ROOTCompile fit_ks_phase
    #          bash sub    
    #          ;;

    # 0.2.2.5) echo "Getting branch fractions and relative phases..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/Table/Find/
    #          ./FindBf.sh
    #          ./FindPhase.sh
    #          ;;

    # 0.2.2.6) echo "Making table..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/Table/MakeTable/
    #          root -l -q MakeTable.cxx
    #          ;;

    # 0.2.2.7) echo "Getting and fitting relative difference..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitBfRelativeDiff/
    #          cd CalRelativeDiff/
    #          root -l -q CalRelativeDiff.cxx
    #          cd ../DrawFit/
    #          root -l -q DrawFit1.cxx
    #          root -l -q DrawFit2.cxx
    #          root -l -q DrawFit3.cxx
    #          root -l -q DrawFit4.cxx
    #          root -l -q DrawFit5.cxx
    #          root -l -q DrawFit6.cxx
    #          root -l -q DrawFit7.cxx
    #          root -l -q DrawFit8.cxx
    #          root -l -q DrawFit9.cxx
    #          ;;

    # 0.2.2.8) echo "Getting and fitting phase..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitPhase/
    #          cd GetPhase/
    #          root -l -q GetPhase.cxx
    #          cd ../DrawFit/
    #          root -l -q DrawFit1.cxx
    #          root -l -q DrawFit2.cxx
    #          root -l -q DrawFit3.cxx
    #          root -l -q DrawFit4.cxx
    #          root -l -q DrawFit5.cxx
    #          root -l -q DrawFit6.cxx
    #          root -l -q DrawFit7.cxx
    #          root -l -q DrawFit8.cxx
    #          root -l -q DrawFit9.cxx
    #          ;;

    # 0.2.3) "Combinations of fifty cross sections with same branch fractions and random relative pases"
    #        ;;

    # 0.2.3.1) echo "Building necessary directories..."
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase/rootfile
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase/logfile
    #          mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase/cross
    #          ;;

    # 0.2.3.2) echo "Generating cross sections with random branch fractions and random relative pases as well as combinations and fitting...."
    #          cd ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/
    #          hep_sub -g physics job
    #          ;;

    # 0.2.3.3) echo "Getting branch fractions and relative phases..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/Table/Find/
    #          ./FindBf.sh
    #          ./FindPhase.sh
    #          ;;

    # 0.2.3.4) echo "Making table..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/Table/MakeTable/
    #          root -l -q MakeTable.cxx
    #          ;;

    # 0.2.3.5) echo "Getting and fitting relative difference..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/
    #          cd CalRelativeDiff/
    #          root -l -q CalRelativeDiff.cxx
    #          cd ../DrawFit/
    #          root -l -q DrawFit.cxx
    #          ;;

    # 0.2.3.6) echo "Getting and fitting phase..."
    #          cd ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitPhase/
    #          cd GetPhase/
    #          root -l -q GetPhase.cxx
    #          cd ../DrawFit/
    #          root -l -q DrawFit.cxx
    #          ;;

    # -----------
    #  0.3 RandBf
    # -----------

    0.3) echo "Building necessary directory for random branch ratio..."
         echo "Building /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf if not existed..."
         if [ ! -d "/besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf" ]; then
           mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf
         fi
         ;;
  
    0.3.1) echo "Combinations of two cross sections with different relative phase(0,90)"
           ;;

    0.3.1.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase 
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_0/cross
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_0_90/cross
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase/Combination_90_90/cross
             ;;

    0.3.1.2) echo "Generating cross sections with random branch fractions and different relative pases as well as combinations and fitting..."
             cd ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase/
             hep_sub -g physics job
             ;;

    0.3.1.3) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/Table/Find/
             ./FindBf.sh
             ./FindPhase.sh
             ;;

    0.3.1.4) echo "Making table..."
             cd ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/Table/MakeTable/
             root -l -q MakeTable.cxx
             ;;

    0.3.1.5) echo "Getting and fitting relative difference..."
             cd ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitBfRelativeDiff/
             cd CalRelativeDiff/
             root -l -q CalRelativeDiff.cxx
             cd ../DrawFit/
             root -l -q DrawFit_0_0.cxx
             root -l -q DrawFit_0_90.cxx
             root -l -q DrawFit_90_90.cxx
             ;;

    0.3.1.6) echo "Getting and fitting phase..."
             cd ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitPhase/
             cd GetPhase/
             root -l -q GetPhase.cxx
             cd ../DrawFit/
             root -l -q DrawFit_0_0.cxx
             root -l -q DrawFit_0_90.cxx
             root -l -q DrawFit_90_90.cxx
             ;;

    0.3.2) echo "Combinations of ten cross sections with random relative phase"
           ;;

    0.3.2.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithRandPhase
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithRandPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithRandPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithRandPhase/cross
             ;;

    0.3.2.2) echo "Generating cross sections with random branch fractions and random relative pases as well as combinations and fitting..."
             cd ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase
             hep_sub -g physics job
             ;;
   
    0.3.2.3) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/Table/Find/
             ./FindBf.sh
             ./FindPhase.sh
             ;;
  
    0.3.2.4) echo "Making table..."
             cd ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/Table/MakeTable/
             root -l -q MakeTable.cxx
             ;;

    0.3.2.5) echo "Getting and fitting relative difference..."
             cd ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitBfRelativeDiff/
             cd CalRelativeDiff/
             root -l -q CalRelativeDiff.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

    0.3.2.6) echo "Getting and fitting phase..."
             cd ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitPhase/
             cd GetPhase/
             root -l -q GetPhase.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

    0.3.3) echo "Combinations of fifty cross sections with random relative pases"
           ;;

    0.3.3.1) echo "Building necessary directories..."
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase 
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase/rootfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase/logfile
             mkdir /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase/cross
             ;;

    0.3.3.2) echo "Generating cross sections with random branch fractions and random relative pases as well as combinations and fitting..."
             cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/
             hep_sub -g physics job
             ;;

    0.3.3.3) echo "Getting branch fractions and relative phases..."
             cd ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/Table/Find/
             ./FindBf.sh
             ./FindPhase.sh
             ;;

    0.3.3.4) echo "Making table..."
             cd ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/Table/MakeTable/
             root -l -q MakeTable.cxx
             ;;

    0.3.3.5) echo "Getting and fitting relative difference..."
             cd ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/
             cd CalRelativeDiff/
             root -l -q CalRelativeDiff.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

    0.3.3.6) echo "Getting and fitting phase..."
             cd ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitPhase/
             cd GetPhase/
             root -l -q GetPhase.cxx
             cd ../DrawFit/
             root -l -q DrawFit.cxx
             ;;

esac
