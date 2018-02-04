#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <iostream>
#include <fstream>
using namespace std;


double myrand(){
  int phase;
  int Min = 0, Max = 90;
  phase = Min+rand()%(Max-Min+1) ;  
  return phase;
}

int main(){
  srand ( time(NULL) );
  ofstream pars;
  pars.open("combination.txt");
  int Num[150][50];
  for(int i=0;i<100;i++){
    pars<<i<<" ";
    for(int j=0;j<50;j++){
      Num[i][j] = myrand();
      pars<<" "<<Num[i][j]<<" ";
    }
    pars<<endl;
  }
  pars.close();
  return 0;
}
