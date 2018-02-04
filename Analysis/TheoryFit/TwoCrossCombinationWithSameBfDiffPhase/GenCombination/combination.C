#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    int N=1;
    ofstream combination("combination.txt");
    int tag[10];
    for(int i=0;i<9;i++){
       for(int j=i+1;j<10;j++){
         for(int k=0;k<10;k++){
            tag[k]=0;
         }
         tag[i]=1;
         tag[j]=1;
         combination<<N<<" "<<tag[0]<<" "<<tag[1]<<" "<<tag[2]<<" "<<tag[3]<<" "<<tag[4]<<" "<<tag[5]<<" "<<tag[6]<<" "<<tag[7]<<" "<<tag[8]<<" "<<tag[9]<<" "<<endl;
         N++;
       }
    }
    return 0;
}
