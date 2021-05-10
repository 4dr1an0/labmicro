@ Utilizamos o comando 'gcc item-4-5-5-words.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ O código tenta calcular o fibonacci de n, sendo r4 = n
@ O comando 'x/100d data' no gdb mostra os valores obtidos   
   
    .text
	.globl	main
main:
    LDR r0, =data @ posicao inicial do vetor
    LDR r4, =91
    LDR r1, =0x0   @ carrega 0 no r1
    LDR r2, =0x1   @ carrega 1 no r2
    STR r1, [r0], #4  @ guarda 0 na primeira posicao e atualiza r0
    STR r2, [r0], #4  @ guarda 1 na segunda posicao e atualiza r0
    BL loop
    SWI 0x0
loop:
    LDR   r1, [r0, #-4]     @ carrega o penultimo valor em r1
    LDR   r2, [r0, #-8]     @ carrega o ultimo valor em r2
    ADD   r3, r1, r2         @ calcula a soma
    SUB   r4, r4, #1
    CMP   r4, #0            @ verifica se atingiu o NUSP
    STRGT r3, [r0], #4    @ guarda condicionalmente o valor calculado e atualiza r0
    BGT  loop   		       @ se não atingiu, repete
    MOV pc, lr

data:
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0
    .word 0,0,0,0,0,0,0,0,0,0

