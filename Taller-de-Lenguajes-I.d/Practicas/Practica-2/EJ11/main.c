#include <stdio.h>
#include <stdlib.h>

int main()
{
 int vector[10]={10,20,30,40,50,60,70,80,90,100};
 int i;
 int *p= vector;// AOUNTA A DIR X
 for (i=0; i<10; i++){
    *p += 3; // SUMA 3 A CADA CASILLA
    printf("vector[%d] = %d \n", i, *p);
    p++; // PASA A LA SIGUIENTE DIRECCION
 }
 /*

 &P= DIRE DE MEMORIA DEL PUNTERO.
 P= DIRECCION DE MEMORIA A LA QUE APUNTA
 *P=CONTENIDO AL QUE ESTA APUNTANDO.*/
    return 0;
}
