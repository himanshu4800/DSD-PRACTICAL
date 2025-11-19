// Code your design here
module mux4to1(
    input I0, I1, I2, I3, S0, S1,
    output Y
);
  assign Y = (~S0 & ~S1 & I0) |
             (~S0 &  S1 & I1) |
             ( S0 & ~S1 & I2) |
             ( S0 &  S1 & I3);
endmodule
// Code your testbench here
`timescale 1ns/1ps
module tb;
  reg I0, I1, I2, I3;
  reg S0, S1;
  wire Y;
  mux4to1 uut(I0, I1, I2, I3, S0, S1,Y );
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end
    initial begin
        I0 = 0; I1 = 1; I2 = 0; I3 = 1;
        S0 = 0; S1= 0; #10;
        S0 = 0; S1= 1; #10;   
        S0 = 1; S1= 0; #10;   
        S0 = 1; S1= 1; #10;   
        $finish;
    end
endmodule

