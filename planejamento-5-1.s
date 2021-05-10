    .text
	.globl	main

main:
    LDR r0, =-10
    LDR r1, =1
    B foo

foo:
    ADDS r0,r0,r1
    BPL PosOrZ

done:
    MOV r0, #0
    MOV pc, lr

PosOrZ:
    MOV r0,#1
    B done

