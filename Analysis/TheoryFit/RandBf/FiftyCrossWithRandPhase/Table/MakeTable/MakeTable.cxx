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
         table<<"Specific combinations of phase can be founde in ../../Combination "<<endl;
         table<<"Number"<<"\t"<<"Sum of Branch Ratio"<<"\t"<<"Output Phase";
         table<<"\t"<<"Output Branch Ratio"<<"\t"<<endl;
     for (Int_t i=1;i<tot+1;i++){
         table<<i<<"\t";
         table<<"\t"<<"0.5"<<"\t"<<phase[i-1]<<"+/-"<<phaseerr[i-1]<<"\t"<<bf[i-1]<<"+/-"<<bferr[i-1]<<" "<<endl;
     }

     table.close();
     Bf.close();     
     Phase.close();

}
