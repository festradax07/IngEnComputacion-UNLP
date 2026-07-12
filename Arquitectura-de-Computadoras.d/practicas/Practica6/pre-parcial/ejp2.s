.data
a: .double 1.3,3.5,5.8
b: .double 7.1,3.4,9.0
c: .double 2.3,8.2,0.5
res: .double 0 ; calculo / a^2 + b^2 )/c
.code
daddi $t1,$0,0; desp
daddi $t0, $0, 3; loop
loop: l.d f1,a($t1)
l.d f2, b($t1)
l.d f3, c($t1)
jal subrutina
s.d f3, res($t1)
daddi $t1,$t1,8; son regs de 64!
daddi $t0,$t0,-1
bnez $t0, loop
halt


subrutina: mul.d f1,f1,f1
mul.d f2,f2,f2
add.d f1,f2,f2
div.d f3,f1,f3
jr $ra