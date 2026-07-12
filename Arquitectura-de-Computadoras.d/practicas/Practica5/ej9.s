; factorial recursivo con los parametros
.data
valor: .word 4
result: .word 0
.code
daddi $sp, $0,0x400
ld $a0,valor($0); recibe como parametro el valor 10
jal factorial
sd $v0,result($0)
halt

factorial:
daddi $sp,$sp,-8
sd $ra, 0($sp) ; apilo retorno en pila
daddi $t0,$t0,0; aux
if: daddi $t0,$a0,-1 ; 1 -1
bnez $t0, else
daddi $v0,$v0,0
daddi $v0,$v0,1
j fin_factorial
else: daddi $a0,$a0,-1; decrementa numero
jal factorial
daddi $a0,$a0,1;
dmul $v0,$a0,$v0
fin_factorial: ld $ra, 0($sp)
daddi $sp,$sp,8
jr $ra
; no es posible no utilizar la pila ya que todos las dir de retorno del modulo son al mismo lugar, pero es necesario guardar la dir de retorno al programa principal.
; se podria con otro registro, pero no es buena practica