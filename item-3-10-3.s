@ Utilizamos o comando 'gcc item-3-10-3.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o codigo
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o codigo
@ O resultado ficou no registrador r1

	.text
	.globl	main
main:
	LDR	r0, =0x00000800
	MOV r1, r0, LSL #5
	SWI	0x0
