# ECE4300_InstructionFetch
MIPS Instr. fetch
The Instruction fetch stage implementation determines the next instruction address by using a multiplexer to select between a sequential increment (program counter + 1) or a target from a later stage. 
This selected address is stored in the Program Counter, which indexes the instruction memory to retrieve the code. 
The fetched instruction and the next sequential address are stored in the IF/ID pipeline register to be processed by the decoder on the next clock cycle.

In the screenshot, my code uses the 'deadbeef' as uninitialized memory as the if_if_instruction goes from 00000000 to deadbeef to 11111111.
The instr_data also uses it as 'deadbeef' is stored there first from if_id_instr[31:0] then moving on to 11111111, 22222222, and so on.
