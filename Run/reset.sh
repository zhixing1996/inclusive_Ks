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
    printf "\n\t%-9s  %-40s"  "0.1.1"      "Clean files for combinations of two cross sections with different relative phase(0,90)"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "Clean files for combinations of ten cross section with random relative phase"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "Clean files for combinations of fifty cross secctions with random relative phases"
    # printf "\n\t%-9s  %-40s"  "0.2"      "[Clean files for EquidifferentBf]"       
    # printf "\n\t%-9s  %-40s"  "0.2.1"      "Clean files for combinations of two cross sections with different relative phase(0,90)"
    # printf "\n\t%-9s  %-40s"  "0.2.2"      "Clean files for combinations of ten cross section with different number of relative phase 90"
    # printf "\n\t%-9s  %-40s"  "0.2.3"      "Clean files for combinations of fifty cross secctions with random relative phases"
    printf "\n\t%-9s  %-40s"  "0.3"      "[Clean files for RandBf]" 
    printf "\n\t%-9s  %-40s"  "0.3.1"      "Clean files for combinations of two cross sections with different relative phase(0,90)"
    printf "\n\t%-9s  %-40s"  "0.3.2"      "Clean files for combinations of ten cross section with random relative phase"
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

    0.1.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0,90)..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TwoCrossWithDiffPhase -rf
           for (( i =0; i<100; i= i+10))
           do
               rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/$i -rf
           done
           rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/GenCombination/combination.txt ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/GenCombination/combination -rf
           rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/combination.txt -rf
           rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/fit_ks_phase -rf
           rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/job.* -rf
           rm ../Analysis/TheoryFitResults/SameBf/TwoCrossWithDiffPhase/Table/Find/*txt -rf
           rm ../Analysis/TheoryFitResults/SameBf/TwoCrossWithDiffPhase/Table/MakeTable/*txt -rf
           ;;

    0.1.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithRandPhase -rf
           # for  i in 0 90
           # do
           #     rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/$i -rf
           # done
           # rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination/combination.txt ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination/combination -rf
           # rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Combination/combination.txt -rf
           # rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Combination/fit_ks_phase -rf
	   rm ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/Combination -rf
	   rm ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/EachPhase -rf
           rm ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/job.* -rf
           rm ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/Table/Find/*txt -rf
           rm ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/Table/MakeTable/*txt -rf
           ;;

    0.1.3) echo "Cleaning files for combinations of fifty cross sections with random relative phases..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase -rf
           for  (( i =0; i<91; i= i+1))
           do
               rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/$i -rf
           done
           rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/GenCombination/combination.txt ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/GenCombination/combination -rf
           rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/combination.txt -rf
           rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/fit_ks_phase -rf
           rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/job.* -rf
           rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/Table/Find/*txt -rf
           rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/Table/MakeTable/*txt -rf
           rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
           rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
           rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
           rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitPhase/DrawFit/*eps -rf
           ;;

    # ------------------------------------
    #  0.2 Clean files for EquidifferentBf
    # ------------------------------------

    # 0.2) echo "Cleaning files for EquidifferentBf..."
    #      ;;

    # 0.2.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0,90)..."
    #        rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/0.01 ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/0.015 -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/GenCombination/combination.txt ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/GenCombination/combination -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/combination.txt -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/fit_ks_phase -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/job.* -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TwoCrossWithDiffPhase/Table/Find/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TwoCrossWithDiffPhase/Table/MakeTable/*txt -rf
    #        ;;

    # 0.2.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
    #        rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TenCrossWithDiffNPhase -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/0.* -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination.txt ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/combination.txt -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/fit_ks_phase -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/job.* -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/Table/Find/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/Table/MakeTable/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitBfRelativeDiff/DrawFit/*eps -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitPhase/GetPhase/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitPhase/DrawFit/*eps -rf
    #        ;;

    # 0.2.3) echo "Cleaning files for combinations of fifty cross sections with random relative phases..."
    #        rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/Combination -rf
    #        rm ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/job.* -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/Table/Find/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/Table/MakeTable/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
    #        rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitPhase/DrawFit/*eps -rf
    #        ;;

    # ---------------------------
    #  0.3 Clean files for RandBf
    # ---------------------------

    0.3) echo "Cleaning files for RandBf..."
         ;;

    0.3.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0,90)..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase -rf
           rm ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase/Combination* -rf
           rm ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase/job.* -rf
           rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/Table/Find/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/Table/MakeTable/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitBfRelativeDiff/DrawFit/*eps -rf
           rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitPhase/GetPhase/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitPhase/DrawFit/*eps -rf
           ;;

    0.3.2) echo "Cleaning files for combinations of ten cross sections with random relative phase..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithRandPhase -rf
           rm ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase/Combination -rf
           rm ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase/EachPhase -rf
           rm ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase/job.* -rf
           rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/Table/Find/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/Table/MakeTable/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
           rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitPhase/DrawFit/*eps -rf
           ;;

    0.3.3) echo "Cleaning files for combinations of fifty cross sections with random relative phases..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase -rf
           rm ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/Combination -rf
           rm ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/EachPhase -rf
           rm ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/job.* -rf
           rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/Table/Find/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/Table/MakeTable/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
           rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
           rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitPhase/DrawFit/*eps -rf
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
         for (( i =0; i<100; i= i+10))
         do
             rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/$i -rf
         done
         rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/GenCombination/combination.txt ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/GenCombination/combination -rf
         rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/combination.txt -rf
         rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/fit_ks_phase -rf
         rm ../Analysis/TheoryFit/SameBf/TwoCrossWithDiffPhase/Combination/job.* -rf
         rm ../Analysis/TheoryFitResults/SameBf/TwoCrossWithDiffPhase/Table/Find/*txt -rf
         rm ../Analysis/TheoryFitResults/SameBf/TwoCrossWithDiffPhase/Table/MakeTable/*txt -rf

         # TenCrossWithDiffNPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/TenCrossWithRandPhase -rf
         rm ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/Combination -rf
         rm ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/EachPhase -rf
         # for  i in 0 90
         # do
         #     rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/$i -rf
         # done
         # rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination/combination.txt ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination/combination -rf
         # rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Combination/combination.txt -rf
         # rm ../Analysis/TheoryFit/SameBf/TenCrossWithDiffNPhase/Combination/fit_ks_phase -rf
         rm ../Analysis/TheoryFit/SameBf/TenCrossWithRandPhase/job.* -rf
         rm ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/Table/Find/*txt -rf
         rm ../Analysis/TheoryFitResults/SameBf/TenCrossWithRandPhase/Table/MakeTable/*txt -rf

         # FiftyCrossWithRandPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/SameBf/FiftyCrossWithRandPhase -rf
         for  (( i =0; i<91; i= i+1))
         do
             rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/$i -rf
         done
         rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/GenCombination/combination.txt ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/GenCombination/combination -rf
         rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/combination.txt -rf
         rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/fit_ks_phase -rf
         rm ../Analysis/TheoryFit/SameBf/FiftyCrossWithRandPhase/Combination/job.* -rf
         rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/Table/Find/*txt -rf
         rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/Table/MakeTable/*txt -rf
         rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
         rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
         rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
         rm ../Analysis/TheoryFitResults/SameBf/FiftyCrossWithRandPhase/FitPhase/DrawFit/*eps -rf

         # -------------------------------
         # Clean files for EquidifferentBf
         # -------------------------------

         # # TwoCrossWithDiffPhase
         # rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TwoCrossWithDiffPhase -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/0.01 ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/0.015 -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/GenCombination/combination.txt ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/GenCombination/combination -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/combination.txt -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/fit_ks_phase -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/Combination/job.* -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TwoCrossWithDiffPhase/Table/Find/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TwoCrossWithDiffPhase/Table/MakeTable/*txt -rf

         # # TenCrossWithDiffNPhase
         # rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/TenCrossWithDiffNPhase -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/0.* -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination.txt ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/combination.txt -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/fit_ks_phase -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/Combination/job.* -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/Table/Find/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/Table/MakeTable/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitBfRelativeDiff/DrawFit/*eps -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitPhase/GetPhase/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/TenCrossWithDiffNPhase/FitPhase/DrawFit/*eps -rf

         # # FiftyCrossWithRandPhase
         # rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/EquidifferentBf/FiftyCrossWithRandPhase -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/Combination -rf
         # rm ../Analysis/TheoryFit/EquidifferentBf/FiftyCrossWithRandPhase/job.* -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/Table/Find/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/Table/MakeTable/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
         # rm ../Analysis/TheoryFitResults/EquidifferentBf/FiftyCrossWithRandPhase/FitPhase/DrawFit/*eps -rf

         # ----------------------
         # Clean files for RandBf
         # ----------------------

         # TwoCrossWithDiffPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TwoCrossWithDiffPhase -rf
         rm ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase/Combination* -rf
         rm ../Analysis/TheoryFit/RandBf/TwoCrossWithDiffPhase/job.* -rf
         rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/Table/Find/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/Table/MakeTable/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitBfRelativeDiff/DrawFit/*eps -rf
         rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitPhase/GetPhase/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TwoCrossWithDiffPhase/FitPhase/DrawFit/*eps -rf

         # TenCrossWithDiffNPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/TenCrossWithRandPhase -rf
         rm ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase/Combination -rf
         rm ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase/EachPhase -rf
         rm ../Analysis/TheoryFit/RandBf/TenCrossWithRandPhase/job.* -rf
         rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/Table/Find/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/Table/MakeTable/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
         rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/TenCrossWithRandPhase/FitPhase/DrawFit/*eps -rf

         # FiftyCrossWithRandPhase
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/RandBf/FiftyCrossWithRandPhase -rf
         rm ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/Combination -rf
         rm ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/EachPhase -rf
         rm ../Analysis/TheoryFit/RandBf/FiftyCrossWithRandPhase/job.* -rf
         rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/Table/Find/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/Table/MakeTable/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/CalRelativeDiff/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitBfRelativeDiff/DrawFit/*eps -rf
         rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitPhase/GetPhase/*txt -rf
         rm ../Analysis/TheoryFitResults/RandBf/FiftyCrossWithRandPhase/FitPhase/DrawFit/*eps -rf

         # --------------------------------------------------------------------------
         # End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)
         # --------------------------------------------------------------------------
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

esac
