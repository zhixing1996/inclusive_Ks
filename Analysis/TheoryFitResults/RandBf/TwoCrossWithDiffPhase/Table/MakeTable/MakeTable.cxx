#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void MakeTable(){

     const int tot = 100;

     // load files
     ofstream table;
     table.open("Table.txt");
     ifstream Bf_0_0("../Find/Bf_0_0.txt");
     ifstream Phase_0_0("../Find/Phase_0_0.txt");
     ifstream Bf_0_90("../Find/Bf_0_90.txt");
     ifstream Phase_0_90("../Find/Phase_0_90.txt");
     ifstream Bf_90_90("../Find/Bf_90_90.txt");
     ifstream Phase_90_90("../Find/Phase_90_90.txt");

     // read 
     double bf_0_0[tot],bferr_0_0[tot];
     double bf_0_90[tot],bferr_0_90[tot];
     double bf_90_90[tot],bferr_90_90[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf_0_0>>bf_0_0[i]>>bferr_0_0[i];
         Bf_0_90>>bf_0_90[i]>>bferr_0_90[i];
         Bf_90_90>>bf_90_90[i]>>bferr_90_90[i];
     }

     double phase_0_0[tot],phaseerr_0_0[tot];
     double phase_0_90[tot],phaseerr_0_90[tot];
     double phase_90_90[tot],phaseerr_90_90[tot];
     for (Int_t i=0;i<tot;i++){ 
         Phase_0_0>>phase_0_0[i]>>phaseerr_0_0[i];
         Phase_0_90>>phase_0_90[i]>>phaseerr_0_90[i];
         Phase_90_90>>phase_90_90[i]>>phaseerr_90_90[i];
     }

     // output
     table<<"Specific combinations of phase can be founde in ../../../../../TheoryFit/RandBf/TwoCrossWithDiffPhase/Combination/CombinationX(X:1~50) with rank : Bf + Phase"<<endl;
     table<<"Number"<<"\t"<<"Branch Ratio"<<"\t"<<"Output Phase"<<"\t"<<"Output Branch Ratio"<<"\t"<<"Relative Difference(%)"<<endl;

     table<<"Results of 0 0 combinations"
     for (Int_t i=0;i<tot;i++){
         table<<i<<"\t"<<"0.025"<<"\t"<<phase_0_0[i]<<"+/-"<<phaseerr_0_0[i]<<"\t"<<bf_0_0[i]<<"+/-"<<bferr_0_0[i]<<"\t"<<(bf_0_0[i]-0.025)/0.025*100<<endl;
     }

     table<<"Results of 0 90 combinations"
     for (Int_t i=0;i<tot;i++){
         table<<i<<"\t"<<"0.025"<<"\t"<<phase_0_90[i]<<"+/-"<<phaseerr_0_90[i]<<"\t"<<bf_0_90[i]<<"+/-"<<bferr_0_90[i]<<"\t"<<(bf_0_90[i]-0.025)/0.025*100<<endl;
     }

     table<<"Results of 90 90 combinations"
     for (Int_t i=0;i<tot;i++){
         table<<i<<"\t"<<"0.025"<<"\t"<<phase_90_90[i]<<"+/-"<<phaseerr_90_90[i]<<"\t"<<bf_90_90[i]<<"+/-"<<bferr_90_90[i]<<"\t"<<(bf_90_90[i]-0.025)/0.025*100<<endl;
     }

     table.close();
     Bf_0_0.close();     
     Bf_0_90.close();     
     Bf_90_90.close();     
     Phase_0_0.close();
     Phase_0_90.close();
     Phase_90_90.close();

}
