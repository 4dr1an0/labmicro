	.text
	.globl	main
main:
	LDR	r0, =0x00003
	LDR	r1, =0x00003
	LDR	r2, =0x00003
	LDR	r3, =0x00003
	CMP  r0, r2
	CMPEQ  r1, r3

	SWI	0x0
	
