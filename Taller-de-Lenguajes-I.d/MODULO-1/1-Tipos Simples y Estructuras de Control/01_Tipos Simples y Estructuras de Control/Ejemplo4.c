/* Selección */
#include <stdio.h>
int main()
{   float nro1, nro2, menor;

    printf("Ingrese nro1 : ");
    scanf("%f",&nro1);

    printf("Ingrese nro2 : ");
    scanf("%f",&nro2);

    menor = nro2;
    if (nro1<nro2)  menor = nro1;

    printf("\nEl valor menor es %f", menor);

    return 0;
}