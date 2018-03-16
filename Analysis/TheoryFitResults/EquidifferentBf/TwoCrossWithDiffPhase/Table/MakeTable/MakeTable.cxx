#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void MakeTable(){

     const int tot = 2;

     // load files
     ofstream table;
     table.open("Table.txt");
     ifstream Bf("../Find/Bf.txt");
     ifstream Phase("../Find/Phase.txt");
     ifstream Combination("../../../../../TheoryFit/EquidifferentBf/TwoCrossWithDiffPhase/GenCombination/combination.txt");

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
         Combination>>N>>tag[i][0]>>tag[i][1];
     }

     // output
         table<<"Phase (degree) : Phase A & Phase B"<<"\t"<<"Branch Ratio"<<"\t"<<"Output Phase"<<"\t"<<"Output Branch Ratio"<<"Relative Difference(%)"<<endl;
     for (Int_t i=0;i<tot;i++){
         table<<tag[i][0]<<" "<<tag[i][1]<<"\t"<<"0.025"<<"\t"<<phase[i]<<"+/-"<<phaseerr[i]<<"\t"<<bf[i]<<"+/-"<<bferr[i]<<"\t"<<(bf[i]-0.025)/0.025*100<<endl;
     }

     table.close();
     Bf.close();     
     Phase.close();
     Combination.close();

}
