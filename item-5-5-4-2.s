@ Utilizamos o comando 'gcc item-5-5-4-2.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ A saida Z do detector de sequencia fica armazenada em r2

    .text
	.globl main

main: 
    LDR r8, =0b101      @ sequencia a ser identificada, Y
    LDR r9, =3          @ tamanho de Y
    LDR r1, =0x5555AAAA @ sequencia X
    LDR r2, =0          @ inicializa o resultado Z
    LDR r3, =0          @ contador 
    RSB r4, r9, #32     @ 32 - n  
    LDR r6, =1          @ bit de trabalho
    MOV r6, r6, LSL r4  @ posiciona bit de trabalho

loop: 
    MOV r5, r1         @ faz uma copia de X
    MOV r5, r5, LSL r3 @ desloca X para eliminar bits a esquerda
    MOV r5, r5, LSR r4 @ faz o mesmo para os bits a direita
    ADD r3, r3, #1     @ incrementa o contador
    CMP r5, r8         @ compara trecho de X com Y
    ADDEQ r2, r2, r6   @ adiciona o bit de trabalho na posicao correta
    MOV r6, r6, LSR #1 @ desloca o bit de trabalho
    CMP r3, r4         @ compara para saber se ja analisou X inteiro
    BLE loop           @ repete se nao acabou
    SWI 0x0