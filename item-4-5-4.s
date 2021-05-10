@ Utilizamos o comando 'gcc item-4-5-4.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ Deseja-se zerar o array
@ O comando 'x/4db array' no gdb mostra o array zerado

    .text
	.globl	main
main:
    LDR r1, =array
    LDR r2, =7  @s
    LDR r3, =0  @i
    LDR r4, =0  @zero
    BL loop
    SWI 0x0
loop:
    STRB r4, [r1, r3]    @guarda 0 em a[i]
    ADD r3, r3, #1   	 @i++
    CMP r3, r2           @i<s?
    BLT loop   		     @Se sim, repete
    MOV pc, lr

array:
    .byte 1
