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
     ifstream Combination("../../GenCombination/combination.txt");

     // read 
     double bf[tot],bferr[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf>>bf[i]>>bferr[i];
     }

     double phase[tot],phaseerr[tot];
     for (Int_t i=0;i<tot;i++){ 
         Phase>>phase[i]>>phaseerr[i];
     }

     int N[tot];
     for (Int_t i=0;i<tot;i++){
         //Combination>>N[i];
     }

     // output
         table<<"Specific combinations of phase can be founde in ../../GenCombination/combination.txt with rank : Number + 50 degrees"<<endl;
         table<<"Number"<<"\t"<<"Sum of Branch Ratio"<<"\t"<<"Output Phase";
         table<<"\t"<<"Output Branch Ratio"<<"\t"<<endl;
     for (Int_t i=0;i<tot;i++){
         table<<i<<"\t";
         table<<"\t"<<"0.5"<<"\t"<<phase[i]<<"+/-"<<phaseerr[i]<<"\t"<<bf[i]<<"+/-"<<bferr[i]<<" "<<endl;
     }

     table.close();
     Bf.close();     
     Phase.close();
     Combination.close();

}
