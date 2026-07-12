ORG 1000H
tabla DB 6,3,5,2,0,1,18,21
result db 0
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
mov bx,offset tabla
mov cl, offset result-offset tabla
for: mov al, [bx]
mov ah,0
push ax
call ES_IMPAR
cmp ah, 1
jz sig
inc result
sig: pop ax
inc bx
dec cl
jnz for
hlt
END