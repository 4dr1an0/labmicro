    .text
	.globl main

main: 
    LDR r5, =12 @ carrega o r5 com o tamanho de data
    LDR r6, =data @ carrega o r6 com data
    LDR r4, [r6] @ carrega o primeiro valor como maior valor
    SUBS r5, r5, #1 @ decrementa o contador


loop: 
    LDR r3, [r6, #4]! @ avança para o próximo
    CMP r3, r4 @ compara o atual com o maior
    MOVHI r4, r3 @ carrega se r3 for maior que r4
    SUBS r5, r5, #1 @ decrementa o contador
    BNE loop @ roda de novo se ...
    SWI 0x0

data:
    .word 0x321, 0x135, 0x13, 0x15, 0xA5, 0x5F5, 0x135, 0x235, 0x25, 0x35, 0x15, 0x421

