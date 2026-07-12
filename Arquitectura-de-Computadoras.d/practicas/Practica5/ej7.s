.data
m: .word 64
tabla: .word 400,33,180
fintabla: .word 0
total: .word 0

.code
; inicio de la pila 
daddi $sp,$zero,0x400

ld $a0, m($zero); por valor
daddi $a1,$a1, tabla; tabla
daddi $a2,$a2, fintabla
dsub $a2,$a2,$a1; 8*3/8
daddi $t0,$t0,8; temporal para dividir por 8
ddiv $a2,$a2,$t0; 3
jal subrutina
fin: sd $v0, total($zero)
halt

subrutina:
daddi $sp,$sp, -24
sd $a0,0($sp)
sd $a1, 8($sp)
sd $a2, 16($sp)
daddi $v0,$v0,0
daddi $t1, $t1, 0 ; si mayor tabla con m 
do: ld $t1, 0($a1) ; t1 tiene el dato de tabla
slt $t2, $a0, $t1 ; tabla < m
beqz $t2, sigo ; $v0 para devolver un total
daddi $v0,$v0,1
sigo: daddi $a1,$a1,8 ; paso al siguiente
daddi $a2,$a2,-1
bnez $a2, do
fin_sub: ld $a0, 0($sp)
ld $a1, 8($sp)
ld $a2, 16($sp) ; preservar registros.
daddi $sp,$sp,24
jr $ra