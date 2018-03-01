#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    int N=1;
    ofstream combination("combination.txt");
    for(int i=0;i<100;i+=10){
       for(int j=0;j<100;j+=10){
         combination<<N<<" "<<i<<" "<<j<<endl;
         N++;
       }
    }
    return 0;
}
