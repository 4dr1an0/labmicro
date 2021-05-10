@ Utilizamos o comando 'gcc item-3-10-6.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ O valor carregado no registrador r0 eh transferido em modulo para o r1

	.text
	.globl	main
main:
	LDR	r0, =-221 
	ADDS r1, r0, #0
	RSBMI r1, r0, #0
	SWI 0x0 

	