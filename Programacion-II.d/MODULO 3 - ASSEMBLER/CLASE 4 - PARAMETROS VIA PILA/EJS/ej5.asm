ORG 1000H
tabla DB 1,4,5,3,10,7,14,78,23,18
valor DB 3

ORG 3000H
sumarle: push bx
mov bx, sp
add bx, 4
mov al,[bx]
mov ah,0
add bx,2
mov cl, [bx]
mov ch,0
add bx,2
mov bx,[bx]; tengo en bx la direccion de la tabla
bucle: add [bx], ax
inc bx
dec cl
jnz bucle
fin: pop bx
ret

SIGO: ADD AX, AX
ADC AX, 0
DEC CH
JNZ SIGO
FIN: RET


ORG 2000H
mov ax, valor
mov dx, offset tabla
mov cx, offset valor-offset tabla
push dx
push cx
push ax
CALL sumarle
pop ax
pop cx
pop dx
HLT
END