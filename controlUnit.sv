`timescale 1ns / 1ps
module controlUnit(input reg [3:0] opCode,input reg [2:0] func,input v,c,n,z, 
                   output reg memToReg,memWrite,Branch,Jump,AluSrc,RegWrite,RegSrc,
                   output reg [2:0] aluControl);
    
    logic ge,gt,le,lt;
                   
    assign ge = ~(n ^ v);
    assign gt = ~z & ~(n ^ v);
    assign le = z | (n ^ v);
    assign lt = n ^ v;
    
    always @(*)
    begin
        case(opCode)
            4'b0000: //Data processing instr with reg(add,sub,and,or,mov,eor,býc,mvn)
                begin
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Branch = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b1;
                    RegSrc = 1'b0;
                    if(func == 3'b000)
                    begin
                        aluControl = 3'b000;
                    end
                    else if(func == 3'b010)
                    begin
                        aluControl = 3'b001;
                    end
                    else if(func == 3'b100)
                    begin
                        aluControl = 3'b010;
                    end
                    else if(func == 3'b101)
                    begin
                        aluControl = 3'b011;
                    end
                    else if(func == 3'b001)
                    begin
                        aluControl = 3'b100;
                    end
                    else if(func == 3'b011)
                    begin
                        aluControl = 3'b101;
                    end
                    else if(func == 3'b110)
                    begin
                        aluControl = 3'b110;
                    end
                    else if(func == 3'b111)
                    begin
                        aluControl = 3'b111;
                    end
                end
            4'b0100: //addi
                begin
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Branch = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b1;
                    RegWrite = 1'b1;
                    RegSrc = 1'b0;
                    aluControl = 3'b000;
                end
                
           4'b0101: //subi
                begin
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Branch = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b1;
                    RegWrite = 1'b1;
                    RegSrc = 1'b0;
                    aluControl = 3'b001;
                end
                
            4'b0001: //movi
                begin
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Branch = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b1;
                    RegWrite = 1'b1;
                    RegSrc = 1'b0;
                    aluControl = 3'b100;
                end
                
           4'b1011: //lw
                begin
                    memToReg = 1'b1;
                    memWrite = 1'b0;
                    Branch = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b1;
                    RegWrite = 1'b1;
                    RegSrc = 1'b1;
                    aluControl = 3'b000;
                end
            4'b1111: //sw
                begin
                    memToReg = 1'b0;
                    memWrite = 1'b1;
                    Branch = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b1;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b000;
                end
            4'b1000: //beq(branch equal)
                begin
                    if(z == 1)
                        begin
                            Branch = 1'b1;
                        end
                    else
                        begin
                            Branch = 1'b0;
                        end
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b001;
                end
             4'b1001: //bne(branch not equal)
                begin
                    if(z == 0)
                        begin
                            Branch = 1'b1;
                        end
                    else
                        begin
                            Branch = 1'b0;
                        end
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b001;
                end
            4'b1010: //bgt(branch greater than)
                begin
                    if(gt == 1)
                        begin
                            Branch = 1'b1;
                        end
                    else
                        begin
                            Branch = 1'b0;
                        end
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b001;
                end
            4'b1100: //blt(branch less than)
                begin
                    if(lt == 1)
                        begin
                            Branch = 1'b1;
                        end
                    else
                        begin
                            Branch = 1'b0;
                        end
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b001;
                end   
            
            4'b1101: //bge (branch great equal)
                begin
                    if(ge == 1)
                        begin
                            Branch = 1'b1;
                        end
                    else
                        begin
                            Branch = 1'b0;
                        end
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b001;
                end
           
           4'b1110: //ble(branch less equal)
                begin
                    if(le == 1)
                        begin
                            Branch = 1'b1;
                        end
                    else
                        begin
                            Branch = 1'b0;
                        end
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Jump = 1'b0;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b1;
                    aluControl = 3'b001;
                end 
                
            4'b0010: //jump
                begin
                    memToReg = 1'b0;
                    memWrite = 1'b0;
                    Branch = 1'b0;
                    Jump = 1'b1;
                    AluSrc = 1'b0;
                    RegWrite = 1'b0;
                    RegSrc = 1'b0;
                    aluControl = 3'b000;
                end
       endcase 
    end
    
endmodule
