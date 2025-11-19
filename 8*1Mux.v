// Code your design here
module mux8to1(
    input I0, I1, I2, I3, I4, I5, I6, I7,
    input S0, S1, S2,
    output Y
);

assign Y = (~S2 & ~S1 & ~S0 & I0) |
           (~S2 & ~S1 &  S0 & I1) |
           (~S2 &  S1 & ~S0 & I2) |
           (~S2 &  S1 &  S0 & I3) |
           ( S2 & ~S1 & ~S0 & I4) |
           ( S2 & ~S1 &  S0 & I5) |
           ( S2 &  S1 & ~S0 & I6) |
           ( S2 &  S1 &  S0 & I7);

endmodule

// Code your testbench here
`timescale 1ns/1ps
module tb;

    reg I0, I1, I2, I3, I4, I5, I6, I7;
    reg S0, S1, S2;
    wire Y;

    mux8to1 uut(I0, I1, I2, I3, I4, I5, I6, I7, S0, S1, S2, Y);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        // Assign different values to each input
        I0=0; I1=1; I2=0; I3=1; I4=0; I5=1; I6=0; I7=1;

        S2=0; S1=0; S0=0; #10;   // Select I0 = 0
        S2=0; S1=0; S0=1; #10;   // Select I1 = 1
        S2=0; S1=1; S0=0; #10;   // Select I2 = 0
        S2=0; S1=1; S0=1; #10;   // Select I3 = 1
        S2=1; S1=0; S0=0; #10;   // Select I4 = 0
        S2=1; S1=0; S0=1; #10;   // Select I5 = 1
        S2=1; S1=1; S0=0; #10;   // Select I6 = 0
        S2=1; S1=1; S0=1; #10;   // Select I7 = 1

        $finish;
    end

endmodule
