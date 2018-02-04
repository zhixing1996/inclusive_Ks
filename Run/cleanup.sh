#!/usr/bin/env bash

# Reset the programs
# Author Maoqiang Jing <jingmq@ihep.ac.cn>
# Created [2018-02-03 Sat 21:19]

usage() {
    printf "NAME\n\trun.sh - Reset the programs\n"
    printf "\nSYNOPSIS\n"
    printf "\n\t%-5s\n" "./cleanup.sh [OPTION]"
    printf "\nOPTIONS\n"    
    printf "\n\t%-9s  %-40s"  "0.1"      "[Clean files for combinations of two cross sections with different relative phase(0~90)]"       
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase]"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Clean files in ../TwoCrossCombinationWithSameBfDiffPhase]"
    printf "\n\t%-9s  %-40s"  "0.1.3"      "[Clean files in ../TwoCrossCombinationWithSameBfDiffPhase/Table]"
    printf "\n\t%-9s  %-40s"  "0.2"      "[Clean files for combinations of ten cross section with different number of relative phase 90]"       
    printf "\n\t%-9s  %-40s"  "0.2.1"      "[Clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase]"
    printf "\n\t%-9s  %-40s"  "0.2.2"      "[Clean files in ../TenCrossCombinationWithSameBfDiffNPhase]"
    printf "\n\t%-9s  %-40s"  "0.2.3"      "[Clean files in ../TenCrossCombinationWithSameBfDiffNPhase/Table]"
    printf "\n\t%-9s  %-40s"  "0.3"      "[Clean files for combinations of fifty cross secctions with same branch fractions and random relative phases]" 
    printf "\n\t%-9s  %-40s"  "0.3.1"      "[Clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/FifityCrossCombinationWithSameBf]"
    printf "\n\t%-9s  %-40s"  "0.3.2"      "[Clean files in ../FiftyCrossCombinationWithSameBfRandPhase]"
    printf "\n\t%-9s  %-40s"  "0.3.3"      "[Clean files in ../FiftyCrossCombinationWithSameBfRandPhase/Table]"
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

    # -------------------------------------------------------------------------------------------
    #  0.1 Clean files for combinations of two cross sections with different relative phase(0~90)
    # -------------------------------------------------------------------------------------------

    0.1) echo "Cleaning files for combinations of two cross sections with different relative phase(0~90)..."
         ;;
    0.1.1) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase -rf
           ;;
    0.1.2) echo "Cleaning files in ../TwoCrossCombinationWithSameBfDiffPhase..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase
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
           cd ../../../../Run
           ;;
    0.1.3) echo "Cleaning files in ../TwoCrossCombinationWithSameBfDiffPhase/Table..."
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../Run
           ;;

    # --------------------------------------------------------------------------------------------------
    #  0.2 Clean files for combinations of ten cross sections with different number of relative phase 90
    # --------------------------------------------------------------------------------------------------

    0.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
         ;;
    0.2.1) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase -rf
           ;;
    0.2.2) echo "Cleaning files in ../TenCrossCombinationWithSameBfDiffNPhase..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase
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
           cd ../../../../Run
           ;;
    0.2.3) echo "Cleaning files in ../TenCrossCombinationWithSameBfDiffNPhase/Table..."
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../Run
           ;;

    # ----------------------------------------------------------------------------------------------------------------
    #  0.3 Clean files for combinations of fifty cross secctions with same branch fractions and random relative phases
    # ----------------------------------------------------------------------------------------------------------------

    0.3) echo "Cleaning files for combinations of fifty cross sections with same branch fractions..."
         ;;
    0.3.1) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase -rf
           ;;
    0.3.2) echo "Cleaning files in ../FiftyCrossCombinationWithSameBfRandPhase..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase
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
           cd ../../../../Run
           ;;
    0.3.3) echo "Cleaning files in ../FiftyCrossCombinationWithSameBfRandPhase/Table..."
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../Run
           ;;

    # -------------------------------------------------------------------------------
    #  0.6 End of cleaning (clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks)
    # -------------------------------------------------------------------------------

    0.6) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks..."
         rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

    # --------------
    #  0.7 Clean all
    # --------------

    0.7) echo "Cleaning all..."

           # TwoCrossCombinationWithSameBfDiffPhase
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombinationWithSameBfDiffPhase -rf
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase
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
           cd ../../../../Run
           cd ../Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../Run

           # TenCrossCombinationWithSameBfDiffNPhase
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombinationWithSameBfDiffNPhase -rf
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase
           for i in 0 90
           do
               rm $i -rf
           done
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../../../Run
           cd ../Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../Run

           # FiftyCrossCombinationWithSameBfRandPhase
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBfRandPhase -rf
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase
           for (( i =0; i<91; i= i+1))
           do
               rm $i -rf
           done
           cd GenCombination
           rm combination.txt combination -rf
           cd ../Combination
           rm combination.txt -rf
           rm fit_ks_phase -rf
           rm job.* -rf
           cd ../../../../Run
           cd ../Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/Table
           cd Find
           rm *txt -rf
           cd ../MakeTable
           rm *txt -rf
           cd ../../../../../Run
        
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

esac
