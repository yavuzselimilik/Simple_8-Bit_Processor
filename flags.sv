module flags(input [7:0] a,b,y, input [1:0] alu_control , input sum3 , cout , output z,n,c,v );

    assign z = ~y[0] & ~y[1] & ~y[2] & ~y[3] & ~y[4] & ~y[5] & ~y[6] & ~y[7];
    assign n = y[7];
    assign c = cout & ~alu_control[1];
    assign v = ~alu_control[1] & (sum3 ^ a[7]) & ~(alu_control[0] ^ a[7] ^ b[7]);

endmodule