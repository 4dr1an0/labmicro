	.text
	.globl	main
main:
	LDR	r0, =0x00003
	LDR	r1, =0x00003
	MOVS  r1, r1, LSR #1
	MOV   r0, r0, RRX
	SWI	0x0
	
