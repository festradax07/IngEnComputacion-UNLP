#include <stdio.h>

int main()
{
    printf("El factorial de 8 es");
    printf(" %u\n", Factorial(8));

    return 0;
}

unsigned int Factorial(unsigned int nro)
{  int auxiliar;
   if ((nro==0) || (nro==1))
        return 1;
   else return(nro * Factorial(nro -1));
}

