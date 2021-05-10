Questão teórica: r3 = 0x4000 e r4 = 0x20
STRB r9, [r3,r4] : end. 0x4020 [r3 + r4] (pré)
LDRB r8,[r3,r4,LSL #3] : end. 0x4100 [r3 + 0x100](pré)
LDR r7, [r3], r4 : end. 0x4000 [r3] (pós)
STRB r6, [r3], r4, ASR #2 : end. 0x4000 [r3] (pós)
