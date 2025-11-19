`timescale 1ns/1ps

module simple_universal_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        M,      
    output reg [3:0] S,    
    output reg    Cout,   
    output reg    V       
);
    reg [4:0] temp;       
    
    always @(*) begin
        if (M == 0) begin
            temp = A + B;  
        end else begin
            temp = A + (~B + 1);
        end
        
        S = temp[3:0];     
        Cout = temp[4];    
        
        if (M == 0) begin
            V = (~A[3] & ~B[3] & S[3]) | (A[3] & B[3] & ~S[3]);
        end else begin
            V = (~A[3] & B[3] & S[3]) | (A[3] & ~B[3] & ~S[3]);
        end
    end
endmodule

// test bench 
module tb_simple_universal_adder;
    reg [3:0] A, B;
    reg M;
    wire [3:0] S;
    wire Cout, V;

    simple_universal_adder uut (.A(A), .B(B), .M(M), .S(S), .Cout(Cout), .V(V));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_simple_universal_adder);
        
        M = 0; A = 4'b0011; B = 4'b0101; #10;  
        
        M = 1; A = 4'b0011; B = 4'b0101; #10;  
        
        M = 0; A = 4'b0111; B = 4'b0001; #10;  
        
        M = 1; A = 4'b1000; B = 4'b0001; #10;  
        
        $finish;
    end
endmodule
