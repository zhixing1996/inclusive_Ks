#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void MakeTable(){

     const int tot = 50;

     // load files
     ofstream table;
     table.open("Table.txt");
     ifstream Bf("../Find/Bf.txt");
     ifstream Phase("../Find/Phase.txt");

     // read 
     double bf[tot],bferr[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf>>bf[i]>>bferr[i];
     }

     double phase[tot],phaseerr[tot];
     for (Int_t i=0;i<tot;i++){ 
         Phase>>phase[i]>>phaseerr[i];
     }

     // output
         table<<"Specific combinations of phase can be founde in ../../../../../TheoryFit/RandBf/TwoCrossWithDiffPhase/Combination/CombinationX(X:1~50) with rank : Bf + Phase"<<endl;
         table<<"Number"<<"\t"<<"Branch Ratio"<<"\t"<<"Output Phase"<<"\t"<<"Output Branch Ratio"<<"\t"<<"Relative Difference(%)"<<endl;
     for (Int_t i=0;i<tot;i++){
         table<<i<<"\t"<<"0.025"<<"\t"<<phase[i]<<"+/-"<<phaseerr[i]<<"\t"<<bf[i]<<"+/-"<<bferr[i]<<"\t"<<(bf[i]-0.025)/0.025*100<<endl;
     }

     table.close();
     Bf.close();     
     Phase.close();

}
