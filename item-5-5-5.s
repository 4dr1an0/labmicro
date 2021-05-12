@ Utilizamos o comando 'gcc item-5-5-5.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Tem-se 0x0001 em r1 caso a paridade de r0 seja impar e 0x0000 caso contrario

    .text
	.globl main

main: 
    LDR r0, =67 @ numero para verificar paridade 
    MOV r3, r0  @ copia de r0
    LDR r5, =32 @ contador
    LDR r2, =0  @ soma bit a bit
    LDR r1, =0  @ resultado
    BL contaum
    MOVS r2, r2, LSR #1 @ manda o lsb de r2 para o carry
    ADC r1, r1, #0      @ adiciona o carry ao resultado
    SWI 0x0

contaum: 
    MOVS r3, r3, LSL #1 @ desloca o numero atualizando carry
    ADC r2, r2, #0      @ adiciona carry a r2
    SUBS r5, r5, #1     @ decrementa contador
    BNE contaum         @ repete se nao acabou
    MOV pc, lr
