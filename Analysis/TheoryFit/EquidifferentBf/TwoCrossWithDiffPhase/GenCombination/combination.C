#include <fstream>
#include <iostream>
using namespace std;

int main(){
    
    ofstream combination("combination.txt");
    combination<<"1 0 90"<<endl;
    combination<<"2 90 0"<<endl;

    return 0;
}
