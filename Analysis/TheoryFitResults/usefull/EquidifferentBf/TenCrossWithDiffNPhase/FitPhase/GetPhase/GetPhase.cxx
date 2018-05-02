#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void GetPhase(){

    const int tot = 1024;

    // load files
    ifstream Phase("../../Table/Find/Phase.txt");
    ifstream Combination("../../../../../TheoryFit/EquidifferentBf/TenCrossWithDiffNPhase/GenCombination/combination.txt");

    // read 
    double phase[tot],temp;
    for (Int_t i=0;i<tot;i++){         
        Phase>>phase[i]>>temp;
    }

    int N,tag[tot][10];
    for (Int_t i=0;i<tot;i++){
        Combination>>N>>tag[i][0]>>tag[i][1]>>tag[i][2]>>tag[i][3]>>tag[i][4]>>tag[i][5]>>tag[i][6]>>tag[i][7]>>tag[i][8]>>tag[i][9];
    }

    int Count[1024];

    for (Int_t i=0;i<tot;i++){
        Count[i]=0;
    }

    for (Int_t i=0;i<tot;i++){
        for (Int_t j=0;j<10;j++){
            if (tag[i][j]==90)
               Count[i]++;
        }
    }

    for (Int_t i=0;i<11;i++){
        stringstream stream1;
        stream1 << i;
        TString orange="./Phase"+stream1.str()+".txt";
        ofstream Temp(orange);
        for (Int_t j=0;j<tot;j++){
              if (Count[j]==i ){
                 // if (abs(phase[j])>180&&abs(phase[j]<540)&&phase[j]<0) phase[j] = phase[j] +360;
                 // if (abs(phase[j])>540&&abs(phase[j]<900)&&phase[j]<0) phase[j] = phase[j] +720;
                 // if (abs(phase[j])>900&&abs(phase[j]<1260)&&phase[j]<0) phase[j] = phase[j] +1080;
                 // if (abs(phase[j])>1260&&abs(phase[j]<1620)&&phase[j]<0) phase[j] = phase[j] +1440;
                 // if (abs(phase[j])>180&&abs(phase[j]<360)&&phase[j]<0) phase[j] = phase[j] +360;
                 // if (abs(phase[j])>360&&abs(phase[j]<720)&&phase[j]<0) phase[j] = phase[j] +360*2;
                 // if (abs(phase[j])>720&&abs(phase[j]<1080)&&phase[j]<0) phase[j] = phase[j] +360*3;
                 // if (abs(phase[j])>1080&&abs(phase[j]<1440)&&phase[j]<0) phase[j] = phase[j] +360*4;
                 // if (abs(phase[j])>1440&&abs(phase[j]<1800)&&phase[j]<0) phase[j] = phase[j] +360*5;
                 // if (abs(phase[j])>180&&abs(phase[j]<360)&&phase[j]>0) phase[j] = phase[j] -360;
                 // if (abs(phase[j])>360&&abs(phase[j]<720)&&phase[j]>0) phase[j] = phase[j] -360*2;
                 // if (abs(phase[j])>720&&abs(phase[j]<1080)&&phase[j]>0) phase[j] = phase[j] -360*3;
                 // if (abs(phase[j])>1080&&abs(phase[j]<1440)&&phase[j]>0) phase[j] = phase[j] -360*4;
                 // if (abs(phase[j])>1440&&abs(phase[j]<1800)&&phase[j]>0) phase[j] = phase[j] -360*5;
                 while (abs(phase[j])>90) phase[j] = phase[j]+360;
                 Temp<<phase[j]<<endl;
              }
        }
    }

    Phase.close();     
    Combination.close();

}
