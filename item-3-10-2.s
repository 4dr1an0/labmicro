@ Utilizamos o comando 'gcc item-3-10-2.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ O resultado da multiplicação fica no r2 e as flags no cpsr

	.text
	.globl	main
main:
	LDR	r0, =0xFFFFFFFF 
	LDR	r1, =0x80000000
	MULS r2, r0, r1
	SWI	0x0

