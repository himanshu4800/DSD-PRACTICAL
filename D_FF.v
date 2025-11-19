`timescale 1ns/1ps
module d_ff_ne (
    input D,
    input CLK,
    output reg Q,
    output Qbar
);

    always @(negedge CLK) begin
        Q <= D;
    end

    assign Qbar = ~Q;

endmodule
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_d_ff_ne;

    reg D, CLK;
    wire Q, Qbar;

    d_ff_ne uut (D, CLK, Q, Qbar);

    initial begin
        CLK = 1;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("d_ff_ne.vcd");
        $dumpvars(0, tb_d_ff_ne);

        D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;

        $finish;
    end

endmodule
