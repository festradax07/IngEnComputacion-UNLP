#include <stdio.h>
#include <stdlib.h>

int main()
{
    int mivar;
    scanf("%d", &mivar);
    printf("como estas? escanea 0 para bien y 1 para mal");
    scanf("%d", &mivar);
    if(mivar) printf("que bueno que estes bien :D"); // para probar como funcionan las funciones con ints (0 == false 0!= TRUE!!)
    else printf("lo lamento :(");
    return 0;
}
