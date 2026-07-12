tipos de pasajes de parametros
mov ax, 5 
call subrutina |  registro por valor

mov dx, offset a 
call subrtuina | registro por referencia

mov bx, 5
push bx 
call sbrut
pop bx		| pila por valor

mov cx, offset A
push cx
call subrutina
pop cx			| pila por ref

mov dl, 5
call subrutina | reg por valor

call subrutina
mov A, dx	| reg por valor
