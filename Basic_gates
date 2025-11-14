// Code your design here
`timescale 1ns/1ps
module logic_gates(
    input a, b,
    output and_out, or_out, not_out,nand_out, nor_out, xor_out, xnor_out
);

    assign and_out  = a & b;      // AND Gate
    assign or_out   = a | b;      // OR Gate
    assign not_out  = ~a;         // NOT Gate 
    assign nand_out = ~(a & b);   // NAND Gate
    assign nor_out  = ~(a | b);   // NOR Gate
    assign xor_out  = a ^ b;      // XOR Gate
    assign xnor_out = ~(a ^ b);   // XNOR Gate
endmodule
// test bench
`timescale 1ns/1ps
module tb;
    reg a, b;
    wire and_out, or_out, not_out,nand_out, nor_out, xor_out, xnor_out;
  
    logic_gates uut(a, b,and_out, or_out, not_out,nand_out, nor_out, xor_out, xnor_out);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end
    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
