`timescale 1ns/1ps

module t_ff(
    input T,
    input CLK,
    output reg Q,
    output Qbar
);

    initial Q = 0;

    always @(negedge CLK) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end

    assign Qbar = ~Q;

endmodule

module custom_counter(
    input CLK,
    input RESET,
    output [2:0] count
);

    reg [2:0] state;
    assign count = state;

    always @(negedge CLK or posedge RESET) begin
        if (RESET)
            state <= 3'b000;
        else begin
            case (state)
                3'b000: state <= 3'b011; // 0 -> 3
                3'b011: state <= 3'b101; // 3 -> 5
                3'b101: state <= 3'b110; // 5 -> 6
                3'b110: state <= 3'b000; // 6 -> 0
                default: state <= 3'b000;
            endcase
        end
    end

endmodule
// test bench 
module tb_custom_counter();

    reg CLK, RESET;
    wire [2:0] count;

    custom_counter UUT (
        .CLK(CLK),
        .RESET(RESET),
        .count(count)
    );

    initial begin
        CLK = 0;
        RESET = 1;
        #10 RESET = 0;
        repeat (10) begin
            #5 CLK = ~CLK;
        end
        $finish;
    end

    initial begin
        $monitor("Count: %b", count);
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_custom_counter);
    end

endmodule

