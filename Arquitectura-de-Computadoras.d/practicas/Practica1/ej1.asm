instruccion | registro SP | AX | BX
mov ax, 5 	8000h 	     5	  ?
mov bx, 3	8000h 	     5    3
push ax         7ffe        5    3 -> en pila -> 00 05h
push ax	7ffc         5   3 -> en pila -> 00 05h 00 05h
push bx 	7ffa         5   3 -> en pila -> 00 05h 00 05h 00 03h | <-tope
pop bx 	7ffc         5   3 -> en pila -> 00 05h 00 05h | <- tope
pop bx 	7ffe         5   5 -> en pila -> 00 05h | <- tope
pop ax 	8000h        5   5 -> en pila ->  | <- tope vacio
