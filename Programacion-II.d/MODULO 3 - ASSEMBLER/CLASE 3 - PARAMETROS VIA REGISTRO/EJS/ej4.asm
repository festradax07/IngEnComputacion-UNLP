org 1000h
num1 db 5; numerador
num2 db 2; denominador

ORG 3000H
RESTO: cmp ah,0
jz finResto;
cmp al, ah
js finResto;
doing: sub al,ah
cmp al, ah
jns doing
finResto: RET 

org 2000h
MOV Al, num1
MOV ah, num2
CALL RESTO
hlt
end