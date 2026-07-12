SP Y VALOR PILA
call rut | SP -> 7ffe | PILA : 20 00h
mov bx, 3 | igual
ret | SP-> 8000h | Pila: - desapilado 2000h y se le da a ip
add cx, 5 | nada 
call rut | SP-> 7ffe | PILA : 20 04h
/ /
ret |SP-> 8000h | Pila: - desapilado 2004h y se le da a ip
hlt todo igual

a- se apila la direccion de instruccion en la pila y se obtiene la direccion nueva para el ip, se actualiza sp con la dir del tope de pila.
b- se desapila y se obtiene ese dato en el ip, de actualiza sp con la dir nueva del tope de la pila (+2 hex)
