.data
A: .word 1
B: .word 2
.code
ld r1, A(r0); cargo a r1 a
ld r2, B(r0); r2 b
sd r2, A(r0); almaceno en a r2
sd r1, B(r0); almaceno en b r1 SWAP
halt
; responder despues