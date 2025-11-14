// Code your design here
module boolean_expr(A, B, C, Y);
    input A, B, C;
    output Y;

    assign Y = (A & B) | (~C);   // Boolean Expression
endmodule
// Code your testbench here
`timescale 1ns/1ps
module tb;
    reg A, B, C;
    wire Y;
    boolean_expr uut(A, B, C, Y);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end
    initial begin
        A = 0; B = 0; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 0; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 0; #10;
        A = 1; B = 1; C = 1; #10;
        $finish;
    end
endmodule
