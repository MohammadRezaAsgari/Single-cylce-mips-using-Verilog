`timescale 1ns / 1ps

module CPU(input clk);



wire [7:0] newpc_in;
wire [7:0] newpc_out;
Program_counter pc(clk, newpc_in, newpc_out);

wire [15:0] instruction;
Instruction_Memory im(newpc_out, instruction);

wire alusrc,memtoreg,regwrite,memread,memwrite,load_store;
wire[2:0] jump_type_wire;
wire[3:0] aluop;
Control control_unit(instruction[15:6], alusrc, memtoreg, regwrite, memread, memwrite, jump_type_wire, load_store, aluop);

wire[7:0] added_pc;
Add adder(newpc_out, added_pc);

wire jump_taken;
Mux2to1_8bit mux_jump(added_pc, instruction[7:0], jump_taken, newpc_in);

wire[2:0] reg_read1;
Mux2to1_3bit mux_reg_read1(instruction[5:3], instruction[10:8], load_store, reg_read1);

wire[7:0] write_backto_reg, read_reg1, read_reg2;
Register_Bank rm(clk, regwrite, reg_read1, instruction[2:0], reg_read1, write_backto_reg, read_reg1, read_reg2);

wire[7:0] immediate_wire;
Mux2to1_8bit mux_immediate( {{5{instruction[2]}},instruction[2:0]}, instruction[7:0], load_store, immediate_wire);

wire[7:0] alu_operand2;
Mux2to1_8bit mux_srcALU(read_reg2, immediate_wire, alusrc, alu_operand2);

wire of,zf,sf,cf;
wire[7:0] alu_res;
alu_8bit ALU(read_reg1, alu_operand2, aluop, zf, of, cf, sf, alu_res);

wire[7:0] address;
Mux2to1_8bit mux_mem_address(alu_res, immediate_wire, load_store, address);

Mux7to1_1bit jump_set_mux(zf, cf, (~zf)&(~cf), of^sf, (~zf)&(~(of^sf)), jump_type_wire, jump_taken);

wire[7:0] data_out_mem;
Data_Mem dm(memread, memwrite, address, read_reg1, data_out_mem);

Mux2to1_8bit mux_write_back(address, data_out_mem, memtoreg, write_backto_reg);

endmodule
