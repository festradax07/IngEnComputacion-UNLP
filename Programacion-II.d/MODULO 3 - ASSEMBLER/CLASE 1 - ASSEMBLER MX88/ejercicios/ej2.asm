org 1000H
datos DB 55H, 33H, 44H, 22H
org   2000H
mov BX, 3000H; LE ASIGNA A BX 3000H
mov AX, [BX]; le asigna a ax lo contenido en la dir de memoria dentro de bx
push AX; apila el dato 
mov BX, 3002H; le asigna a bx 3000h
mov CX, [BX]; le asigna el contenido en la dir de memoria dentro de bx;
push CX; apila el dato
pop AX; le devuelve el ultimo elemento apilado a ax (el de cx)
pop CX; le devuelve el primer elemento apilado a cx (el de ax )
hlt
end