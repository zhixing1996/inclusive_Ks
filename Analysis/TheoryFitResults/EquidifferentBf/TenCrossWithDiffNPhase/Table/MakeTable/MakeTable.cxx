#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void MakeTable(){

     const int tot = 1024;

     // load files
     ofstream table;
     table.open("Table.txt");
     ifstream Bf("../Find/Bf.txt");
     ifstream Phase("../Find/Phase.txt");
     ifstream Combination("../../../../../TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination.txt");

     // read 
     double bf[tot],bferr[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf>>bf[i]>>bferr[i];
     }

     double phase[tot],phaseerr[tot];
     for (Int_t i=0;i<tot;i++){ 
         Phase>>phase[i]>>phaseerr[i];
     }

     int N,tag[tot][10];
     for (Int_t i=0;i<tot;i++){
         Combination>>N>>tag[i][0]>>tag[i][1]>>tag[i][2]>>tag[i][3]>>tag[i][4]>>tag[i][5]>>tag[i][6]>>tag[i][7]>>tag[i][8]>>tag[i][9];
     }

     int Count[1024];

     for (Int_t i=0;i<tot;i++){
         Count[i]=0;
     }

     for (Int_t i=0;i<tot;i++){
         for (Int_t j=0;j<10;j++){
             if (tag[i][j]==90)
                Count[i]++;
         }
     }

     // output
     table<<"Branch Ratio: 0.01 0.015 0.02 0.025 0.03 0.035 0.04 0.045 0.05 0.055"<<endl;
     table<<"Specific combination can be seen in: /besfs/users/jingmq/workarea665p01/Analysis/Ks/inclusive_Ks/Analysis/TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination.txt with branch ratio rank stated above"<<endl;
     table<<"Number"<<"\t"<<"Branch Ratio"<<"\t"<<"Output Phase"<<"\t"<<"Output Branch Ratio"<<"\t"<<"Relative Difference(%)"<<endl;
     for (Int_t i=0;i<11;i++){
         table<<"Number of relative phase 90 degree equals "<<i<<endl;
         for (Int_t j=0;j<tot;j++){
               if (Count[j]==i)
                  table<<j+1<<"\t"<<"0.325"<<"\t"<<phase[j]<<"+/-"<<phaseerr[j]<<"\t"<<bf[j]<<"+/-"<<bferr[j]<<"\t"<<(bf[j]-0.325)/0.325*100<<endl;
         }
     }

     table.close();
     Bf.close();     
     Phase.close();
     Combination.close();

}
