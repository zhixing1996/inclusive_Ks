#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void GetPhase(){

     const int tot = 100;

     // load files
     ofstream Phase_0_0;
     ofstream Phase_0_90;
     ofstream Phase_90_90;
     Phase_0_0.open("Phase_0_0.txt");
     Phase_0_90.open("Phase_0_90.txt");
     Phase_90_90.open("Phase_90_90.txt");
     ifstream PHASE_0_0("../../Table/Find/Phase_0_0.txt");
     ifstream PHASE_0_90("../../Table/Find/Phase_0_90.txt");
     ifstream PHASE_90_90("../../Table/Find/Phase_90_90.txt");

     // read 
     double phase_0_0[tot],temp;
     double phase_0_90[tot];
     double phase_90_90[tot];
     for (Int_t i=0;i<tot;i++){         
         PHASE_0_0>>phase_0_0[i]>>temp;
         PHASE_0_90>>phase_0_90[i]>>temp;
         PHASE_90_90>>phase_90_90[i]>>temp;
     }

     // output
     for (Int_t i=0;i<tot;i++){
         Phase_0_0<<phase_0_0[i]<<endl;
         Phase_0_90<<phase_0_90[i]<<endl;
         Phase_90_90<<phase_90_90[i]<<endl;
     }

     Phase_0_0.close();
     Phase_0_90.close();
     Phase_90_90.close();
     PHASE_0_0.close();     
     PHASE_0_90.close();     
     PHASE_90_90.close();     

}
