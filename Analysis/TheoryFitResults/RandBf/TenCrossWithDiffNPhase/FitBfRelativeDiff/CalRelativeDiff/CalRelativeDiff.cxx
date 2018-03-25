#include <iostream.h>
#include <iomanip.h>
#include <stdio.h>

  using namespace std;

void CalRelativeDiff(){

    const int tot = 1024;

    // load files
    ifstream Bf("../../Table/Find/Bf.txt");
    ifstream Combination("../../../../../TheoryFit/RandBf/TenCrossWithDiffNPhase/GenCombination/combination.txt");

    // read 
    double bf[tot],bferr[tot];
    for (Int_t i=0;i<tot;i++){         
        Bf>>bf[i]>>bferr[i];
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
        TString orange="./RelativeDiff"+stream1.str()+".txt";
        ofstream Temp(orange);
        for (Int_t j=0;j<tot;j++){
              if (Count[j]==i )
                 Temp<<(bf[j]-0.1)/0.1*100<<endl;
        }
    }

    Bf.close();     
    Combination.close();

}
