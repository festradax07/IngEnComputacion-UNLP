ORG 1000H
tablaa db 1,2,5,4,30
tablab db 1,7,5,9,7
result db ?
ORG 3000H
subrutina: push bx
push ax
push cx
mov cl,1
mov ch,0
hacer: add cl, cl
inc al
cmp al, [bx]
jnz hacer
fin: mov [bx],cl
pop cx
pop ax
pop bx
ret

ORG 2000H
mov cx, offset tablaa
mov bx, offset tablab
mov ah, offset tablab-offset tablaa
mov dx, 0 ; contador de valores de tablaB menores a 10
bucle: cmp ah,0
jz final
push bx
mov bx, cx
mov al,[bx]
pop bx
cmp al, [bx]; tabla a vs tablab
jns salto
call subrutina
salto:push bx
mov bl,[bx]
mov bh,0
cmp bx, 9
jns sigo
add dx, bx
sigo: pop bx
inc bx
inc cx
dec ah
jmp bucle
final: mov result, dx
HLT
END