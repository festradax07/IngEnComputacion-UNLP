/* Tipo de dato real */
#include <stdio.h>
int main()
{   float F;
    double D;
    long double LD;

    /* float */
    printf("Ingrese un número real (float) : ");
    scanf("%f", &F);
    printf("El valor ingresado es %f  o  %.2f\n", F, F);

    /* double */
    printf("Ingrese un número real (double) : ");
    scanf("%f", &D);
    printf("El valor ingresado es %lf  o  %.2lf\n", D, D);

    /* long double */
    printf("Ingrese un número real (long double) : ");
    scanf("%Lf", &LD);
    printf("El valor ingresado es %Lf  o  %.2Lf\n", LD, LD);

    return 0;
}

