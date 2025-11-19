`timescale 1ns/1ps
module jk_ff_ne (
    input J,
    input K,
    input CLK,
    output reg Q,
    output Qbar
);

    always @(negedge CLK) begin
        case ({J, K})
            2'b00: Q <= Q;
            2'b01: Q <= 1'b0;
            2'b10: Q <= 1'b1;
            2'b11: Q <= ~Q;
        endcase
    end

    assign Qbar = ~Q;

endmodule
`timescale 1ns/1ps
module tb_jk_ff_ne;

    reg J, K, CLK;
    wire Q, Qbar;

    jk_ff_ne uut (
        .J(J),
        .K(K),
        .CLK(CLK),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        CLK = 1;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("jk_ff_ne.vcd");
        $dumpvars(0, tb_jk_ff_ne);

        J = 0; K = 0; #10;
        J = 0; K = 1; #10;
        J = 1; K = 0; #10;
        J = 1; K = 1; #10;
        J = 1; K = 1; #10;

        $finish;
    end

endmodule
