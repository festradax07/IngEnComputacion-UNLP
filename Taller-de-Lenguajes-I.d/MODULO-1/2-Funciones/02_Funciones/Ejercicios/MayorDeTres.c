#include <stdio.h>
double Mayor(double nro1, double nro2, double nro3);

int main()
{   int  a,b,c;

    printf("Ingrese tres numeros enteros : ");
    scanf("%d %d %d", &a, &b, &c);

    printf("El mayor es %d\n", (int) Mayor(a,b,c));
    return 0;
}
double Mayor(double nro1, double nro2, double nro3)
{   int mayor;

    mayor = (nro1>nro2) ? nro1 : nro2;
    mayor = (nro3>mayor) ? nro3 : mayor;

    return (mayor);
}
