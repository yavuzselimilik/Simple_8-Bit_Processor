`timescale 1ns / 1ps
module InsMemory(input reg [7:0] pc,output reg [15:0] instruction);
    reg [15:0] insDatas [255:0];
    initial insDatas[0] = 16'b0000000001010000;
    initial insDatas[1] = 16'b1000000011000100;
    initial insDatas[5] = 16'b1001000100000100;
    initial insDatas[9] = 16'b1010001100000010;
    initial insDatas[11] = 16'b1100001100000010;
    initial insDatas[12] = 16'b1101000011000010;
    initial insDatas[14] = 16'b1110101011001000;
    initial insDatas[22] = 16'b1111110001000001;
    initial insDatas[23] = 16'b1011010001000001;
    initial insDatas[24] = 16'b0000000110010100;
    initial insDatas[25] = 16'b0000001000111110;
    initial insDatas[26] = 16'b0100010001000100;
    initial insDatas[27] = 16'b0101011010000010;
    initial insDatas[28] = 16'b0001001000001000;
    initial insDatas[29] = 16'b0000000001100011;
    initial insDatas[30] = 16'b0010000000000111;
    initial insDatas[37] = 16'b0000100000110111;
    
    always @(*) 
        instruction <= insDatas[pc];
endmodule
