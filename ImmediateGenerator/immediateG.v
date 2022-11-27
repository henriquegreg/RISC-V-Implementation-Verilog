module immediateG(instruction, immediate);
    input [31:0] instruction;      /*Instrucao de 32 bits*/
    output reg [31:0] immediate;   /*Gera um immediate de 12 bits*/    
    always @(*) begin
        
        case (instruction[6:0])    /*Observa os bits da OpCode e seleciona certos bits da instruction como Immediate*/
    //BEQ -> Branch if Equal;
    7'b1100011:
        immediate[31:0] = {20'd0, instruction[31], instruction[7], instruction[30:25], instruction[11:8]};
    //LW -> Load Word: Carrega uma palavra da DM para o registrador;
    7'b0000011:
        immediate[31:0] = {20'd0, instruction[31:20]};
    //SW -> Storage Word: Pega uma palavra do registrador e manda para o Data memory;
    7'b0100011:
        immediate[31:0] = {20'd0, instruction[31:25], instruction[11:7]};
    default:
        immediate[31:0] = 32'd0;
    endcase
    end
endmodule
