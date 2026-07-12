/* Parámetro por referencia */
#include <stdio.h>
void cuadrado(int *);

int main()
{  int a=5;

   printf("Valor original = %d\n",a);
   cuadrado(&a);
   printf("Valor al cuadrado = %d",a);
   return 0;
}

void cuadrado(int * nro)
{
    *nro = *nro * *nro;
}
