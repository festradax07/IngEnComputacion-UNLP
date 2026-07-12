#include <stdio.h>
int main()
{
    char texto[]="Texto de 23 caracteres.";

    printf("%s\n", texto);

    printf("Si! Tiene %c%c caracteres!",
           texto[9], texto[10]);

    return 0;
}
