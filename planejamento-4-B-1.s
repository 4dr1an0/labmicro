	.text
	.globl	main
main:

    MOV r0, #0x24
    MOV r1, #0x06 
    MOV r2, #0xFC 
    MOV r3, #0x03 
    MOV r4, #0xFF 

    STRB r1, [r0]
    STRB r2, [r0, #1]
    STRB r3, [r0, #2]
    STRB r4, [r0, #3]

    LDRSB sp, [r0]
    LDRSH sp, [r0]
    LDR sp,[r0]
    LDRB sp,[r0]

    SWI	0x0
