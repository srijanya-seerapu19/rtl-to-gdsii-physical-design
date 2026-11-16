// Simple 2-to-4 Decoder with separate inputs and outputs
module decoder_2to4 (
    input  wire en,       // Enable switch
    input  wire a,        // First input bit
    input  wire b,        // Second input bit
    output wire y0,       // Active when a=0, b=0
    output wire y1,       // Active when a=0, b=1
    output wire y2,       // Active when a=1, b=0
    output wire y3        // Active when a=1, b=1
);

    // Basic Logic Gate equations (AND + NOT gates):
    assign y0 = en & (~a) & (~b);
    assign y1 = en & (~a) & ( b);
    assign y2 = en & ( a) & (~b);
    assign y3 = en & ( a) & ( b);

endmodule
