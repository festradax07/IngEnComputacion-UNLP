/* Lanza una moneda 7000 veces */
#include <stdio.h>
int main()
{  int i, cara=0;

   for (i=0; i<7000; i++)
      if (rand() % 2)  /* no es par */
      /* los números impares se cuentan
         como cara */
         cara++;

    printf("Salieron %d caras y ", cara);
    printf("%d cecas\n", 7000-cara);
    return 0;
}
