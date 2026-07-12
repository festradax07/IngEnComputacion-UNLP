.data
; recorrer una tabla de 10 num y det cuantos son mayores que X
; generar un total y un arreglo de 1 y 0 dependiendo de cuantos sean
tabla: .word 1,2,3,4,5,6,7,8,9,10
res: .word 0,0,0,0,0,0,0,0,0,0
cant: .word 0
X: .word 4
.code
; utilizo una dimf que decrementará y otra de desplazamiento
daddi r4,r0,10
daddi r5, r0,0
daddi r6, r0,0; r6 cant
ld r3, X(r0); r3 parametro x
; r5 para desplazamiento de tabla r4 para iterar arreglo
cargar: ld r1, tabla(r5); r1 arreglo tabla
ld r2, res(r5); r2 arreglo res
for: slt r7, r3,r1 ; si r3 es menor a r1 deja un 1 en r7
beqz  r7, sigo; si me da 0 (si es igual o mas grande) sigo
dadd r6,r6,r7; inc cant
sd r7, res(r5); mov res[i],r5
sigo: daddi r5,r5,8
daddi r4,r4,-1
bnez r4, cargar
fin: sd r6, cant(r0) ; mov cant, r6
halt