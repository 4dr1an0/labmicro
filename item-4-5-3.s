@ Utilizamos o comando 'gcc item-4-5-3.s' para compilar e gerar o arquivo a.out
@ Utilizamos o comando 'gdb a.out' para rodar o programa em modo debug
@ Fizemos 'b main' e um break na linha do SWI
@ Com o comando (r)un rodamos o código
@ Por ultimo, utilizamos o (c)ontinue para rodar todo o código
@ O código faz - > for ( i = 0; i <= 10; i++) {a[i] = b[i] + c;}
@ O comando 'x/12db data_a' no gdb mostra os valores obtidos

    .text
	.globl	main
main:
    LDR r1, =data_a
    LDR r2, =data_b
    LDR r3, =0  @i
    LDR r4, =5  @c
    BL loop
    SWI 0x0
loop:
    LDRB r5, [r2, r3]    @carrega no r5 o valor b[i]
    ADDS r5, r5, r4
    STRB r5, [r1, r3]    @guarda o resultado em a[i]
    ADD r3, r3, #1   	 @i++
    CMP r3, #10          @i>10?
    BLS loop   		     @Se não, repete
    MOV pc, lr

data_a:
    .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
data_b:
    .byte 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
