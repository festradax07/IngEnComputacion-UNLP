; 2 subrutinas ingreso de un num entero de un dig (verficar)
;  muestra
.data
cero: .asciiz "cero"
uno: .asciiz "uno"
dos: .asciiz "dos"
tres: .asciiz "tres"
cuatro: .asciiz "cuatro"
cinco: .asciiz "cinco"
seis: .asciiz "seis"
siete: .asciiz "siete"
ocho: .asciiz "ocho"
nueve: .asciiz "nueve"
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0,DATA($0)
lwu $s1, CONTROL($0)
jal ingreso
slti $t5,$v0,10
beqz $t5, fin
dadd $a0,$0,$v0
jal muestra
fin: halt
; necesita recibir $s0 con control
; y devuelve $v0 el valor de data en $s1
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
; $a0 tiene el elemento para la  
muestra: daddi $t0,$0, 4
dadd $t1,$0, $a0
daddi $t6, $0, 8
dmul $t1,$t1,$t6 ; 2*8 ej 1*8 es el desplazamiento 
daddi $t1,$t1, cero; por si cero no esta en la pos 0 de memoria
sd $t1, 0($s0) ; mando la direccion para data
sd $t0, 0($s1); mando orden a control
jr $ra