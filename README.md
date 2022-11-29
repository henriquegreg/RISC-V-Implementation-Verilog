
<p align="center">
  <img src="./GrupoCessar.png" width="100%" height="40%"/>
</p>

<p align="center">
  <a href="https://github.com/henriquegreg/Grupo-3---Grupo-Cessar---PCS3115">
    <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
  </a>
  <a href="http://iverilog.icarus.com/">
    <img src="http://iverilog.icarus.com/_/rsrc/1302225644705/config/customLogo.gif?revision=5" height="28" width="101" />
  </a>
  <a href="https://gtkwave.sourceforge.net/">
    <img src="https://i.ibb.co/s1ztX55/gtk.png" height="28" width="101" />
  </a>
</p>

<p align="center">
  <a href="https://github.com/C-Tadaki-S">
    <img src="https://avatars.githubusercontent.com/u/103610912?s=70&v=4" height="50" width="50" />
  </a>
  <a href="https://github.com/henriquegreg">
    <img src="https://avatars.githubusercontent.com/u/103610752?s=70&v=4" height="50" width="50" />
  </a>
  <a href="https://github.com/jofe2003">
    <img src="https://avatars.githubusercontent.com/u/112812381?s=70&v=4" height="50" width="50" />
  </a>
  <a href="https://github.com/bertanbee">
    <img src="https://avatars.githubusercontent.com/u/52827517?s=70&v=4" height="50" width="50" />
  </a>
</p>



# Olá, bem-vindo ao repositório do grupo 3 (Grupo Cessar)!

Oi, tudo bem? Nós somos alunos do 1° ano de Engenharia de Computação da Escola Politécnica da USP no ano de 2022. 
Os integrantes do grupo são: Celso Tadaki Sinoka, Henrique Gregory Gimenez, João Felipe de Souza Melo e Lucas Suzin Bertan. Nós compomos o grupo 3 da disciplina PCS-3115 (Sistemas Digitais I).
Neste repositório você encontrará uma implementação de um processador com a arquitetura RISC-V na linguagem de descrição de hardware Verilog. O objetivo final deste projeto consiste em aplicar esse processador para rodar um jogo de advinhação, que foi desenvolvido como exercício em uma disciplina anterior (MAC2166 - Introdução à Computação).
Os resultados da simulação desse programa, assim como sua implementação no RISC-V, estão na pasta da Instruction Memory. Vai lá conferir :)

Abaixo você poderá ver um diagrama detalhado que descreve o funcionamento do circuito:

![Circuito](Circuito.jpg)

## Instruções
As instruções que o processador feito pelo grupo utiliza são:
|  Instrução  | Tipo |  Descrição |
|-------------|---|---|
| add  | R  | Soma dois registradores (rs1 e rs2) e armazena o resultado no registrador rd  |
| sub   | R | Subtrai dois registradores (rs1 e rs2) e armazena o resultado no registrador rd  |
| and | R  | Faz a operação lógica and bitwise (bit a bit) entre dois registradores (rs1 e rs2) e armazena o resultado no registrador rd  |
| or | R  | Faz a operação lógica or bitwise (bit a bit) entre dois registradores (rs1 e rs2) e armazena o resultado no registrador rd   |
| lw (load word) | S  | carrega uma palavra da Memória de Dados da posição rs1 + offset e armazena o valor lido no registrador rd |
| sw (store word) |  I | armazena uma palavra do registrador rs2 na posição da Memória de Dados rs1 + offset |
| beq (branch if equal) |  B | Compara o conteúdo dos registradores rs2 e rs1. Caso eles sejam iguais (a subtração entre os dois tem resultado 0), o Program Counter, que marca a linha atual na Instruction Memory, é setado para PC atual + offset  |

Abaixo estão a estrutura de cada tipo de instrução:

<p align="center">
  <img src="instructionset.png" width="100%" height="39%" />
</p>

<p align="center">
⚠️ INFORMAÇÃO IMPORTANTE ⚠️
</p>
<p align="center">
Para seguir em frente, é necessário compreender o que cada parte da instrução significa.
</p>

| Abreviação | Significado | Descrição |
|------|-----|-----|
|rs1| register source 1|endereço do primeiro registrador de uma operação|
|rs2| register source 2|endereço do segundo registrador de uma operação|
|rd| register destination| endereço do registrador de destino de alguma operação|
|imm| immediate | um número de entrada |
| opcode | operation code | é a parte da instrução que diferencia um tipo de instrução, tipo R, B, I ...|
| funct | | são espaços usados para diferenciar instruções. Exemplo, add e sub tem o mesmo opcode, mas functs diferentes. Para diferenciar funct3 e funct7, conte quantos bits eles tem :) |


## Simulação
Para simular o nosso código, usamos o Icarus Verilog e o GTKWave.
Abaixo estão os ícones com os links para o site do Icarus Verilog e do GTKWave, contendo as instruções para a instalação.
<p align="center">
  <a href="http://iverilog.icarus.com/">
    <img src="http://iverilog.icarus.com/_/rsrc/1302225644705/config/customLogo.gif?revision=5" height="28" width="101" />
  </a>
  <a href="https://gtkwave.sourceforge.net/">
    <img src="https://i.ibb.co/s1ztX55/gtk.png" height="28" width="101" />
  </a>
</p>

Os comandos para rodar são:

``
iverilog risc-v.v risc-v_TB.v -Wall -I ./ALU -I ./ALU/operations -I ./ALU/operations -I ./adders
``

<p align="center">
  ⚠️ ATENÇÃO ⚠️
</p>
<p align="center">
  Caso ocorra algum erro ao importar algum arquivo, um problema provável é que o Icarus Verilog considerou o caminho do workspace como padrão de início do navegação até um arquivo. Caso tenha problema com isso, verifique este arquigo no StackOverflow
 
</p>
<p align="center">
  <a href="https://stackoverflow.com/questions/47449489/how-to-include-files-in-icarus-verilog">
    <img src="data:image/png;base64,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" height="20" width="100" />
  </a>
</p>

Um arquivo nomeado "a.out" será gerado e, a seguir, deve ser executado.

``
./a.out
``

O arquivo com as ondas simuladas serão escritas no arquivo 'my_dumpfile.vcd", sendo agora necessário visualizá-las no GTKWave.

``
gtkwave my_dumpfile.vcd
``

Por fim, uma tela parecida com essa aparecerá:

<p align="center">
  <img src="gtkwave.png" height="70%" width="100%" />
</p>

Para as testbenches, foi utilizado o Questa*-Intel® FPGA Edition Software.

<p align="center">
  <a href="https://www.intel.com.br/content/www/br/pt/software/programmable/quartus-prime/questa-edition.html">
    <img src="https://logos-world.net/wp-content/uploads/2021/09/Intel-Emblem.png" height="28" width="75" />
  </a>
</p>

Para simular, dentro das respectivas pastas, basta realizar os seguintes comandos:

`` vlog seuarquivo.v``

Com o seu código em Verilog compilado, agora basta compilar a testbench também:

``vlog testbench.v``

Por fim, você pode inicializar a simulação:

``vsim -c work.testbench``

Um novo terminal será aberto para a simulação. Agora você pode simular por um tempo determinado por ti, observe atentamente a testbench para adicionar o valor adequado. Abaixo um exemplo:

``run 10000ns``

Após a simulação terminar de rodar e mostrar os possíveis erros, basta inserir o seguinte comando para sair do novo terminal aberto:

``quit``

## Considerações finais

Em cada uma das pastas, você encontrará os módulos utilizados para essa implementação, bem como seus respectivos testbenches. Além disso, há comentários nos códigos que explicam o comportamento de tais componentes.

Espero que você se divirta bastante navegando pelos códigos e possa aprender mais ainda sobre Sistemas Digitais! :)

## Referências
Instruction Set oficial do RISC-V: https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

Computer Organization and Design - RISC-V Edition: http://home.ustc.edu.cn/~louwenqi/reference_books_tools/Computer%20Organization%20and%20Design%20RISC-V%20edition.pdf

Guia Prático RISC-V 1.0.0: http://riscvbook.com/portuguese/guia-pratico-risc-v-1.0.0.pdf

Site do professor Bruno Albertini: https://balbertini.github.io/pages/sobre-pt_BR.html
