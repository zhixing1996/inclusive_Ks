#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    ofstream combination("combination.txt");
    combination<<"1 0 0"<<endl;
    combination<<"2 0 90"<<endl;
    combination<<"3 90 0"<<endl;
    combination<<"3 90 90"<<endl;

    return 0;
}
