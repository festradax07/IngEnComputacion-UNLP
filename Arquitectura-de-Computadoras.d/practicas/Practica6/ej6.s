; modificar para que las coord y color sean desde teclado 
.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word32 0x10000
DATA: .word32 0x10008
.text
lwu $s6, CONTROL(r0) ; $s6 = dirección de CONTROL
lwu $s7, DATA(r0) ; $s7 = dirección de DATA
daddi $t0, $0, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica

leer:
daddi $t1, $0, 8 ; orden 8 leer de teclado un numero
sd $t1, 0($s6)
ld $t2, 0($s7)
sd $t2, coorX($0); lo guardo en cordx
sd $t1, 0($s6); otra orden de lectura para cordy
ld $t2, 0($s7)
sd $t2, coorY($0); guardado en y
daddi $t3,$0,0; desp
daddi $t4, $0,4; cosnt
loop: sd $t1, 0($s6)
lbu $t2, 0($s7)
sb $t2, color($t3)
daddi $t3,$t3,1
daddi $t4, $t4, -1
bnez $t4, loop
muestra:
lbu $s0, coorX(r0) ; $s0 = valor de coordenada X
sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X
lbu $s1, coorY(r0) ; $s1 = valor de coordenada Y
sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y
lwu $s2, color(r0) ; $s2 = valor de color a pintar REVISAR COMO ENVIA LOS COLORES
sw $s2, 0($s7) ; DATA recibe el valor del color a pintar
daddi $t0, $0, 5 ; $t0 = 5 -> función 5: salida gráfica
sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
halt