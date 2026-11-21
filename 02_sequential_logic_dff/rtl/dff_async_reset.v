// D Flip-Flop with Active-Low Asynchronous Reset
// Target Technology: SkyWater 130nm CMOS

module dff_async_reset (
    input  wire clk,      // Clock input (the heartbeat)
    input  wire rst_n,    // Active-Low Reset (0 = Reset, 1 = Normal run)
    input  wire d,        // Data input
    output reg  q         // Stored output data
);

    // always @(...) means: "Wake up ONLY when clk rises OR when rst_n falls"
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 1'b0;    // Emergency Reset: force output to 0 immediately
        end else begin
            q <= d;       // Clock Rising Edge: store input d into output q
        end
    end

endmodule
