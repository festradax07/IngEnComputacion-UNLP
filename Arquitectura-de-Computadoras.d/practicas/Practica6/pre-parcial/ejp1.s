; subrutina recibe 3 op y retorna res
; valor calculado se muestra en la pantalla
; abc desde teclado
.data
A: .word 0
B: .word 0 ;(5-2)^2
C: .word 0 
RES: .word 0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA ($0)
daddi $t0, $0, 8
sd $t0, 0($s0)
ld $a0, 0($s1); cargo data1
sd $t0, 0($s0)
ld $a1, 0 ( $s1)
sd $t0, 0 ($s0)
ld $a2, 0($s1)
jal subrutina
daddi $t0,$0,1
sd $v0, 0($s1);
sd $v0, RES($0)
sd $t0, 0($s0);
halt



subrutina: dsub $t1, $a0,$a1; res (a-b)^c
beqz $t1, fin_sub
dadd $t2, $0, $a2
bnez $t2, pre_loop  ; si es 0 me ahorro todo
daddi $t1,$0,1 ; resultado 1 
j fin_sub
pre_loop: daddi $t3,$0,1
beq $t2,$t3, fin_sub; caso del exp 1
daddi $t2,$t2,-1; dec un loop
loop: dmul $t1,$t1,$t1
daddi $t2, $t2, -1
bnez $t2, loop
fin_sub: dadd $v0, $0, $t1 ; le doy el valor t1
jr $ra