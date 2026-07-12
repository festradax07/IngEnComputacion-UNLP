#include <stdio.h>

void duplicar( int * );
int main()
{
    int nro = 3;
    printf("nro = %d\n", nro);
    duplicar(&nro);
    printf("nro retornado =  %d\n", nro);
    return 0;
}

void duplicar( int * DirNro ){
   *DirNro = 2 * (*DirNro);
   printf("nro dentro de la funcion = %d\n", (*DirNro));
}