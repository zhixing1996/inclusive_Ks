#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void GetPhase(){

     const int tot = 50;

     // load files
     ofstream Phase;
     Phase.open("Phase.txt");
     ifstream PHASE("../../Table/Find/Phase.txt");

     // read 
     double phase[tot],temp;
     for (Int_t i=0;i<tot;i++){         
         PHASE>>phase[i]>>temp;
     }

     // output
     for (Int_t i=0;i<tot;i++){
         Phase<<phase[i]<<endl;
     }

     Phase.close();
     PHASE.close();     

}
