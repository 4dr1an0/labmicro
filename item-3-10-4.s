@ Utilizamos o comando 'gcc item-3-10-4.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o codigo
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o codigo
@ Verifica-se que no final os valores dos registradores se inverteram

	.text
	.globl	main
main:
	LDR	r0, =0xF631024C
	LDR r1, =0x17539ABD
	EOR r0, r0, r1
	EOR r1, r0, r1
	EOR r0, r0, r1
	SWI	0x0
