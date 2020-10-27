#include <cstdlib>
#include <fstream>

const int STR_BUFF_SIZE = 512; //Static Array Size

int main(){
    std::ifstream input;
    std::ofstream output;
    char buff[STR_BUFF_SIZE] = "";
    input.open("raft.txt");
    output.open("output");
    while (input.getline(buff, STR_BUFF_SIZE)) {
        output << buff << " " << rand() << std::endl;
    }
    input.close();
    output.close();
}
