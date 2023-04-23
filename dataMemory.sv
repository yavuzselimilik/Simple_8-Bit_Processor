`timescale 1ns / 1ps


module dataMemory(input reg [7:0] a,wd,input clk,we,output reg [7:0] rd);
    reg [7:0] DMEM_Datas [255:0];
    int i;
    initial begin
        for(i=0;i<256;i++)
            DMEM_Datas[i] = 8'b00000000;
    end
    
    
    always @(posedge clk)
        begin
            if(we) DMEM_Datas[a] <= wd;
            else rd <= DMEM_Datas[a];
        end

endmodule
