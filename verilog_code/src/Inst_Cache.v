module Inst_cache(PC, en,
                  instruction, D, address
                  );
                  
input wire [7:0] PC;
input en;
output [15:0] instruction;
output [3:0] D;
output [7:0] address;

reg[31:0] inst_storage[255:0];

assign instruction = inst_storage[PC];
assign D = instruction[11:8];
assign address = instruction[7:0];

always@ (*) begin
    if (en) begin
    inst_storage[0] = 16'b0111_0000_1111_1100;
inst_storage[1] = 16'b0011_0001_0000_0010;
inst_storage[2] = 16'b0111_0010_1111_1100;
inst_storage[3] = 16'b0111_0011_1111_1010;
inst_storage[4] = 16'b0011_0100_0000_0100;
inst_storage[5] = 16'b0111_0101_1111_1010;
inst_storage[6] = 16'b0010_0000_0000_0000;
inst_storage[7] = 16'b0010_0001_0000_0001;
inst_storage[8] = 16'b0010_0010_0000_0010;
inst_storage[9] = 16'b0010_0011_0000_0011;
inst_storage[10] = 16'b0010_0100_0000_0100;
inst_storage[11] = 16'b0010_0101_0000_0101;
inst_storage[12] = 16'b0111_0000_1111_1111;
inst_storage[13] = 16'b0111_0001_1111_1111;
inst_storage[14] = 16'b0011_0010_0000_0010;
inst_storage[15] = 16'b0011_0011_0000_1000;
inst_storage[16] = 16'b0011_0100_0000_0110;
inst_storage[17] = 16'b0011_0101_0000_0001;
inst_storage[18] = 16'b0010_0000_0000_0110;
inst_storage[19] = 16'b0010_0001_0000_0111;
inst_storage[20] = 16'b0010_0010_0000_1000;
inst_storage[21] = 16'b0010_0011_0000_1001;
inst_storage[22] = 16'b0010_0100_0000_1010;
inst_storage[23] = 16'b0010_0101_0000_1011;
inst_storage[24] = 16'b0001_0000_0000_0000;
inst_storage[25] = 16'b0001_0001_0000_0001;
inst_storage[26] = 16'b0001_0010_0000_0010;
inst_storage[27] = 16'b0001_0011_0000_0011;
inst_storage[28] = 16'b0001_0100_0000_0110;
inst_storage[29] = 16'b0001_0101_0000_0111;
inst_storage[30] = 16'b0001_0110_0000_1000;
inst_storage[31] = 16'b0001_0111_0000_1001;
inst_storage[32] = 16'b0011_1100_0010_0010;
inst_storage[33] = 16'b1000_0000_0111_1011;
inst_storage[34] = 16'b1100_1110_1101_0001;
inst_storage[35] = 16'b0001_0000_0000_0000;
inst_storage[36] = 16'b0001_0001_0000_0001;
inst_storage[37] = 16'b0001_0010_0000_0010;
inst_storage[38] = 16'b0001_0011_0000_0011;
inst_storage[39] = 16'b0001_0100_0000_1000;
inst_storage[40] = 16'b0001_0101_0000_1001;
inst_storage[41] = 16'b0001_0110_0000_1010;
inst_storage[42] = 16'b0001_0111_0000_1011;
inst_storage[43] = 16'b0011_1100_0010_1101;
inst_storage[44] = 16'b1000_0000_0111_1011;
inst_storage[45] = 16'b1100_1110_1101_0001;
inst_storage[46] = 16'b0001_0000_0000_0000;
inst_storage[47] = 16'b0001_0001_0000_0001;
inst_storage[48] = 16'b0001_0010_0000_0010;
inst_storage[49] = 16'b0001_0011_0000_0011;
inst_storage[50] = 16'b0001_0100_0000_1010;
inst_storage[51] = 16'b0001_0101_0000_1011;
inst_storage[52] = 16'b0001_0110_0000_0110;
inst_storage[53] = 16'b0001_0111_0000_0111;
inst_storage[54] = 16'b0011_1100_0011_1000;
inst_storage[55] = 16'b1000_0000_0111_1011;
inst_storage[56] = 16'b1100_1110_1101_0001;
inst_storage[57] = 16'b0001_0000_0000_0010;
inst_storage[58] = 16'b0001_0001_0000_0011;
inst_storage[59] = 16'b0001_0010_0000_0100;
inst_storage[60] = 16'b0001_0011_0000_0101;
inst_storage[61] = 16'b0001_0100_0000_0110;
inst_storage[62] = 16'b0001_0101_0000_0111;
inst_storage[63] = 16'b0001_0110_0000_1000;
inst_storage[64] = 16'b0001_0111_0000_1001;
inst_storage[65] = 16'b0011_1100_0100_0011;
inst_storage[66] = 16'b1000_0000_0111_1011;
inst_storage[67] = 16'b1100_1110_1101_0001;
inst_storage[68] = 16'b0001_0000_0000_0010;
inst_storage[69] = 16'b0001_0001_0000_0011;
inst_storage[70] = 16'b0001_0010_0000_0100;
inst_storage[71] = 16'b0001_0011_0000_0101;
inst_storage[72] = 16'b0001_0100_0000_1000;
inst_storage[73] = 16'b0001_0101_0000_1001;
inst_storage[74] = 16'b0001_0110_0000_1010;
inst_storage[75] = 16'b0001_0111_0000_1011;
inst_storage[76] = 16'b0011_1100_0100_1110;
inst_storage[77] = 16'b1000_0000_0111_1011;
inst_storage[78] = 16'b1100_1110_1101_0001;
inst_storage[79] = 16'b0001_0000_0000_0010;
inst_storage[80] = 16'b0001_0001_0000_0011;
inst_storage[81] = 16'b0001_0010_0000_0100;
inst_storage[82] = 16'b0001_0011_0000_0101;
inst_storage[83] = 16'b0001_0100_0000_1010;
inst_storage[84] = 16'b0001_0101_0000_1011;
inst_storage[85] = 16'b0001_0110_0000_0110;
inst_storage[86] = 16'b0001_0111_0000_0111;
inst_storage[87] = 16'b0011_1100_0101_1001;
inst_storage[88] = 16'b1000_0000_0111_1011;
inst_storage[89] = 16'b1100_1110_1101_0001;
inst_storage[90] = 16'b0001_0000_0000_0100;
inst_storage[91] = 16'b0001_0001_0000_0101;
inst_storage[92] = 16'b0001_0010_0000_0000;
inst_storage[93] = 16'b0001_0011_0000_0001;
inst_storage[94] = 16'b0001_0100_0000_0110;
inst_storage[95] = 16'b0001_0101_0000_0111;
inst_storage[96] = 16'b0001_0110_0000_1000;
inst_storage[97] = 16'b0001_0111_0000_1001;
inst_storage[98] = 16'b0011_1100_0110_0100;
inst_storage[99] = 16'b1000_0000_0111_1011;
inst_storage[100] = 16'b1100_1110_1101_0001;
inst_storage[101] = 16'b0001_0000_0000_0100;
inst_storage[102] = 16'b0001_0001_0000_0101;
inst_storage[103] = 16'b0001_0010_0000_0000;
inst_storage[104] = 16'b0001_0011_0000_0001;
inst_storage[105] = 16'b0001_0100_0000_1000;
inst_storage[106] = 16'b0001_0101_0000_1001;
inst_storage[107] = 16'b0001_0110_0000_1010;
inst_storage[108] = 16'b0001_0111_0000_1011;
inst_storage[109] = 16'b0011_1100_0110_1111;
inst_storage[110] = 16'b1000_0000_0111_1011;
inst_storage[111] = 16'b1100_1110_1101_0001;
inst_storage[112] = 16'b0001_0000_0000_0100;
inst_storage[113] = 16'b0001_0001_0000_0101;
inst_storage[114] = 16'b0001_0010_0000_0000;
inst_storage[115] = 16'b0001_0011_0000_0001;
inst_storage[116] = 16'b0001_0100_0000_1010;
inst_storage[117] = 16'b0001_0101_0000_1011;
inst_storage[118] = 16'b0001_0110_0000_0110;
inst_storage[119] = 16'b0001_0111_0000_0111;
inst_storage[120] = 16'b0011_1100_0111_1010;
inst_storage[121] = 16'b1000_0000_0111_1011;
inst_storage[122] = 16'b1000_0000_1101_0001;
inst_storage[123] = 16'b0010_0000_0000_1100;
inst_storage[124] = 16'b0010_0001_0000_1101;
inst_storage[125] = 16'b0010_0010_0000_1110;
inst_storage[126] = 16'b0010_0011_0000_1111;
inst_storage[127] = 16'b0010_0100_0001_0000;
inst_storage[128] = 16'b0010_0101_0001_0001;
inst_storage[129] = 16'b0010_0110_0001_0010;
inst_storage[130] = 16'b0010_0111_0001_0011;
inst_storage[131] = 16'b0001_0000_0000_1100;
inst_storage[132] = 16'b0001_0001_0000_1101;
inst_storage[133] = 16'b0001_0010_0000_1110;
inst_storage[134] = 16'b0001_0011_0000_1111;
inst_storage[135] = 16'b0001_0100_0001_0000;
inst_storage[136] = 16'b0001_0101_0001_0001;
inst_storage[137] = 16'b0011_1011_1000_1011;
inst_storage[138] = 16'b1000_0000_1011_0011;
inst_storage[139] = 16'b0010_1101_0001_0100;
inst_storage[140] = 16'b0001_0000_0000_1100;
inst_storage[141] = 16'b0001_0001_0000_1101;
inst_storage[142] = 16'b0001_0010_0000_1110;
inst_storage[143] = 16'b0001_0011_0000_1111;
inst_storage[144] = 16'b0001_0100_0001_0010;
inst_storage[145] = 16'b0001_0101_0001_0011;
inst_storage[146] = 16'b0011_1011_1001_0100;
inst_storage[147] = 16'b1000_0000_1011_0011;
inst_storage[148] = 16'b0010_1101_0001_0101;
inst_storage[149] = 16'b0001_0000_0001_0000;
inst_storage[150] = 16'b0001_0001_0001_0001;
inst_storage[151] = 16'b0001_0010_0001_0010;
inst_storage[152] = 16'b0001_0011_0001_0011;
inst_storage[153] = 16'b0001_0100_0000_1100;
inst_storage[154] = 16'b0001_0101_0000_1101;
inst_storage[155] = 16'b0011_1011_1001_1101;
inst_storage[156] = 16'b1000_0000_1011_0011;
inst_storage[157] = 16'b0010_1101_0001_0110;
inst_storage[158] = 16'b0001_0000_0001_0000;
inst_storage[159] = 16'b0001_0001_0001_0001;
inst_storage[160] = 16'b0001_0010_0001_0010;
inst_storage[161] = 16'b0001_0011_0001_0011;
inst_storage[162] = 16'b0001_0100_0000_1110;
inst_storage[163] = 16'b0001_0101_0000_1111;
inst_storage[164] = 16'b0011_1011_1010_0110;
inst_storage[165] = 16'b1000_0000_1011_0011;
inst_storage[166] = 16'b0010_1101_0001_0111;
inst_storage[167] = 16'b0001_0000_0001_0100;
inst_storage[168] = 16'b0001_0001_0001_0101;
inst_storage[169] = 16'b0001_0010_0001_0110;
inst_storage[170] = 16'b0001_0011_0001_0111;
inst_storage[171] = 16'b0110_0100_0000_0001;
inst_storage[172] = 16'b1101_0100_1011_0001;
inst_storage[173] = 16'b0110_0101_0010_0011;
inst_storage[174] = 16'b1101_0101_1011_0001;
inst_storage[175] = 16'b0011_1110_0000_0001;
inst_storage[176] = 16'b1001_1100_0000_0000;
inst_storage[177] = 16'b0011_1110_0000_0000;
inst_storage[178] = 16'b1001_1100_0000_0000;
inst_storage[179] = 16'b0101_0110_0010_0000;
inst_storage[180] = 16'b0101_1001_0101_0001;
inst_storage[181] = 16'b0101_0111_0011_0001;
inst_storage[182] = 16'b0101_1000_0100_0000;
inst_storage[183] = 16'b0110_0000_0110_1001;
inst_storage[184] = 16'b0110_0001_0111_1000;
inst_storage[185] = 16'b0101_0010_0000_0001;
inst_storage[186] = 16'b1101_0010_1100_1101;
inst_storage[187] = 16'b1110_0010_1100_1111;
inst_storage[188] = 16'b1100_0110_1011_1111;
inst_storage[189] = 16'b1100_0111_1011_1111;
inst_storage[190] = 16'b1000_0000_1100_1011;
inst_storage[191] = 16'b0110_0011_0110_1000;
inst_storage[192] = 16'b1110_0011_1100_1111;
inst_storage[193] = 16'b0110_0100_0111_1001;
inst_storage[194] = 16'b1110_0100_1100_1111;
inst_storage[195] = 16'b0110_0000_0110_0110;
inst_storage[196] = 16'b0110_0001_0111_0111;
inst_storage[197] = 16'b0110_0010_1000_1000;
inst_storage[198] = 16'b0110_0100_1001_1001;
inst_storage[199] = 16'b0100_0100_0000_0001;
inst_storage[200] = 16'b0100_0101_0010_0011;
inst_storage[201] = 16'b0101_0110_0100_0101;
inst_storage[202] = 16'b1110_0110_1100_1101;
inst_storage[203] = 16'b0011_1101_0000_0000;
inst_storage[204] = 16'b1001_1011_0000_0000;
inst_storage[205] = 16'b0011_1101_0000_0001;
inst_storage[206] = 16'b1001_1011_0000_0000;
inst_storage[207] = 16'b0111_1101_1111_1111;
inst_storage[208] = 16'b1001_1011_0000_0000;
inst_storage[209] = 16'b0011_1111_0000_0001;
inst_storage[210] = 16'b1000_0000_1101_0010;

    end
end


endmodule