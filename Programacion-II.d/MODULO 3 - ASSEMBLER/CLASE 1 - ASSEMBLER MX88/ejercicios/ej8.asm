ORG 1000h; si quiero multiplicar, num2 debe ser la cant de veces que voy a sumar el valor de num1
num1 DB ?; numero
num2 DB ?; numero 2
result DB ?
ORG 2000h
mov al, num1
mov ah, num2; contador
while: cmp ah, 0 ; verifico que el num no sea 0
jz fin2
cmp ah, 1; verifico que el num no sea 1
jz fin
dothis: add al, al
dec ah
jmp while
fin2: mov al, 0
fin: mov result, al
HLT 
END