`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2021 13:21:07
// Design Name: 
// Module Name: tb_8BitProcessor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_8BitProcessor( );
    logic clk,reset;
    reg [15:0] instruction;
    reg [7:0] pc;
    reg [7:0] rd1,rd2,rd,aluResult,wd3;
    reg memToReg,memWrite,Branch,Jump,AluSrc,RegWrite,RegSrc;
    reg [2:0] aluControl;
    logic cout,v,c,n,z;
    wire [43:0] mux_wire;
    
    program_counter PC(clk,reset,mux_wire[7:0],pc);
    InsMemory INSMEM(pc,instruction);
    controlUnit CTRL_UNIT(instruction[15:12],instruction[2:0],v,c,n,z,memToReg,memWrite,Branch,Jump,AluSrc,RegWrite,RegSrc,aluControl);
    ThreeBitMux2 a2_mux_dut(instruction[5:3],instruction[11:9],RegSrc,mux_wire[10:8]);
    registerFile regFile_dut(clk,RegWrite,instruction[8:6],mux_wire[10:8],instruction[11:9],wd3,rd1,rd2);
    Extend extend_dut(instruction[5:0],mux_wire[18:11]);
    mux2 aluSrcMux2_dut(rd2,mux_wire[18:11],AluSrc,mux_wire[26:19]);
    mux2 branch_dut(8'b00000001,mux_wire[18:11],Branch,mux_wire[34:27]);
    mux2 jump_dut(mux_wire[34:27],instruction[7:0],Jump,mux_wire[42:35]);
    NbitFulladder pcAdjust_dut(pc,mux_wire[42:35],1'b0,mux_wire[7:0],mux_wire[43]);
    ALU Alu_dut(rd1,mux_wire[26:19],aluControl,cout,v,c,n,z,clk,aluResult);
    dataMemory DMEM_dut(aluResult,rd2,clk,memWrite,rd);
    mux2 memToReg_dut(aluResult,rd,memToReg,wd3);
    
    initial begin
        clk = 0;
        forever #14 clk = ~clk;
    end
    initial begin
        reset = 1; #28;
        reset = 0;
    end
    
    
endmodule
