#include <stdio.h>
#include <stdlib.h>

int main()
{
    const float milla = 1.61;
    float distancia;
    printf("Escriba una distancia en km \n");
    scanf("%f", &distancia);
    printf("Su distancia es de:  %6.2f  Millas \n", distancia/milla);
    return 0;
}
