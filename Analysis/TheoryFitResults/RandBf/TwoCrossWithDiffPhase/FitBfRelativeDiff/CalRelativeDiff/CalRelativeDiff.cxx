#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void CalRelativeDiff(){

     const int tot = 100;

     // load files
     ofstream RelativeDiff_0_0;
     ofstream RelativeDiff_0_90;
     ofstream RelativeDiff_90_90;
     RelativeDiff_0_0.open("RelativeDiff_0_0.txt");
     RelativeDiff_0_90.open("RelativeDiff_0_90.txt");
     RelativeDiff_90_90.open("RelativeDiff_90_90.txt");
     ifstream Bf_0_0("../../Table/Find/Bf_0_0.txt");
     ifstream Bf_0_90("../../Table/Find/Bf_0_90.txt");
     ifstream Bf_90_90("../../Table/Find/Bf_90_90.txt");

     // read 
     double bf_0_0[tot],bferr_0_0[tot];
     double bf_0_90[tot],bferr_0_90[tot];
     double bf_90_90[tot],bferr_90_90[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf_0_0>>bf_0_0[i]>>bferr_0_0[i];
         Bf_0_90>>bf_0_90[i]>>bferr_0_90[i];
         Bf_90_90>>bf_90_90[i]>>bferr_90_90[i];
     }

     // output
     for (Int_t i=0;i<tot;i++){
         RelativeDiff_0_0<<(bf_0_0[i]-0.025)/0.025*100<<endl;
         RelativeDiff_0_90<<(bf_0_90[i]-0.025)/0.025*100<<endl;
         RelativeDiff_90_90<<(bf_90_90[i]-0.025)/0.025*100<<endl;
     }

     RelativeDiff_0_0.close();
     RelativeDiff_0_90.close();
     RelativeDiff_90_90.close();
     Bf_0_0.close();     
     Bf_0_90.close();     
     Bf_90_90.close();     

}
