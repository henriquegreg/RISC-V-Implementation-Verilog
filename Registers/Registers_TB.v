`timescale 1ns/100ps
module testbench () ;
    reg [4:0] readRegister1;
    reg [4:0] readRegister2;
    reg [4:0] writeRegister;
    reg [31:0] writeData;
    reg regWrite;
    reg clk;
    wire [31:0] readData1;
    wire [31:0] readData2;

    Registers UUT (.readRegister1(readRegister1), .readRegister2(readRegister2), .writeRegister(writeRegister), .regWrite(regWrite), .clk(clk), .readData1(readData1), .readData2(readData2));

    integer errors = 0;
    task Check ;
        input [31:0] expect1;
        input [31:0] expect2;

        if (readData1 != expect1 || readData2 != expect2) begin
                $display ("Error : readRegister1: %d readRegister2: %d expect1: %b got: %b expect2: %b got: %b", readRegister1, readRegister2, expect1, readData1, expect2, readData2);
                errors = errors + 1;
        end
    endtask

        initial clk = 1'b0;
        always #10 clk = ~clk;

        initial begin
        /* nao deixa nenhum registrador ser escrito */
        regWrite = 1'b0;

        /* testa a leitura dos dois primeiros registradores
           O registrador 0x0 e inicializado em 32'd0 e o 0x1
           nao e inicializado */
        readRegister1 = 5'd0;
        readRegister2 = 5'd1;
        #11
        Check(32'd0, 32'dx);

        /* escreve nos dois primeiros registradores */
        regWrite = 1'b1;
        writeRegister = 5'd0;
        writeData = 32'd1;
        #11
        regWrite = 1'b1;
        writeRegister = 5'd1;
        writeData = 32'd1;
        #11
        /* verifica se a escrita foi um sucesso
           testando os dois primeiros registradores,
           infere-se que o restante esta correto */
        regWrite = 1'b0;
        Check(32'd1, 32'd1);

        $display (" Test ended , %2d errors ", errors );
        end
endmodule