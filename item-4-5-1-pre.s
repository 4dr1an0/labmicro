@ Utilizamos o comando 'gcc item-4-5-1-pre.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Deseja-se fazer - > x = array[5] + y
@ O r0 armazena o resultado

    .text
	.globl	main
main:
    LDR r0, =0 @ x
    LDR r1, =9 @ y
    ADR r2, array @ array
    @ A operação solicitada é:
    LDR r5, [r2, #20]
    ADDS r0, r5, r1
    SWI 0x0

array:
    .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
