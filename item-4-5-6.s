@ Utilizamos o comando 'gcc item-4-5-6.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Tem-se inicialmente r1 = n e no final r0 = fibonacci(n)

    .text
	.globl	main
main:
    LDRB r1, =10   @ carrega n no r1
    LDRB r2, =0x0   @ carrega 0 no r2
    LDRB r3, =0x1   @ carrega 1 no r3
    SUBS r1, r1, #2
    BL loop
    SWI 0x0
loop:
    SUBS r1, r1, #1
    ADD r0, r2, r3
    MOV r2, r3
    MOV r3, r0 
    BPL loop
    MOV pc, lr
