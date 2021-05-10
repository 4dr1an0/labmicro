	.text
	.globl	main
main:
	LDR	r4, =0x00003
	BL	mul132
	BL	mul255
	BL	mul18
	BL	mul16384
	SWI	0x0
mul132:
	MOV r0, r4, LSL #7
	ADD r0, r0, r4, LSL #2
	MOV	pc, lr
mul255:
	RSB r1, r4, r4, LSL #8
	MOV	pc, lr
mul18:
	MOV r2, r4, LSL #4
	ADD r2, r2, r4, LSL #1
	MOV	pc, lr
mul16384:
	MOV r3, r4, LSL #14
	MOV	pc, lr
	
