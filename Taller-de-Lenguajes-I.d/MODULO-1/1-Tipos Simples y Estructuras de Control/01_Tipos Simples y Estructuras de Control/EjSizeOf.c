#include <stdio.h>
int main()
{
    char car;
    int entero;
    float flotante;
    double doble;

    printf("Un caracter ocupa %d byte\n", sizeof(car));
    printf("Un entero   ocupa %d bytes\n", sizeof(entero));
    printf("Un flotante ocupa %d bytes\n", sizeof(flotante));
    printf("Un doble    ocupa %d bytes\n", sizeof(doble));

    return 0;
}

