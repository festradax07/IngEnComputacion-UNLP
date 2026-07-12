#include <stdio.h>
int main()
{  auto int suma = 0;

   register int indice;

   for (indice=1; indice<10000; indice++)
   {
       static int MuyDinamica = 0;

       MuyDinamica++;
       suma += MuyDinamica;
       if (indice % 1000==0) {
            printf("i=%6d  ", indice);
            printf("suma = %8d  ", suma);
            printf("MuyDinamica = %d\n",MuyDinamica);
       }
   }
   return 0;
}
