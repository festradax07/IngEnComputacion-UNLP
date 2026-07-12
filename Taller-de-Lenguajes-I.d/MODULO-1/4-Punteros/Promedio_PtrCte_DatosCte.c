#include <stdio.h>
double Promedio(const double * const, double);
int main()
{  double datos[] = {12,10,34};

   printf("El promedio es %5.2f\n ",
           Promedio(datos,3));
   return 0;
}

double Promedio(const double * const V, double cant)
{ int  i;
  double suma = 0;
  for (i=0; i<cant; i++, V++)
     suma += *V;
  return(suma / cant );
}
