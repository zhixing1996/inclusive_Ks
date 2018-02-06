# Inclusive Ks study

You can get the source codes from https://github.com/zhixing1996/inclusive_Ks.git .

## Reset the programs 

> ./Run/reset.sh 

## Note

> Please fix hard codes in: Combination/fit_ks_phase.C, seed_combination/fit_ks_phase.C, Table/Find/FindBf.sh, Table/Find/FindPhase.sh, Run/cleanup.sh and Run/submit.sh before running.

## Start

ROOT verion 5.34.09, BOSS version 665p01

> ./Run/submit.sh

This program contains the following study:

> Research of branching fraction of inclusive Ks by studying relative phase brach fraction

## Research of branching fraction of inclusive Ks by studying relative phase brach fraction

> Combinations of two cross sections with different relative phase(0~90)

- RESULTS PATH:./Analysis/TheoryFit/TwoCrossCombinationWithSameBfDiffPhase/Table/MakeTable

> Combinations of ten cross sections with different number of relative phase 90

- RESULTS PATH:./Analysis/TheoryFit/TenCrossCombinationWithSameBfDiffNPhase/Table/MakeTable

> Combinations of fifty cross sections with same branch fractions and random relative phases

- RESULTS PATH:./Analysis/TheoryFit/FiftyCrossCombinationWithSameBfRandPhase/Table/MakeTable

> Combinations of fifty cross secctions with divided branch fractions and random relative phases (dominat process occupy 15% of branch fraction the sum of others is 35%)

- RESULTS PATH:./Analysis/TheoryFit/FiftyCrossCombinationWithDividedBfRandPhase/Table/MakeTable

## For developers 

- Fork the code with your personal github ID. See [details](https://help.github.com/articles/fork-a-repo/)

> git clone https://github.com/zhixing1996/inclusive_Ks.git .

- Make your change, commit and push 

> git commit -a -m "Added feature A, B, C"

> git push

- Make a pull request. See [details](https://help.github.com/articles/using-pull-requests/)

## Some styles to follow 
- Minimize the number of main c++ files 
- Keep functions length less than one screen
- Seperate hard-coded cuts into script file
- Use pull-request mode on git 
- Document well the high-level bash file for work flow 


