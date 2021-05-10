@ Utilizamos o comando 'gcc item-2-4-1.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o cรณdigo
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o codigo, como pede o enunciado

	.text
	.globl	main
main:
	MOV	r0, #15
	MOV	r1, #20
	BL	firstfunc
	MOV	r0, #0x18
	LDR	r1, =0x20026
	SWI	0x0
firstfunc:
	ADD	r0, r0, r1
	MOV	pc, lr

