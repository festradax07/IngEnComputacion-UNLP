/* Función cuadrado definida
    por el programador */
#include <stdio.h>

double cuadrado(double);

int main()
{  int x;

   for (x=1; x<=10; x++)
       printf("%3.0f  \n",cuadrado(x));

   return 0;
}

/* Definicion de la función */
double cuadrado(double a)
{
    return a*a;
}

