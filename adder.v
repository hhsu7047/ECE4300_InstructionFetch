`timescale 1ns / 1ps
module adder (
    input wire [31:0] pcin,   // This is where pc_out connects
    output wire [31:0] pcout  // This is where next_pc connects
);
    // Simple combinational logic: add 1 to the input
    assign pcout = pcin + 32'd1;

endmodule