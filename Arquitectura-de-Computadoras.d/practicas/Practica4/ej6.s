.data
A: .byte 4
B: .byte 3
C: .byte 2
result: .byte 0
.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
daddi r5,r0,1
dsub r4,r1,r2; 2
bnez r4,siguiente
daddi r5,r5,1
siguiente: dsub r4,r2,r3
beqz r4,siguiente2
dsub r4,r1,r3
beqz r4,siguiente2
daddi r5,r5,-1
j fin
siguiente2: daddi r5,r5,1 
fin: sd r5,result(r0)
halt