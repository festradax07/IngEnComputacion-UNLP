#include <stdio.h>
int main()
{
    int nro, suma=0;

    printf("Ingrese un numero entero (0=FIN): ");
    scanf("%d", &nro);

    while (nro != 0)
    {
        suma = suma + nro;

        printf("Ingrese un numero ent#include <stdio.h>
int main()
{
    int nro, suma=0;

    printf("Ingrese un numero entero (0=FIN): ");
    scanf("%d", &nro);

    while (nro != 0)
    {
        suma = suma + nro;

        printf("Ingrese un numero entero (0=FIN): ");
        scanf("%d", &nro);
    }

    printf("suma = %d", suma);

    return 0;
}

