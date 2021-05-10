    .text
	.globl	main
main:
    LDR r0, =0x4000
    LDR r1, =0x5000
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


