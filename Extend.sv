`timescale 1ns / 1ps

module Extend(input reg [5:0] imm , output reg [7:0] Extimm);
    
    assign Extimm = {{2{1'b0}},imm};
    
endmodule
