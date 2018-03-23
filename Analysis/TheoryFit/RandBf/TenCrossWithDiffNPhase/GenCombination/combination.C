#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
using namespace std;

int main(){

    int c[10];
    int num=0;

    ofstream combination("combination.txt");

    for(int i=0; i<=1024;i++){
        int j = 0;
        for(int k=0;k<10;k++){
            c[k] = 0;
        }
        do {
          c[j++]=num%2;
          num/=2;
        } while(num!=0);
        num = i;
        for(int k=9;k>=0;k--){
            if(c[k]==1) c[k]=90;
        }
        combination<<i<<" ";
        for(int k=9;k>=0;k--) combination<<c[k]<<" ";
        combination<<endl;
        num++;
    }

    return 0;

}
