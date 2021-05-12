@ Utilizamos o comando 'gcc item-5-5-2.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Tem-se inicialmente r6 = n e no final o fatorial de n fica armazenado em r6 

    .text
	.globl main

main: 
    MOV r6, #0xA  @ carrega 10 no r6
    MOV r4, r6    @ copia n em um reg temporario

loop:
    SUBS r4, r4, #1  @ decrementa proximo multiplicador
    MULNE r5, r6, r4 @ multiplica
    MOVNE r6, r5     @ salva resultado
    BNE loop         @ repete se ainda nao completou
    SWI 0x0


