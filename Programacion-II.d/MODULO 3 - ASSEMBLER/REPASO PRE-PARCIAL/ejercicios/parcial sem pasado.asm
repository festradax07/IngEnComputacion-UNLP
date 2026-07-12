
ORG 1000H
V1 DB "LEANDROMATIAS"; REF VIA REG
V2 DB 0; RF VIA REG
VOCALES DB "AEIOUaeiou"
cantvocales db 0

ORG 3000H 
; invoqué ambas rutinas dentro de la misma ya que en el parcial nos dijeron de hacer un solo call, sino habria que analizar 2 veces los datos.
SWAP: PUSH BX; guardo el bx original
PUSH AX; //// ax original
PUSH BX; PARA OPERAR con bx sin tener que pasarle su dato a cx o dx ya que los voy a usar despues. 
MOV BX, AX ; le paso el dato a bx (puntero)
MOV CL, [BX]; EN CL TENGO V1  
POP BX; me devuelvo el dato original
MOV CH, [BX]; EN CH ahora TENGO V2
MOV [BX], CL; ASIGNO A BX V1 (primer swap)
PUSH BX; para operar con los datos de ax (es como tirar una pelota para adelante, correr 10 metros y atraparla despues) #ejemplo 
MOV BX, AX; me cargo el dato de ax en bx otra vez
MOV [BX], CH; ASIGNO A AX (INDIRECTAMENTE) V2
POP BX; devuelve
push cx; mando por pila ambas letras 
jmp ES_VOCAL; POR FACHA, PARA hacer de cuenta que es un call
ES_VOCAL: PUSH BX; guardo dato
mov bx, sp; stack pointer en bx
PUSH DX; NO PUSHEO CX YA QUE ES DONDE VOY A RETORNAR MIS DATOS
add bx, 2 
mov cx, [BX]; asigno sus variables
MOV BX, OFFSET VOCALES; dir de las vocales 
CMP CL,CH; comparo ambas letras
JNZ LOOOP; si no me da 0, sigo al loop
MOV CH,0; si son la misma, anulo el dato 2
LOOOP: CMP CL, [BX]; compara la letra1 con la vocal
JZ SI_ES_VOCAL; si es 0 salta a esvocal
PT2: CMP CH,[BX]; compara el segundo
JZ SI_ES_VOCAL2; si es 0 saltaa esvocal2
SIG:INC BX; pasa a la sig vocal 
DEC DL; decrementa la diml de vocales
JNZ LOOOP; mientras no sean 0
NO_ES_VOCAL: CMP CL,0FFH ; compara con el valor de si es vocal
JZ NO_ES_VOCAL2; si es vocal cl pasa a noesvocal2
MOV CL, 00H; sino, le asigna el valor 00h (noesvocal)
NO_ES_VOCAL2: CMP CH,0FFH ; compara con valor si es vocal
JZ FIN_ES_VOCAL; fin de ejecucion
MOV CH, 00H; sino, le asigno el valor 00h
JMP FIN_ES_VOCAL ; salto a fin
SI_ES_VOCAL: MOV CL, 0FFH
JMP PT2
SI_ES_VOCAL2: MOV CH,0FFH
JMP SIG
FIN_ES_VOCAL: POP DX; 
POP BX
FIN: pop bx; popeo los datos de cx en bx porque necesito devolver el valor afuera de la subrutina
POP AX
POP BX
RET



ORG 2000H
MOV AX, OFFSET V1; dir de cadena
MOV BX, OFFSET V2-1; final de cadena
MOV DX,0; reg en 0
BUCLE: MOV CX,0 ; reg que tendrá los datos y resultado de las letras.
mov dl, offset cantvocales - offset VOCALES; dimf de vocales
CALL SWAP; llamo a la subrutina
cmp cl, 0FFH ; comparo si letra1 con 0ffh 
JNZ SIG2; si no es vocal evalua letra2
INC DH; si es inc dh (cont vocales)
SIG2: CMP CH, 0FFH; comparo letra2
JNZ SIGO ; si no es sigue
INC DH; cantvoc++
SIGO:INC AX; aumento "puntero" de cadena
DEC BX; decremento "puntero" del final de la cadena
CMP BX, AX; resto el mas grande con el mas chico
JNS BUCLE; mientras no dé negativo sigue el bucle.
MOV cantvocales, DH; terminó todo, muevo a memoria, la cantidad de vocales de la cadena
HLT