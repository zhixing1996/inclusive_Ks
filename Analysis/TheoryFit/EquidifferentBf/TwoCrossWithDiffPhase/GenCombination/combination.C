#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    int N=1;
    ofstream combination("combination.txt");
    for(int i=0;i<100;i+=90){
       for(int j=90;j>-1;j-=90){
         if(i!=j){
            combination<<N<<" "<<i<<" "<<j<<endl;
            N++;
         }
       }
    }
    return 0;
}
