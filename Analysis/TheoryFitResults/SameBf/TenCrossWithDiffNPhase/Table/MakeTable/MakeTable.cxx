#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void MakeTable(){

     const int tot = 100;

     // load files
     ofstream table;
     table.open("Table.txt");
     ifstream Bf("../Find/Bf.txt");
     ifstream Phase("../Find/Phase.txt");
     //ifstream Combination("../../../../../TheoryFit/SameBf/TenCrossWithDiffNPhase/GenCombination/combination.txt");

     // read 
     double bf[tot],bferr[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf>>bf[i]>>bferr[i];
     }

     double phase[tot],phaseerr[tot];
     for (Int_t i=0;i<tot;i++){ 
         Phase>>phase[i]>>phaseerr[i];
     }

     //int N,tag[tot][10];
     //for (Int_t i=0;i<tot;i++){
     //    Combination>>N>>tag[i][0]>>tag[i][1]>>tag[i][2]>>tag[i][3]>>tag[i][4]>>tag[i][5]>>tag[i][6]>>tag[i][7]>>tag[i][8]>>tag[i][9];
     //}

     // output
         table<<"Number"<<"\t"<<"Branch Ratio"<<"\t"<<"Output Phase"<<"\t"<<"Output Branch Ratio"<<"\t"<<"Relative Difference(%)"<<endl;
     for (Int_t i=0;i<tot;i++){
         table<<i<<"\t"<<"0.10"<<"\t"<<phase[i]<<"+/-"<<phaseerr[i]<<"\t"<<bf[i]<<"+/-"<<bferr[i]<<"\t"<<(bf[i]-0.1)/0.1<<endl;
     }

     table.close();
     Bf.close();     
     Phase.close();
     //Combination.close();

}
