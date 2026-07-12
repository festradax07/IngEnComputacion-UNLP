/* Convierte a binario */
#include <stdio.h>
unsigned int IntToBinario(int);
int main()
{  int i;

   for (i=9 ; i<=127; i+=9)
      printf("%3d    %7d\n", i, IntToBinario(i));

   return 0;
}

unsigned int IntToBinario(int n)
{ int suma = 0, base10=1, resto;

     while (n>0)
     {
         resto = n % 2;
         suma = suma + base10 * resto;
         base10 *= 10;
         n = n / 2;
     }
     return suma;
}
