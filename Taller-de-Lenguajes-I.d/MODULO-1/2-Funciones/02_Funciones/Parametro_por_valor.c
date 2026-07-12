#include <stdio.h>

void duplicar( int nro );
int main()
{
    int nro = 3;
    printf("nro = %d\n", nro);
    duplicar(nro);
    printf("nro retornado =  %d\n", nro);
    return 0;
}

void duplicar( int nro ){
   nro = 2 * nro;
   printf("nro dentro de la funcion = %d\n", nro);
}

