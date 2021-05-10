    .text
	.globl main

main: 
    LDR r8, =0b101 @ carrega o r5 com o tamanho de data
    LDR r9, =3 @ carrega o r6 com data
    LDR r1, =0b00101101100010110110001011011000 @ sequencia
    LDR r2, =0
    LDR r3, =0
    RSB r4, r9, #32
    LDR r6, =1
    MOV r6, r6, LSL r4 @ bit de trabalho

loop: 
    MOV r5, r1
    MOV r5, r5, LSL r3
    MOV r5, r5, LSR r4
    ADD r3, r3, #1
    CMP r5, r8
    ADDEQ r2, r2, r6
    MOV r6, r6, LSR #1
    CMP r3, r4
    BLE loop
    SWI 0x0

