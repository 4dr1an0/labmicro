	.text
	.globl	main
main:
	LDR	r1, =21 @dividendo
	LDR	r2, =4  @divisor
	LDR r3, =0  @quociente
	LDR r4, =1  @bit de trabalho

align:
	CMP   r2, r1
	MOVLS r2, r2, LSL #1
	MOVLS r4, r4, LSL #1
	BLS   align
	
divloop:

	CMP   r2, r1
	SUBLO r1, r1, r2
	ADDLO r3, r3, r4
	MOV   r2, r2, LSR #1
	MOVS  r4, r4, LSR #1
	BCC   divloop

	MOV r5, r1

	SWI	0x0