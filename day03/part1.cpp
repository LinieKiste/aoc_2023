#include <cctype>
#include <stdlib.h>
#include <fstream>
#include <iostream>
#include <vector>
#include <string>
#include <ctype.h>

class Engine {
    public:
        Engine(std::string filename);
        std::vector<std::string> schematic;

        int solve();
};

Engine::Engine(std::string filename){
    std::string line;
    std::ifstream file(filename);
    if(file.is_open()){
        while (std::getline(file, line)) {
            schematic.push_back(line);
        }
        file.close();
    }
}

int Engine::solve() {
    int result = 0;
    for(int i=0; i < schematic.size(); i++){
        std::string line = schematic[i];
        for(int j=0; j<line.size(); j++) {
            if(std::isdigit(line[j])){
                int num = std::atoi(line.c_str()+j);

                bool is_part_number = false;
                if (j>0) {
                    if(line[j-1] != '.') {is_part_number = true;}
                    if(i>0 && schematic[i-1][j-1] != '.') {is_part_number = true;}
                    if(i<schematic.size()-1 && schematic[i+1][j-1] != '.') {is_part_number = true;}
                }
                if(j>0 && line[j-1] != '.') { is_part_number = true; }
                if(j>0 && i>0 && schematic[i-1][j-1] != '.'){is_part_number = true;}
                while(std::isdigit(line[j])){
                    if((i>0 && schematic[i-1][j] != '.')
                            || (i < schematic.size()-1 && schematic[i+1][j] != '.')){
                        is_part_number = true; }
                    j++;
                }
                j--;
                if(j<line.size()-1){
                    // std::cout << i << j << schematic.size() << std::endl;
                    if(line[j+1] != '.') {is_part_number=true;}
                    if(i>0 && schematic[i-1][j+1] != '.') {is_part_number = true;}
                    if(i<schematic.size()-1 && schematic[i+1][j+1] != '.') {is_part_number = true;}
                }
                j++;
                if (is_part_number) {
                    // std::cout << "part number: " << num << std::endl;
                    result += num;
                }
            }
        }
    }
    return result;
}

int main() {
    Engine e = Engine("input.txt");
    int sum = e.solve();
    std::cout << sum << std::endl;
    return 0;
}

