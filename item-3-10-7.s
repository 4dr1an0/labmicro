@ Utilizamos o comando 'gcc item-3-10-7.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código

	.text
	.globl	main
main:
	LDR	r1, =10773291 @dividendo
	LDR	r2, =1000  @divisor
	LDR r3, =0  @quociente
	LDR r4, =1  @bit de trabalho

align:
	CMP   r2, r1
	MOVLS r2, r2, LSL #1
	MOVLS r4, r4, LSL #1
	BLS   align
	
divloop:
	CMP   r2, r1
	SUBLS r1, r1, r2
	ADDLS r3, r3, r4
	MOV   r2, r2, LSR #1
	MOVS  r4, r4, LSR #1
	BCC   divloop

	MOV r5, r1 @ resto no r5

	SWI	0x0


