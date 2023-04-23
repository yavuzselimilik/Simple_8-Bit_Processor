`timescale 1ns / 1ps
module ALU(input reg [7:0] a,b,input reg[2:0] alu_control,output logic cout, v, c, n, z,input clk,output reg [7:0] result);
    wire [63:0] w;
    reg [7:0] temp;
    mux2 m_1(b,~b,alu_control[0],w[7:0]);
    NbitFulladder fa_1(a,w[7:0],alu_control[0],w[15:8],cout);
    assign w[23:16] = a & b;
    assign w[31:24] = a | b;
    assign w[39:32] = b;
    assign w[47:40] = a ^ b;
    assign w[55:48] = a & ~b;
    assign w[63:56] = ~a;
    
    mux8 m_2(w[15:8],w[15:8],w[23:16],w[31:24],w[39:32],w[47:40],w[55:48],w[63:56],alu_control,temp);
    
    flags flg(a,b,result,alu_control,w[15],cout,z,n,c,v);
    
    int j = 0;
    always @(negedge clk)
    begin
        j++;
        if(j == 2)
        begin
            result = temp;
            j = 0;
        end 
    end
     
    
endmodule
