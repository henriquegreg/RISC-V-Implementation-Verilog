`timescale 1ns/100ps

module InstructionMemory(
    input [31:0] PC,
    output [31:0] instruction
);
    reg [31:0] Memory [63:0];

    integer i;

    initial begin
        /* seta posição 0x5 (registrador) como 0xC (memória) */
        Memory[0] = 32'b00000000110000000010001010000011;
        /* seta register 0x1 como o número aleatório gerado (0x0 da memória) */
        Memory[1] = 32'b00000000000000000010000010000011;
        /* seta register 0x2 como o número de tentativas máximo (0x1 da memória) */
        Memory[2] = 32'b00000000000100000010000100000011;
        
        /*
            Bloco para tentativa 1
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[3] = 32'b00000100000000010000100101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 1 (0x2 da memória) */
        Memory[4] = 32'b00000000001000000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[5] = 32'b00000110001100001000000001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[6] = 32'b01000000010100010000000100110011;
        
        /*
            Bloco para tentativa 2
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[7] = 32'b00000100000000010000001101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 2 (0x3 da memória) */
        Memory[8] = 32'b00000000001100000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[9] = 32'b00000100001100001000010001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[10] = 32'b01000000010100010000000100110011;

        /*
            Bloco para tentativa 3
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[11] = 32'b00000010000000010000111101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 3 (0x4 da memória) */
        Memory[12] = 32'b00000000010000000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[13] = 32'b00000100001100001000000001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[14] = 32'b01000000010100010000000100110011;
        

        /*
            Bloco para tentativa 4
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[15] = 32'b00000010000000010000101101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 4 (0x5 da memória) */
        Memory[16] = 32'b00000000010100000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[17] = 32'b00000010001100001000110001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[18] = 32'b01000000010100010000000100110011;
        
        /*
            Bloco para tentativa 5
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[19] = 32'b00000010000000010000011101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 5 (0x6 da memória) */
        Memory[20] = 32'b00000000011000000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[21] = 32'b00000010001100001000100001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[22] = 32'b01000000010100010000000100110011;
        

        /*
            Bloco para tentativa 6
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[23] = 32'b00000010000000010000001101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 6 (0x7 da memória) */
        Memory[24] = 32'b00000000011100000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[25] = 32'b00000010001100001000010001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[26] = 32'b01000000010100010000000100110011;
        
        /*
            Bloco para tentativa 7
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[27] = 32'b00000000000000010000111101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 7 (0x8 da memória) */
        Memory[28] = 32'b00000000100000000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[29] = 32'b00000010001100001000000001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[30] = 32'b01000000010100010000000100110011;
        
        /*
            Bloco para tentativa 8
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[31] = 32'b00000000000000010000101101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 8 (0x9 da memória) */
        Memory[32] = 32'b00000000100100000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[33] = 32'b00000000001100001000110001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[34] = 32'b01000000010100010000000100110011;

        /*
            Bloco para tentativa 9
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[35] = 32'b00000000000000010000011101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 9 (0xA da memória) */
        Memory[36] = 32'b00000000101000000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[37] = 32'b00000000001100001000100001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[38] = 32'b01000000010100010000000100110011;

        /*
            Bloco para tentativa 10
        */
        /* se 0x2 (tentativas feitas) - 0x0 (0) == 0, número de tentativas atual é 0 */
        Memory[39] = 32'b00000000000000010000001101100011;
        /* seta register 0x3 (tentativa atual) como a tentativa 10 (0xB da memória) */
        Memory[40] = 32'b00000000101100000010000110000011;
        /* se 0x1 (senha) - 0x3 (tentativa atual) == 0, tentativa atual esta certa */
        Memory[41] = 32'b00000000001100001000010001100011;
        /* seta registrador 0x2 (tentativas feitas) como 0x2 - 0x5 (posição valendo 1) */
        Memory[42] = 32'b01000000010100010000000100110011;
        
        /* chega aqui caso tenham sido feitas todas as tentativas e nenhuma correta */
        /* seta memoria 0xD (resultado) como 0x0 (register nulo) (resposta errada) */
        Memory[43] = 32'b00000000000000000010011010100011;
        /* salta para o final do programa */
        Memory[44] = 32'b00000000000000000000001101100011;
        
        /* seta memoria 0xD (resultado) como 0x5 (register valendo 1) (resposta certa) */
        Memory[45] = 32'b00000000010100000010011010100011;
        /* coloca no registrador 0x4 o resultado do jogo */
        Memory[46] = 32'b00000000110100000010001000000011;
        /* termina o programa travando o PC */
        Memory[47] = 32'b00000000000000000000000001100011;

        for (i = 48; i < 64; i = i + 1) begin
            Memory[i] = 32'b0;
        end
    end
    
    assign instruction = Memory[PC];
endmodule