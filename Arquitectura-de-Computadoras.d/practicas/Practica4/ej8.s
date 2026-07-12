
.data
num1: .word 10
num2: .word 5
res: .word 0
.code
ld r1, num1(r0)
ld r2, num2(r0)
daddi r3,r0,0
mult: dadd r3,r3,r1
daddi r2,r2,-1
bnez r2, mult
sd r1, res(r0)
halt