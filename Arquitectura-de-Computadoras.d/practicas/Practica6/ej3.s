.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.code
lwu $s0,DATA($0)
lwu $s1, CONTROL($0)
jal ingreso
slti $t5,$v0,10
beqz $t5, fin
dadd $a0,$0,$v0
jal ingreso
slti $t5,$v0,10
beqz $t5, fin
dadd $a1, $0,$v0
muestra: jal resultado
fin:
halt

resultado: daddi $t2,$0,1
dadd $t3, $a0,$a1
sd $t3, 0($s0); coloco la suma en data
sd $t2, 0($s1); doy la orden de data
jr $ra

ingreso: daddi $t2,$0,8
sd $t2, 0($s1); lee y me lo devuelve por data
lbu $t2, 0($s0); cargo el dato de data
daddi $t3,$0,10
ddivu $t4,$t2,$t3
bnez $t4, noes
dadd $v0, $0, $t2
j final
noes: daddi $v0,$0,10
final: jr $ra