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
    printf "\n\t%-9s  %-40s"  "0.1.1"      "[Clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination]"
    printf "\n\t%-9s  %-40s"  "0.1.2"      "[Clean files in ./inclusive_Ks/TwoCrossCombination]"
    printf "\n\t%-9s  %-40s"  "0.2"      "[Clean files for combinations of ten cross section with different number of relative phase 90]"       
    printf "\n\t%-9s  %-40s"  "0.2.1"      "[Clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombination]"
    printf "\n\t%-9s  %-40s"  "0.2.2"      "[Clean files in ./inclusive_Ks/TenCrossCombination]"
    printf "\n\t%-9s  %-40s"  "0.3"      "[Clean files for combinations of fifty cross secctions with same branch fractions]" 
    printf "\n\t%-9s  %-40s"  "0.3.1"      "[Clean directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/FifityCrossCombinationWithSameBf]"
    printf "\n\t%-9s  %-40s"  "0.3.2"      "[Clean files in ./inclusive_Ks/FiftyCrossCombinationWithSameBf]"
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
    0.1.1) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination -rf
           ;;
    0.1.2) echo "Cleaning files in ./inclusive_Ks/TwoCrossCombination..."
           cd ../TwoCrossCombination
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
           cd ../../Run
           ;;

    # --------------------------------------------------------------------------------------------------
    #  0.2 Clean files for combinations of ten cross sections with different number of relative phase 90
    # --------------------------------------------------------------------------------------------------

    0.2) echo "Cleaning files for combinations of ten cross sections with different number of relative phase 90..."
         ;;
    0.2.1) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombination..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombination -rf
           ;;
    0.2.2) echo "Cleaning files in ./inclusive_Ks/TenCrossCombination..."
           cd ../TenCrossCombination
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
           cd ../../Run
           ;;

    # -------------------------------------------------------------------------------------
    #  0.3 Clean files for combinations of fifty cross secctions with same branch fractions
    # -------------------------------------------------------------------------------------

    0.3) echo "Cleaning files for combinations of fifty cross sections with same branch fractions..."
         ;;
    0.3.1) echo "Cleaning directory /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBf..."
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBf -rf
           ;;
    0.3.2) echo "Cleaning files in ./inclusive_Ks/FiftyCrossCombinationWithSameBf..."
           cd ../FiftyCrossCombinationWithSameBf
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
           cd ../../Run
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

           # TwoCrossCombination
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TwoCrossCombination -rf
           cd ../TwoCrossCombination
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
           cd ../../Run

           # TenCrossCombination
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/TenCrossCombination -rf
           cd ../TenCrossCombination
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
           cd ../../Run

           # FiftyCrossCombinationWithSameBf
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks/FiftyCrossCombinationWithSameBf -rf
           cd ../FiftyCrossCombinationWithSameBf
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
           cd ../../Run
        
           rm /besfs/groups/tauqcd/jingmq/inclusive_Ks -rf
         ;;

esac
