@ Utilizamos o comando 'gcc item-3-10-5.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ O resultado esperado encontra-se nos registradores r5 e r4
@ O resultado obtido encontra-se nos registradores r3 e r2

	.text
	.globl	main
main:
	LDR	r0, =-4
	LDR r1, =-2
	SMULL r4, r5, r1, r0 @ Guarda nos registradores r5 e r4 o resultado esperado
	EOR r7, r1, r0  @ Cria uma flag pra saber se precisa trocar o sinal
	CMP r0, #0  @ Vê se o primeiro é negativo
	RSBMI r0, r0, #0 @ Troca o sinal se for negativo
	CMP r1, #0  @ Vê se o segundo é negativo
	RSBMI r1, r1, #0 @ Troca o sinal se for negativo
	UMULL r2, r3, r1, r0 @ Multiplica os módulos sem atualizar as flags
	CMP r7, #0  @ Verifica se precisa trocar o sinal do resultado
	BLMI inverte @ Faz o complemento de dois caso necessário
	SWI 0x0

inverte: @ Calcula o complemento de dois do resultado da multiplicacao
	MVN r2, r2
	ADDS r2, r2, #1
	MVN r3, r3
	ADC r3, r3, #0
	MOV	pc, lr

