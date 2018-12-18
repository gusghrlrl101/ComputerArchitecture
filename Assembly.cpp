#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <bitset>
using namespace std;

// find address and save
void save_addr(vector<pair<string, int>>& addr, string line, int i) {
	if (line.find(':') != string::npos) {
		int start = line.find(':');
		int end = line.find(" ", start);

		string addr_name = line.substr(start + 1, end - start - 1);
		int address = i;
		addr.push_back({ addr_name,address });
	}
}

// if has address, delete
string delete_addr(string line) {
	if (line.rfind("//") != string::npos)
		line = line.substr(0, line.rfind("//") - 1);

	if (line.find(':') != string::npos) {
		string new_line = line.substr(0, line.find(':') - 1);
		return new_line;
	}
	return line;
}

// decoding 
string decoder(string line, vector<pair<string, int>>& addr) {
	vector<string> inst;

	int start = 0;
	int index = -1;
	while ((index = line.find(' ', start)) != string::npos) {
		inst.push_back(line.substr(start, index - start));

		start = index + 1;
	}
	inst.push_back(line.substr(start));

	string result = "";

	if (inst[0] == "LOAD") {
		result += "0001";
		result += bitset<4>(stoi(inst[1])).to_string();
		result += bitset<8>(stoi(inst[2])).to_string();
	}
	else if (inst[0] == "STORE") {
		result += "0010";
		result += bitset<4>(stoi(inst[1])).to_string();
		result += bitset<8>(stoi(inst[2])).to_string();
	}
	else if (inst[0] == "IMD") {
		result += "0011";
		result += bitset<4>(stoi(inst[1])).to_string();

		string temp;
		bool isthere = false;
		for (int i = 0; i < addr.size(); i++) {
			if (addr[i].first == inst[2]) {
				isthere = true;
				temp = bitset<8>(addr[i].second).to_string();
				break;
			}
		}
		if (!isthere)
			temp = bitset<8>(stoi(inst[2])).to_string();
		result += temp;
	}
	else if (inst[0] == "IMM") {
		result += "0111";
		result += bitset<4>(stoi(inst[1])).to_string();

		string temp;
		bool isthere = false;
		for (int i = 0; i < addr.size(); i++) {
			if (addr[i].first == inst[2]) {
				isthere = true;
				temp = bitset<8>(addr[i].second).to_string();
				break;
			}
		}
		if (!isthere)
			temp = bitset<8>(stoi(inst[2])).to_string();
		result += temp;
	}
	else if (inst[0] == "ADD") {
		result += "0100";
		result += bitset<4>(stoi(inst[1])).to_string();
		result += bitset<4>(stoi(inst[2])).to_string();
		result += bitset<4>(stoi(inst[3])).to_string();
	}
	else if (inst[0] == "SUB") {
		result += "0101";
		result += bitset<4>(stoi(inst[1])).to_string();
		result += bitset<4>(stoi(inst[2])).to_string();
		result += bitset<4>(stoi(inst[3])).to_string();
	}
	else if (inst[0] == "MUL") {
		result += "0110";
		result += bitset<4>(stoi(inst[1])).to_string();
		result += bitset<4>(stoi(inst[2])).to_string();
		result += bitset<4>(stoi(inst[3])).to_string();
	}
	else if (inst[0] == "JMP") {
		result += "10000000";

		string temp;
		bool isthere = false;
		for (int i = 0; i < addr.size(); i++) {
			if (addr[i].first == inst[1]) {
				isthere = true;
				temp = bitset<8>(addr[i].second).to_string();
				break;
			}
		}
		if (!isthere)
			temp = bitset<8>(stoi(inst[1])).to_string();
		result += temp;
	}
	else if (inst[0] == "JDI") {
		result += "1001";
		result += bitset<4>(stoi(inst[1])).to_string();
		result += bitset<8>(0).to_string();
	}
	else if (inst[0] == "JNE") {
		result += "1100";
		result += bitset<4>(stoi(inst[1])).to_string();

		string temp;
		bool isthere = false;
		for (int i = 0; i < addr.size(); i++) {
			if (addr[i].first == inst[2]) {
				isthere = true;
				temp = bitset<8>(addr[i].second).to_string();
				break;
			}
		}
		if (!isthere)
			temp = bitset<8>(inst[2]).to_string();
		result += temp;
	}
	else if (inst[0] == "JGT") {
		result += "1101";
		result += bitset<4>(stoi(inst[1])).to_string();

		string temp;
		bool isthere = false;
		for (int i = 0; i < addr.size(); i++) {
			if (addr[i].first == inst[2]) {
				isthere = true;
				temp = bitset<8>(addr[i].second).to_string();
				break;
			}
		}
		if (!isthere)
			temp = bitset<8>(stoi(inst[2])).to_string();
		result += temp;
	}
	else if (inst[0] == "JLT") {
		result += "1110";
		result += bitset<4>(stoi(inst[1])).to_string();

		string temp;
		bool isthere = false;
		for (int i = 0; i < addr.size(); i++) {
			if (addr[i].first == inst[2]) {
				isthere = true;
				temp = bitset<8>(addr[i].second).to_string();
				break;
			}
		}
		if (!isthere)
			temp = bitset<8>(stoi(inst[2])).to_string();
		result += temp;
	}
	else
		result += bitset<16>(0).to_string();

	return result;
}


int main() {
	string input_file = "input.txt";
	string output_file = "output.txt";

	vector<pair<string, int>> addr;
	vector<string> vec;

	// read File
	ifstream openFile(input_file.data());
	if (openFile.is_open()) {
		string line;

		int i = 0;
		// save address
		while (getline(openFile, line)) {
			save_addr(addr, line, i);
			i++;
		}

		openFile.close();
	}

	// read File
	ifstream openFile2(input_file.data());
	if (openFile2.is_open()) {
		string line;

		// decoder
		while (getline(openFile2, line)) {
			line = delete_addr(line);
			vec.push_back(decoder(line, addr));
		}
		openFile2.close();
	}

	// add under_bar
	for (int i = 0; i < vec.size(); i++) {
		vec[i].insert(12, "_");
		vec[i].insert(8, "_");
		vec[i].insert(4, "_");
	}

	// write File
	ofstream writeFile(output_file.data());
	if (writeFile.is_open()) {
		for (int i = 0; i < vec.size(); i++)
			writeFile << "inst_storage[" << i << "] = 16'b" << vec[i] << ";\n";
		writeFile.close();
	}

	return 0;
}