`timescale 1ns / 1ps

module decoder_2to4_tb;

    reg en;
    reg a;
    reg b;
    wire y0, y1, y2, y3;

    // Connect to the decoder chip
    decoder_2to4 uut (
        .en(en),
        .a(a),
        .b(b),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $dumpfile("decoder_2to4.vcd");
        $dumpvars(0, decoder_2to4_tb);

        // 1. Chip Disabled (all outputs stay 0)
        en = 0; a = 0; b = 0; #10;
        en = 0; a = 1; b = 1; #10;

        // 2. Chip Enabled (test all 4 combinations)
        en = 1;

        a = 0; b = 0; #10;  // y0 should go HIGH
        a = 0; b = 1; #10;  // y1 should go HIGH
        a = 1; b = 0; #10;  // y2 should go HIGH
        a = 1; b = 1; #10;  // y3 should go HIGH

        #10;
        $finish;
    end

endmodule
