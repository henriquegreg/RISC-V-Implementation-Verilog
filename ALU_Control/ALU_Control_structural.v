module ALU_Control (
    input ALUOp1,
    input ALUOp0,
    input [3:0] funct,
    output [3:0] operation
);
    and (operation[3], ALUOp1, ~ALUOp1);
    and (operation[2], ALUOp1, funct[3]);
    or (operation[1], ~ALUOp1, ~funct[1]);
    and (operation[0], ALUOp1, funct[2], ~funct[0]);
endmodule