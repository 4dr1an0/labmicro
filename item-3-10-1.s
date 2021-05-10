@ Utilizamos o comando 'gcc item-3-10-1.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o codigo
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o codigo
@ Ou (s)tep para ir passo a passo e avaliar as flags no cpsr
@ Os resultados das somas ficam nos registradores r2, r5 e r8

	.text
	.globl	main
	
main:
	LDR	r0, =0xFFFF0000
	LDR	r1, =0x87654321
	ADDS r2, r0, r1
	LDR	r3, =0xFFFFFFFF
	LDR	r4, =0x12345678
	ADDS r5, r3, r4
	LDR	r6, =0x67654321
	LDR	r7, =0x23110000
	ADDS r8, r6, r7	
	SWI	0x0
	
