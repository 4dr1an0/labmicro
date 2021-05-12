@ Utilizamos o comando 'gcc item-5-5-1.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Tem-se inicialmente r1 = i e no final os resultados são armazenados na memória nas posições solicidadas

    .text
	.globl	main
main:
    LDR r0, =0x4000 @ array a
    LDR r1, =0x5000 @ array b
    LDR r3, =0      @ i
    BL loop
    SWI 0x0
loop:
    RSB r4, r3, #7    @ calcula 7-i
    LDRB r5, [r1, r4] @ carrega no r5 o valor b[7-i]
    STRB r5, [r0, r3] @ guarda o resultado em a[i]
    ADD r3, r3, #1    @ i++
    CMP r3, #7        @ i=<7?
    BLS loop   		  @ Se sim, repete
    MOV pc, lr


