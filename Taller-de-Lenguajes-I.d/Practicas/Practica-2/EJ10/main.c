#include <stdio.h>
#include <stdlib.h>

int main()
{
int x[5]={1,2,3,4,5};
 int * p = x;
 printf("La direccion memoria de p es %p \n", &p); // DIRECCION DE MEMORIA DEL PUNTERO
 printf("La direccion la que apunta p es %p \n", p); // PUNTERO APUNTA A X DIRECCION DE MEMORIA
 printf("El valor al que apunta p es %d \n", *p); // APUNTA A LA PRIMERA DIRECCION DE MEMORIA DEL VECTOR. POR LO TANTO AL PRIMER DATO.
 p++; // LO AUMENTO EN 1, POR LO TANTO ES MODIFICADO EL CONTENIDO DEL PUNTERO (LOS PUNTEROS CONTIENEN DIRECCIONES DE MEMORIA)
 printf("La direccion memoria de p ahora es %p \n", &p); // LA MISMA, YA QUE ES DONDE ESTÁ UBICADO
 printf("La direccion la que apunta p ahora es %p \n", p); // APUNTA A LA DIRECCION X+1
 printf("El valor al que apunta p ahora es %d \n", *p); // ESA DIRECCION ES LA SEGUNDA CELDA DE MEMORIA DEL VECTOR, YA QUE SON DIRECCIONES CONTIGUAS DE MEMORIA.

return 0;
}
