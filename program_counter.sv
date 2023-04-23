module program_counter(input clk,reset,input reg [7:0] pcPlus,output reg [7:0] pc);    
    int i = 0;
    always @(posedge clk,posedge reset)
       begin
            if(clk)
                begin
                    i++;
                    if(i == 2)
                        begin
                            pc <= pcPlus; 
                            i=0;
                        end
                end  
            if(reset) pc <= 0;
       end
endmodule
