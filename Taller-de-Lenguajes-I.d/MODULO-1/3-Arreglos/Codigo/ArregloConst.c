#include <stdio.h>
void modificar(float [], int );
void mostrar(const float [], int );
#define SIZE 5
int main()
{   float precios[SIZE] = {350, 110, 300, 210, 200};
    mostrar(precios, SIZE);
    modificar(precios, SIZE);
    mostrar(precios, SIZE);
    return 0;
}
void modificar(float V[], int cant)
{  int i;
   for (i=0; i<cant; i++)
     V[i] = (V[i]>200? 0.8*V[i] : V[i]);
}
void mostrar(const float V[], int cant)
{  int i;
   for (i=0; i<cant; i++)
     printf("  v[%d] = %5.1f",i,V[i]);
   printf("\n")  ;
}
