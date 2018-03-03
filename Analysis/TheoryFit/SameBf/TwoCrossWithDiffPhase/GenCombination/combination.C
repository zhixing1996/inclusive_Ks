#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    int N=1;
    ofstream combination("combination.txt");
    combination<<N;
    for(int i=0;i<100;i=i+90){
        combination<<" "<<i;
        N++;
    }
    combination<<endl;
    return 0;
}
