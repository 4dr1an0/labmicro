    .text
	.globl main

main: 
    LDR r0, =67
    MOV r3, r0 @ copia de r0
    LDR r5, =32
    LDR r2, =0
    LDR r1, =0
    BL contaum
    MOVS r2, r2, LSR #1
    ADC r1, r1, #0
    SWI 0x0

contaum: 
    MOVS r3, r3, LSL #1
    ADC r2, r2, #0
    SUBS r5, r5, #1
    BNE contaum
    MOV pc, lr
