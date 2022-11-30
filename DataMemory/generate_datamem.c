#include <stdio.h>

int main() {
    int senha, numDeTentativas, quantidadeDeTentativas, tentativaAtual, i;
    printf("module data_memory(input clk,\n input mem_read,\n input mem_write,\n input [31:0] endereco,\n input [31:0] write_data,\n output reg [31:0] read_data\n );\nreg [4:0] endereco_atual;\nreg [31:0] Memory [31:0];\ninteger i;\n // zera a memória inteira e adiciona no final\ninitial begin\n  /* quantidade de tentativas */\n");
    
    scanf("%d", &senha);
    scanf("%d", &numDeTentativas);
    printf("Memory[0] = 32'd%d\nMemory[1] = 32'd%d;\n", senha, numDeTentativas);

    for (i = 0; i < numDeTentativas; i++) {
        scanf("%d", &tentativaAtual);
        printf("Memory[%d] = 32'd%d;\n", i+2, tentativaAtual);
    }
    printf("Memory[12] = 32'd1;\nend\n//  assincrono\nalways @(endereco) begin\n  endereco_atual = endereco[4:0];\n  if (mem_read == 1) begin\n  read_data = Memory[endereco_atual];\n  end\nend\n// sincrono\nalways @(posedge clk) begin\n  endereco_atual = endereco[4:0];\n  if (mem_write == 1) begin\nMemory[endereco_atual] = write_data;\n  end\nend\n endmodule\n");
    return 0;
}
