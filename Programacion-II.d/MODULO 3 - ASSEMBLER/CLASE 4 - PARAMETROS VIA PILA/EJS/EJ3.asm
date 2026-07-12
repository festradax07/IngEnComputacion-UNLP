analisis
manda por ref via pila el offset resul
reg por valor dividendo
reg bx por ref divisor
cx asigna el valor por dir indirecto.

subrutina:
guarda el dato de bx
agarra sp en bx, le suma 4 para llegar al offset result
coloca el offset en dx

resta al divisor el dividendo,
mientra no haya carry sigue
le da dx a bx el offset de result
y le pasa a esa celda de memoria el resto.
pop bx para devolverle su dato inicial
vuelve
le da a cx el offset result.
fin.