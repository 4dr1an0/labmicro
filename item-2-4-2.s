@ Utilizamos o comando 'gcc item-2-4-2.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (s)tep e o (n)ext para executar linha a linha
@ Sabemos que o correto é utilizar o s, porém o enunciado pede os dois testes

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
	ADDS	r0, r0, r1
	MOV	pc, lr
