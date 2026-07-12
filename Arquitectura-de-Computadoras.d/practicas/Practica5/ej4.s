; IMC =  PESO KG / (EST M)^2
.data
peso: .double  75.7
est: .double 1.73
imc: .double 0 ; SE ALMACENA EL RESULTADO
estado: .word 0
tabla: .double 18.5,25.0,30.0
.code
l.d f1,peso($zero)
l.d f2, est($zero)
mul.d f2,f2,f2
div.d f1,f1,f2
; tengo en f1 el resultado
s.d f1, imc($zero)
; lo guardo
; preparo 3 valores
daddi $t0,$t0,tabla
l.d f2, 0($t0); primero 18.5
l.d f3, 8($t0); segundo 25
l.d f4, 16($t0); 3ero 30
switch:
c.lt.d f1, f2
bc1t case1
c.lt.d f1,f3
bc1t case2
c.lt.d f1,f4
bc1t case3
case4: daddi $t1,$t1,4
j final
case3: daddi $t1,$t1,3
j final
case2: daddi $t1,$t1,2
j final
case1: daddi $t1,$t1,1
final: sd $t1, estado($zero)
halt
