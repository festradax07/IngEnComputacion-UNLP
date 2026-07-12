#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{   double i;
    for (i=1.00;i<=10.00;i++){
        printf("i= %.0lf \n",i);
        printf("raiz cuadrada:  %.3lf \n", sqrt(i));
        printf("su cuadrado: %.0lf  \n", pow(i,2.00));
        printf("su cubo: %.0lf \n \n", pow(i,3.00));
    }
    return 0;
}
