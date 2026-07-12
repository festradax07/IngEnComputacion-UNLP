push ax | 7ffe
call rutina | 7ffc -> en pila ?? ??h 2004h | direccion de retorno en el tope
mov bx, 3 7ffc 
ret | 7ffe-> desapila la dir de retorno
pop bx 8000h
hlt  8000h  
