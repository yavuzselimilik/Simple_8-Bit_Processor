module registerFile(input clk,we3,input reg [2:0] a1,a2,a3,input reg [7:0] wd3,output reg [7:0] rd1,rd2);

reg [7:0] datas [7:0];

initial datas[0] = 8'b00000000;
initial datas[1] = 8'b00000001;
initial datas[2] = 8'b00000010;
initial datas[3] = 8'b00000011;
initial datas[4] = 8'b00000100;
initial datas[5] = 8'b00000101;
initial datas[6] = 8'b00000110;
initial datas[7] = 8'b00000111;


always @(posedge clk)
    begin
        if(we3) datas[a3] <= wd3; 
        rd1 <= datas[a1];
        rd2 <= datas[a2];      
    end

endmodule