#!/usr/bin/env bash

# Reset the programs
# Author Maoqiang Jing <jingmq@ihep.ac.cn>
# Created [2018-02-03 Sat 21:19]

usage() {
    printf "NAME\n\trun.sh - Reset the programs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./reset.sh [OPTION]"
    printf "\nOPTIONS\n"    
    printf "\n\t%-9s  %-40s"  "0.1"      "[Clean files for SameBf]"       
    printf "\n\t%-9s  %-40s"  "0.1.1"      "Clean files for combinations of two cross sections with different relative phase(0~90)"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "Clean files for combinations of ten cross section with different number of relative phase 90"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "Clean files for combinations of fifty cross secctions with random relative phases"
    printf "\n\t%-9s  %-40s"  "0.2"      "[Clean files for EquidifferentBf]"       
    printf "\n\t%-9s  %-40s"  "0.2.1"      "Clean files for combinations of two cross sections with different relative phase(0~90)"
    printf "\n\t%-9s  %-40s"  "0.2.2"      "Clean files for combinations of ten cross section with different number of relative phase 90"
    printf "\n\t%-9s  %-40s"  "0.2.3"      "Clean files for combinations of fifty cross secctions with random relative phases"
    printf "\n\t%-9s  %-40s"  "0.3"      "[Clean files for RandBf]" 
    printf "\n\t%-9s  %-40s"  "0.3.1"      "Clean files for combinations of two cross sections with different relative phase(0~90)"
    printf "\n\t%-9s  %-40s"  "0.3.2"      "Clean files for combinations of ten cross section with different number of relative phase 90"
    printf "\n\t%-9s  %-40s"  "0.3.3"      "Clean files for combinations of fifty cross secctions with random relative phases"
    printf "\n\t%-9s  %-40s"  "0.4"      "[End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)]"
    printf "\n\t%-9s  %-40s"  "1.0"      "[Clean all]"
}


if [[ $# -eq 0 ]]; then
    usage
    printf "\nPlease enter your option: "
    read option
else
    option=$1
fi

case $option in

    # ---------------------------
    #  0.1 Clean files for SameBf
    # ---------------------------

    0.1) echo "Cleaning files for SameBf..."
         ;;

    0.1.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0~90)..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase -rf
           cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase
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
           cd ../../../../../Run
           cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    0.1.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithDiffNPhase -rf
           cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase
           for  i in 0 90
           do
               rm $i -rf
           done
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../../../../Run
           cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    0.1.3) echo "Cleaning files for combinations of fifty cross sections with random relative phases..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase -rf
           cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase
           for  (( i =0; i<91; i= i+1))
           do
               rm $i -rf
           done
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../../../../Run
           cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    # ------------------------------------
    #  0.2 Clean files for EquidifferentBf
    # ------------------------------------

    0.2) echo "Cleaning files for EquidifferentBf..."
         ;;

    0.2.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0~90)..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase -rf
           cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase
           rm 0.01 0.015 -rf
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../../../../Run
           cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    0.2.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
           ;;

    0.2.3) echo "Cleaning files for combinations of fifty cross sections with random relative phases..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase -rf
           cd ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase
           rm Combination -rf
           rm job.* -rf
           cd ../../../../Run
           cd ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    # ---------------------------
    #  0.3 Clean files for RandBf
    # ---------------------------

    0.3) echo "Cleaning files for RandBf..."
         ;;

    0.3.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0~90)..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase -rf
           cd ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase
           rm Combination -rf
           rm job.* -rf
           cd ../../../../Run
           cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    0.3.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithDiffNPhase -rf
           cd ../Analysis/TheoryFit/RandBf/TenCrossWithDiffNPhase
           rm Combination -rf
           rm job.* -rf
           cd ../../../../Run
           ;;

    0.3.3) echo "Cleaning files for combinations of fifty cross sections with random relative phases..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase -rf
           cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase
           rm Combination -rf
           rm EachPhase -rf
           rm job.* -rf
           cd ../../../../Run
           cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../../Run
           ;;

    # -------------------------------------------------------------------------------
    #  0.4 End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)
    # -------------------------------------------------------------------------------

    0.4) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks..."
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

    # --------------
    #  1.0 Clean all
    # --------------

    1.0) echo "Cleaning all..."
         # ----------------------
         # Clean files for SameBf
         # ----------------------

         # TwoCrossWithDiffPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase -rf
         cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase
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
         cd ../../../../../Run
         cd ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # TenCrossWithDiffNPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithDiffNPhase -rf
         cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase
         for  i in 0 90
         do
             rm $i -rf
         done
         cd GenCombination
         rm combination.txt combination -rf
         cd ../Combination
         rm combination.txt -rf
         rm fit_ks_phase -rf
         rm job.* -rf
         cd ../../../../../Run
         cd ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # FiftyCrossWithRandPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase -rf
         cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase
         for  (( i =0; i<91; i= i+1))
         do
             rm $i -rf
         done
         cd GenCombination
         rm combination.txt combination -rf
         cd ../Combination
         rm combination.txt -rf
         rm fit_ks_phase -rf
         rm job.* -rf
         cd ../../../../../Run
         cd ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # -------------------------------
         # Clean files for EquidifferentBf
         # -------------------------------

         # TwoCrossWithDiffPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase -rf
         cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase
         rm 0.01 0.015 -rf
         cd GenCombination
         rm combination.txt combination -rf
         cd ../Combination
         rm combination.txt -rf
         rm fit_ks_phase -rf
         rm job.* -rf
         cd ../../../../../Run
         cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # TenCrossWithDiffNPhase

         # FiftyCrossWithRandPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase -rf
         cd ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase
         rm Combination -rf
         rm job.* -rf
         cd ../../../../Run
         cd ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # ----------------------
         # Clean files for RandBf
         # ----------------------

         # TwoCrossWithDiffPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase -rf
         cd ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase
         rm Combination -rf
         rm job.* -rf
         cd ../../../../Run
         cd ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # TenCrossWithDiffNPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithDiffNPhase -rf
         cd ../Analysis/TheoryFit/RandBf/TenCrossWithDiffNPhase
         rm Combination -rf
         rm job.* -rf
         cd ../../../../Run

         # FiftyCrossWithRandPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase -rf
         cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase
         rm Combination -rf
         rm EachPhase -rf
         rm job.* -rf
         cd ../../../../Run
         cd ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/Table
         cd Find
         rm *txt -rf
         cd ../MakeTable
         rm *txt -rf
         cd ../../../../../../Run

         # --------------------------------------------------------------------------
         # End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)
         # --------------------------------------------------------------------------
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

esac
