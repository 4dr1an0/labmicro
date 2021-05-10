	.text
	.globl	main
main:
	LDR	r7, =0x00003
	LDR	r12, =0x00103
	LDR	r3, =0x00023
	ADD r3,r7, #1023
	SUB r11, r12, r3, LSL #32
	SWI	0x0

	
