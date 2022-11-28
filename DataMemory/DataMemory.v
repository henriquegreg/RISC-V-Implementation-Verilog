module data_memory(input clk,      
                   input mem_read,
                   input mem_write,
                   input [31:0] endereco,
                   input [31:0] write_data,
                   output reg [31:0] read_data
                   );

   reg [4:0] endereco_atual;
   reg [31:0] Memory [31:0];
   integer i;

    // zera a memória inteira e adiciona no final
   initial begin
        /* armazena a senha gerada */
        Memory[0] = 32'd9;
        /* quantidade de tentativas */
        Memory[1] = 32'd10;
        /* cada uma das tentativas possiveis */
        Memory[2] = 32'd0;
        Memory[3] = 32'd1;
        Memory[4] = 32'd2;
        Memory[5] = 32'd3;
        Memory[6] = 32'd4;
        Memory[7] = 32'd5;
        Memory[8] = 32'd6;
        Memory[9] = 32'd7;
        Memory[10] = 32'd8;
        Memory[11] = 32'd9;
        /* posicao valendo 1 para setar no programa */
        Memory[12] = 32'd1;
   end
   
   //  assincrono
   always @(endereco) begin
        endereco_atual = endereco[4:0];

        if (mem_read == 1) begin
              read_data = Memory[endereco_atual];  
        end
   end  
   
   // sincrono
   always @(posedge clk) begin
        endereco_atual = endereco[4:0];
        
        if (mem_write == 1) begin
            Memory[endereco_atual] = write_data;
        end
   end      
                   
           
endmodule
