    .text
	.globl	main
main:
    ADR r0, data_a
    ADR r1, data_b
    LDR r3, =0 @i
    BL loop
    SWI 0x0
loop:
    RSB r4, r3, #7    @calcula 7-i
    LDRB r5, [r1, r4] @carrega no r5 o valor b[7-i]
    STRB r5, [r0, r3] @guarda o resultado em a[i]
    ADD r3, r3, #1   	 @i++
    CMP r3, #7        @i>7?
    BLS loop   		 @Se não, repete
    MOV pc, lr

data_a:
    .byte 0, 0, 0, 0, 0, 0, 0, 0
data_b:
    .byte 0, 1, 2, 3, 4, 5, 6, 7


