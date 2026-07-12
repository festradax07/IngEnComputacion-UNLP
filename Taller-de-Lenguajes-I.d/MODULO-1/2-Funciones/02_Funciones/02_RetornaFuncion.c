#include <stdio.h>
int main()
{   int  a,b;

    printf("Ingrese dos números enteros : ");
    scanf("%d %d", &a, &b);

    printf("El mayor es %d\n", Mayor(a,b));
    return 0;
}
int Mayor(int nro1, int nro2)
{
    return (nro1);
    if (nro2>nro1)
       return(nro2);
}
