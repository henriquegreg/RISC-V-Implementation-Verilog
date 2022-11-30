# Memória de Dados

Na memória de dados, são adicionadas as condições iniciais do programa que foi simulado no processador. A definição desse programa está presente na página inicial do repositório e na pasta da Memória de Instruções.

## Geração de Memórias de Dados automática
Para tornar a implementação do Exercício-Programa da disciplina de MAC2166 mais divertida, foi criado um método para gerar as suas próprias tentativas de adivinhar o número aleatório.
O arquivo "generate_datamem.c" na linguagem C pode ser compilado por meio do comando:

``gcc generate_datamem.c -o gerator``

O arquivo generator será gerado. Ele deverá ser executado com o comando:

``./generator > DataMemory.v``

Os input são dessa forma:

```
4
3
1
2
3
```

Sendo que o primeiro input é a senha (0 <= x < 10), o segundo é o número de tentativas n (0 <= x < 10) e os outros números são os inputs para cada uma das tentativas n (cada uma 0 <= x < 10). No final, o arquivo DataMemory.v será gerado.

## Recursos para leitura e escrita na memória
Os sinais mem_read e mem_write habilitam a leitura de uma posição "endereco" (output "read_data") ou a escrita de uma "write_data" na posição endereço, respectivamente.
A leitura é assíncrona (sem depender da borda de subida do clock) e a escrita é síncrona (ocorre na borda de subida do clock).

## Utilização da memória
Abaixo estão as posições da memória 32x32 que foram usadas, assim como as suas especificações.
A senha é gerada por um gerador de números aleatórios e as outras são específicadas manualmente, representando um input do usuário.
A Memória de Dados também serve de output, já que o resultado (1 se o jogador adivinhou a senha e 0 caso contrário) será gravado na posição especificada).

<p align="center">
  <img src="datamem.png" width="100%" height="180%"\>
</p>

