;probar mtc1 cvt.l.d, cvt.d.l y mfc1

;mtc1 r4,f3 sirve para copiar los bits del punto fijo al punto flotante ( no los convierte)
; cvt.d.l f2,f3 sirve para convertir el dato de f3 a p flotante para f2

;flotante a fijo
; cvt.l.d f2,f2 convierte los bits de flotante a fijo 
; mfc1 r4,f2 sirve para copiar los bits de r flot a r fijo
.data
A: .double 4.5
B: .double 3.2
C: .word 5 
.code
l.d f1, A ($zero); cargo en flot 
l.d f2, B($zero); cargo en flot 2
ld $a0, C($zero); cargo en r4 un word
mtc1 $a0, f3 ; se guarda 5 en f3 ( sin convertirlo)
cvt.d.l f3,f3 ; se convierte su contenido y se guarda en si mismo
add.d f2,f2,f1
add.d f3,f3,f2
nop
cvt.l.d f3,f3
mfc1 $a0,f3
sd $a0, C($zero)
halt
