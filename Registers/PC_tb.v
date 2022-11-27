`timescale 1ns / 100 ps
module testbench();
    reg enable_tb, reset_tb, clk_tb;
    reg [31:0] datain_tb;
    wire [31:0] dataout_tb;
    parameter sete = 32'b00000000000000000000000000000111,
             oito = 32'b00000000000000000000000000001000;
	integer i = 0;
    PC uut (.datain(datain_tb), .dataout(dataout_tb), .enable(enable_tb), .reset(reset_tb), .clk(clk_tb));
	
    always #5 clk_tb = ~clk_tb; /*Definindo a onda de clock*/

    initial begin
	/*valores iniciais*/
        clk_tb = 0;
        reset_tb = 1;
        enable_tb = 0;
        #50 
        reset_tb = 0;
        enable_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10 /*Intervalo de tempo para os bits serem atualizados corretamente*/
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
        end
        #50
	/*Segundo teste: o valor eh resetado para zero*/
        reset_tb = 1;
        enable_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Controle ligado e entrada "sete", o valor eh setado em "sete"*/
        reset_tb = 0;
        enable_tb = 1;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == sete) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Terceiro teste: Controle ligado e entrada em "Oito", a saida devera ser sobrescrita de "sete" para "oito"*/
        reset_tb = 0;
        enable_tb = 1;
        datain_tb = oito;
        i = i + 1;
        #10
        if(dataout_tb == oito) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Quarto teste: Valor de entrada muda para "sete", mas os sinais estao desligados, a saida se mantem em "oito"*/
        reset_tb = 0;
        enable_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == oito) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Quinto teste: Resetado novamente para zero*/
        reset_tb = 1;
        enable_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Sexto teste: Todos os sinais de controle desligados, o valor de saida se mantem em "sete"*/
        reset_tb = 0;
        enable_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Setimo teste: Ambos sinais de controle e reset ligados, a saida deve continuar em zero*/
        reset_tb = 1;
        enable_tb = 1;
        datain_tb = oito;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
	/*Oitavo teste: Controle ligado e entrada em "sete", saida setada para "sete"*/
        reset_tb = 0;
        enable_tb = 1;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == sete) begin
            $display("TESTE %b CORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i,reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\nenable = %b\n->entrada = %b; saida = %b\n", i, reset_tb, enable_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        $stop; 
    end
endmodule   
