#include <stdio.h>
double Promedio(const double *, double);
int main()
{  double datos[] = {12,10,34};

   printf("El promedio es %5.2f\n ",
           Promedio(datos,3));
   return 0;
}

double Promedio(const double * V, double cant)
{ int  i;
  double suma = 0;
  for (i=0; i<cant; i++, V++)
     suma += *V;
  /* vea que V[i] = 23.4; no compila */
  return(suma / cant );
}
