.data
x: .word 2
y: .word 3
a: .word 3
res: .word 0
.code
ld r1, x(r0)
ld r2, y(r0)
ld r3, a(r0)
while: beqz r3,fin
do: dadd r1,r1,r2
daddi r3,r3,-1
j while
fin: sd r1, res(r0)
halt