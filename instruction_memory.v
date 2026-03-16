`timescale 1ns / 1ps
module instruction_memory (
    input wire [31:0] addr,    // Changed from 'address'
    output wire [31:0] data    // Changed from 'instruction'
);
    // Physical storage limited for simulation; first 10 addresses populated
    reg [31:0] mem [0:1023]; 

    initial begin
        mem[0] = 32'hDEADBEEF;
        mem[1] = 32'h11111111;
        mem[2] = 32'h22222222;
        mem[3] = 32'h33333333;
        mem[4] = 32'h44444444;
        mem[5] = 32'h55555555;
        mem[6] = 32'h66666666;
        mem[7] = 32'h77777777;
        mem[8] = 32'h88888888;
        mem[9] = 32'h99999999;
    end

    // Use the lower bits of the address to index the memory array
    assign data = mem[addr[9:0]]; 
endmodule