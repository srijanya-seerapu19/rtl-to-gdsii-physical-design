`timescale 1ns / 1ps

module dff_async_reset_tb;

    // 1. Declare inputs as 'reg' and output as 'wire'
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // 2. Connect the D Flip-Flop (Unit Under Test)
    dff_async_reset uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // 3. Simple Clock: toggles every 5ns (gives a clean 10ns clock cycle)
    always #5 clk = ~clk;

    // 4. Test Steps (Clean and simple with #10 delays)
    initial begin
        $dumpfile("dff_async_reset.vcd");
        $dumpvars(0, dff_async_reset_tb);

        // Step 1: Start with Reset ON (q should be 0)
        clk = 0;
        rst_n = 0;
        d = 0;
        #10;

        // Step 2: Turn Reset OFF (Chip is now running!)
        rst_n = 1;
        #10;

        // Step 3: Test Data Input = 1 (q will become 1 on clock edge)
        d = 1;
        #10;

        // Step 4: Test Data Input = 0 (q will become 0 on clock edge)
        d = 0;
        #10;

        // Step 5: Test Data Input = 1 again
        d = 1;
        #10;

        // Step 6: Test Emergency Reset (rst_n = 0 forces q back to 0)
        rst_n = 0;
        #10;

        // Step 7: Turn Reset OFF again
        rst_n = 1;
        #10;

        $finish;
    end

endmodule
