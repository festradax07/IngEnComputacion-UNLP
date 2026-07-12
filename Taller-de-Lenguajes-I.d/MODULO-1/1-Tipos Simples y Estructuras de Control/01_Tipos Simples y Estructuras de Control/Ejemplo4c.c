/* Selección */
#include <stdio.h>
int main()
{   float nro1, nro2;

    printf("Ingrese nro1 : ");
    scanf("%f",&nro1);

    printf("Ingrese nro2 : ");
    scanf("%f",&nro2);

    printf("\nEl valor menor es %f",
           (nro1<nro2) ? nro1 : nro2);

    return 0;
}