`include "./ClockGenerator/clock_gen.v"
`include "./InstructionMemory/InstructionMemory.v"
`include "./Registers/PC.v"
`include "./Control-Monocycle/Control.v"
`include "./Registers/Registers.v"
`include "./ImmediateGenerator/immediateG.v"
`include "./ALU_Control/ALU_Control_structural.v"
`include "./ALU/ALU.v"
`include "./DataMemory/DataMemory.v"
`include "./mux/mux.v"
`include "./adders/sum.v"

module riscv (
    input wire semente,
    input reset
);
    initial begin
        $dumpfile("my_dumpfile.vcd"); 
        $dumpvars(0, riscv);
    end
    /* 
        Wires especificados. Para localizar exatamente
        as entradas e as saidas, verificar o arquivo
        datapath.png
     */
    wire clk;
    /* saida do mux A que vai para o PC */
    wire [31:0] nextPCPosition;
    /* saida do PC */
    wire [31:0] instructionAdress;
    /* saida da instruction memory, e a instrucao atual */
    wire [31:0] instructionCurrent;
    /* outputs do control */
    wire RegDst;
    wire ALUSrc;
    wire MemToReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;
    wire ALUOp1;
    wire ALUOp0;
    /* saida do mux B que vai para os registers */
    wire [31:0] dataToWrite;
    /* conteudo do register lido 1 */
    wire [31:0] dataReadRegister1;
    /* conteudo do register lido 2 */
    wire [31:0] dataReadRegister2;
    /* imediato gerado */
    wire [31:0] imm;
    /* operacao gerada pela ALU Control */
    wire [3:0] ALUOp;
    /* saida do mux C, segunda entrada da ALU */
    wire [31:0] ndInputALU;
    /* resultado da operacao da ALU */
    wire [31:0] ALUResult;
    /* se o resultado da ALU e zero */
    wire zero;
    /* dados lidos da memoria */
    wire [31:0] dataReadFromMemory;
    /* resultado do and do branch */
    wire andBranch;
    /* resultado adder A */
    wire [31:0] resAdderA;
    /* resultado adder B */
    wire [31:0] resAdderB;

    ClockGen clkgen (.clk(clk));    
    PC programCounter (.datain(nextPCPosition), .dataout(instructionAdress), .enable(1'b1), .reset(reset), .clk(clk));
    sum adderB (.A(instructionAdress), .B(32'd1), .result(resAdderB));
    
    InstructionMemory instmemo (.PC(instructionAdress), .instruction(instructionCurrent));
    ControlUnit control (.Op({
        instructionCurrent[6],
        instructionCurrent[5],
        instructionCurrent[4],
        instructionCurrent[3],
        instructionCurrent[2],
        instructionCurrent[1],
        instructionCurrent[0]}),
        .RegDst(RegDst), .ALUSrc(ALUSrc), .MemToReg(MemToReg),
        .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch),
        .ALUOp1(ALUOp1), .ALUOp0(ALUOp0));
    ALU_Control aluctrl (.ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .funct({
        instructionCurrent[30],
        instructionCurrent[14],
        instructionCurrent[13],
        instructionCurrent[12]
    }), .operation(ALUOp));

    immediateG immgen (.instruction(instructionCurrent), .immediate(imm));
    sum adderA (.A(instructionAdress), .B(imm), .result(resAdderA));

    data_memory datamem (.clk(clk), .mem_read(MemRead), .mem_write(MemWrite), .endereco(ALUResult), .write_data(dataReadRegister2), .read_data(dataReadFromMemory));

    Registers regs (
        .readRegister1({
            instructionCurrent[19],
            instructionCurrent[18],
            instructionCurrent[17],
            instructionCurrent[16],
            instructionCurrent[15]}),
        .readRegister2({
            instructionCurrent[24],
            instructionCurrent[23],
            instructionCurrent[22],
            instructionCurrent[21],
            instructionCurrent[20]
        }),
        .writeRegister({
            instructionCurrent[11],
            instructionCurrent[10],
            instructionCurrent[9],
            instructionCurrent[8],
            instructionCurrent[7]
        }),
        .writeData(dataToWrite),
        .regWrite(RegWrite),
        .clk(clk),
        .readData1(dataReadRegister1), 
        .readData2(dataReadRegister2));
    mux C(.A(imm), .B(dataReadRegister2), .select(ALUSrc), .result(ndInputALU));
    ALU alu (.A(dataReadRegister1), .B(ndInputALU), .ALUOp(ALUOp), .result(ALUResult), .zero(zero));
    
    
    and (andBranch, Branch, zero);
    mux A (.A(resAdderA), .B(resAdderB), .select(andBranch), .result(nextPCPosition));
    mux B (.A(dataReadFromMemory), .B(ALUResult), .select(MemToReg), .result(dataToWrite));
endmodule