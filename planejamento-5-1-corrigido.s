    .text
	.globl	main

main:
    LDR r0, =-10
    LDR r1, =1
    B foo

foo:
    ADDS r0,r0,r1
    MOVPL r0, #0 @PL = Positivo ou zero
    MOVMI r0, #1 @MI = Negativo
    MOV pc, lr

