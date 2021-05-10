	.text
	.globl	main
main:
	LDR	r0, =0x00003
	LDR	r1, =0x00003
	MOV    r1, r1, LSL #1
	MOVS   r0, r0, LSL #1
	ADC  r1, r1, #0
	SWI	0x0
