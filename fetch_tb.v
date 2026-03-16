`timescale 1ns / 1ps

module fetch_tb();
    reg clk, rst, ex_mem_pc_src;
    reg [31:0] ex_mem_npc;
    wire [31:0] if_id_instr, if_id_npc;

   
    fetch uut (
        .clk(clk), .rst(rst), 
        .ex_mem_pc_src(ex_mem_pc_src), .ex_mem_npc(ex_mem_npc), 
        .if_id_instr(if_id_instr), .if_id_npc(if_id_npc)
    );

    // Clock: 10ns period (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initial State
        clk = 0; rst = 1; ex_mem_pc_src = 0; ex_mem_npc = 32'h5; // Jump to address 5
        
        // Hold reset for 2 cycles
        #20 rst = 0;

        // Step 1: fetch sequentially (PC: 0, 1, 2, 3)
        #40;

        // Step 2: Trigger a Branch/Jump
        @(negedge clk);
        ex_mem_pc_src = 1; 
        
        // Step 3: Back to sequential after the jump
        @(negedge clk);
        ex_mem_pc_src = 0;

        #50 $finish;
    end
endmodule
