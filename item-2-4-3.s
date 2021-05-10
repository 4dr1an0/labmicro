@ Utilizamos o comando 'gcc item-2-4-3.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Com o comando (s)tep executamos linha a linha
@ Para vizualizar o conteúdo do registrador durante a execução, utiliza-se o (p)rint
@ Os comando pedidos pelo enunciado ficam:
@ p/x $r0 (hexa)
@ p/o $r0 (octa)
@ p/d $r0 (decimal)
@ p/t $r0 (binario)
@ p/c $r0 (ascii)

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
