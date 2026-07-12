ORG 1000H
num DB 6
result db ?
ORG 3000H
ES_IMPAR: push bx
mov bx,sp
add bx,4
mov ax,[bx]
RESTO: cmp al,0
jz sies;
cmp al,2
js noes
doing: sub al,2
cmp al, 2
jns doing
cmp al,0
jnz noes
sies: mov ah,00h
jmp finResto
noes:mov ah,01h
finResto: pop bx
RET 

ORG 2000H
mov al,num
mov ah,0
push ax
call ES_IMPAR
mov result,ah
pop ax
hlt
END