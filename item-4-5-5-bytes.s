@ Utilizamos o comando 'gcc item-4-5-5-bytes.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ O vetor é apontado pelo registrador r8
@ O comando 'x/16db $r8' no gdb mostra os valores obtidos

    .text
	.globl	main
main:
    LDR r0, =0x4000 @ posicao inicial do vetor
    LDR r8, =0x4000     @ backup do vetor
    LDRB r1, =0x0   @ carrega 0 no r1
    LDRB r2, =0x1   @ carrega 1 no r2
    STRB r1, [r0], #1  @ guarda 0 na primeira posicao e atualiza r0
    STRB r2, [r0], #1  @ guarda 1 na segunda posicao e atualiza r0
    BL loop
    SWI 0x0
loop:
    LDRB r1, [r0, #-1]     @ carrega o penultimo valor em r1
    LDRB r2, [r0, #-2]     @ carrega o ultimo valor em r2
    ADD r3, r1, r2         @ calcula a soma
    CMP r3, #0x7F          @ verifica se ocorreu overflow
    STRLSB r3, [r0], #1   @ guarda o valor calculado, caso ele nao seja maior q um byte e atualiza r0
    BLS loop   		       @ se não, repete
    MOV pc, lr
