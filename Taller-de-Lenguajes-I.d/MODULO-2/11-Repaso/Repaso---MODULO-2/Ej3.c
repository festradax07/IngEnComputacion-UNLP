#include <stdio.h>
#define esPar(n) ((n) % 2 ? 0 : 1)
#define nPares(n1, n2) (esPar(n1)+esPar(n2))

#define nPares1(n1,n2) (2-(n1)%2-(n2)%2)

#define nPares2(n1,n2) (!((n1)%2)+!((n2)%2))
int main()
{
    int nro1, nro2;
    printf("Ingrese un valor : ");
    scanf("%d", &nro1);

    printf("Ingrese un valor : ");
    scanf("%d", &nro2);

    printf("Hay %d pares", nPares(nro1, nro2));

}
