org 1000h
NUM1_L DW 0A100H; variables 
NUM1_H DW 0000H
NUM2_L DW 9999H
NUM2_H DW 7889H
resul_l DW 0000h
resul_h DW 0000h

ORG 3000H
SUM32: mov bx, ax
mov dx, [bx];
mov bx, cx
add dx,[bx]
push dx
pushf
add ax,2
add cx,2
mov bx,ax
mov dx,[bx]
mov bx, cx
popf
adc dx,[bx]
mov bx,dx
pop dx
RET 

org 2000h
MOV AX, OFFSET NUM1_L
MOV CX, OFFSET NUM2_L
CALL SUM32
mov resul_l, dx
mov resul_h, bx
hlt
end