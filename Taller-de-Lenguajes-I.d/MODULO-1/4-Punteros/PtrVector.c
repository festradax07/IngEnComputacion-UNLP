#include <stdio.h>
float suma1(float [], int );
float suma2(float *, int );
#define SIZE 5
int main()
{   float precios[SIZE] = {50.1, 10.2, 32, 10.5, 20.4};
    printf("Suma1 = %.1f\n",suma1(precios,SIZE));
    printf("Suma2 = %.1f",suma2(precios,SIZE));
    return 0;
}
float suma1(float V[], int cant)
{
   int i;
   float suma=0;
   for (i=0; i<cant; i++)
     suma += V[i];
   return(suma);
}
float suma2(float *P, int cant)
{  int i;
   float suma=0;
   for (i=0; i<cant; i++)
     suma += *P++;
   return(suma);
}
