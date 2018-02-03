#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    int N=0;
    ofstream combination("combination.txt");
    int tag[10];
    for(int i=0;i<10;i++){
       tag[i]=0;
    }
    for(int i=0;i<11;i++){
       if(i>0){
         for(int j=0;j<i;j++)
            tag[j]=1;
       }
       else combination<<N<<" "<<tag[0]<<" "<<tag[1]<<" "<<tag[2]<<" "<<tag[3]<<" "<<tag[4]<<" "<<tag[5]<<" "<<tag[6]<<" "<<tag[7]<<" "<<tag[8]<<" "<<tag[9]<<" "<<endl;
       if(i>=1){
       combination<<N<<" "<<tag[0]<<" "<<tag[1]<<" "<<tag[2]<<" "<<tag[3]<<" "<<tag[4]<<" "<<tag[5]<<" "<<tag[6]<<" "<<tag[7]<<" "<<tag[8]<<" "<<tag[9]<<" "<<endl;
       }
       N++;
    }
    return 0;
}
