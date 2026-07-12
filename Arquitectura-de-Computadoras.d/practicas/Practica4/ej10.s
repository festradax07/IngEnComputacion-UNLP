.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena
.code
daddi r2, r0,16; por los 16 bytes ocupados
daddi r3,r0,0; r3 para totalizar
dadd r4,r3,r0; r4 para comparar
dadd r5,r4,r0; r5 para desplazarse
lbu r6, car(r0)
loop: lbu r1, cadena(r5)
dsub r4,r1,r6; resto r1 con r6 y el resultado queda en r4
bnez  r4, sigo
daddi r3,r3,1; inc cant r3
sigo: daddi r5,r5,1; me corro un byte
daddi r2,r2,-1; dec bucle
bnez r2, loop
final: sd r3,cant(r0)
halt