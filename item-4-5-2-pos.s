@ Utilizamos o comando 'gcc item-4-5-2-pos.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Deseja-se fazer - > array[10] = array[5] + y
@ O comando 'x/16d array' no gdb mostra resultado obtido

    .text
	.globl	main
main:
    LDR r1, =9 @ y
    ADR r2, array @ array
    @ A operação solicitada é:
    ADD  r2, r2,   #20
    LDR  r0, [r2], #20
    ADDS r3, r0, r1
    STR  r3, [r2]
    SWI 0x0

array:
    .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
