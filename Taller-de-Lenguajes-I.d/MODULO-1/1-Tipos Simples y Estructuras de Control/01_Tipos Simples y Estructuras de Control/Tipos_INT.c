/* Tipos de datos ENTEROS */
#include <stdio.h>
int main()
{   short int A;
    unsigned short int B;
    int C;
    unsigned int D;
    long int E;
    unsigned long int F;

    /* short int */
    printf( "Ingrese un valor entero entre -32768 y 32767:");
    scanf("%hd", &A);
    printf( "El valor entero es %hd\n", A);
    /* unsigned short int */
    printf( "Ingrese un valor entero entre 0 y 65535:");
    scanf("%hu", &B);
    printf( "El valor entero es %hu\n", B);
    /* int */
    printf("Ingrese un valor entero entre -2147483648 y 2147483647:");
    scanf("%d", &C);
    printf("El valor entero es %d\n", C);
    /* unsigned int */
    printf( "Ingrese un valor entero entre 0 y 4294967295:");
    scanf("%u", &D);
    printf( "El valor entero es %u\n", D);
    /* long int */
    printf( "Ingrese un valor entero entre -2147483648 y 2147483647:");
    scanf("%ld", &E);
    printf( "El valor entero es %ld\n", E);
    /* unsigned long int */
    printf( "Ingrese un valor entero entre 0 y 4294967295:");
    scanf("%lu", &F);
    printf( "El valor entero es %lu\n", F);
    return 0;
}

