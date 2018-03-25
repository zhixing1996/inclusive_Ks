#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void CalRelativeDiff(){

     const int tot = 100;

     // load files
     ofstream RelativeDiff;
     RelativeDiff.open("RelativeDiff.txt");
     ifstream Bf("../../Table/Find/Bf.txt");

     // read 
     double bf[tot],bferr[tot];
     for (Int_t i=0;i<tot;i++){         
         Bf>>bf[i]>>bferr[i];
     }

     // output
     for (Int_t i=0;i<tot;i++){
         RelativeDiff<<(bf[i]-0.491)/0.491*100<<endl;
     }

     RelativeDiff.close();
     Bf.close();     

}
