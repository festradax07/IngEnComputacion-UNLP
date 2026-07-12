ORG 1000h; si quiero multiplicar, num2 debe ser la cant de veces que voy a sumar el valor de num1
num1 DB 1,2,3,4; numero
num2 DB 5,0,3,1; numero 2
result DB 0,0,0,0

ORG 2000h
mov bx, offset num2 -1
mov ah, offset num2- offset num1
while: inc bx
mov cx, 0
cmp bx, offset result 
jz fin
dothis: mov al, [bx]; cantidad de veces que debo sumar 
if: cmp al, 0 
jz then1
else: sub bl, ah
if2: cmp al,1
jz then2
mult: add cl, [bx]
dec al
jnz mult
almacenar:add bl,ah
add bl, ah
mov [bx], cl
sub bl,ah
jmp while
then1: add bl, ah
mov [bx], al
sub bl,ah
jmp while
then2: add cl, [bx]
jmp almacenar
fin: HLT 
END