// Code your design here
module mux_2to1(I0, I1, S, Y);
    input I0, I1, S;
    output Y;
  
  assign Y = (S) ? I1 : I0;  
endmodule
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb;
    reg I0, I1, S;
    wire Y;
    mux_2to1 uut(I0, I1, S, Y);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end
    initial begin
        I0 = 0; I1 = 1; S = 0; #10;
        I0 = 0; I1 = 1; S = 1; #10;
        $finish;
    end
endmodule
