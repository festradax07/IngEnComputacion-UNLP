#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{   int cantp=0;
    char Palabra[32];
    while(strcmp(Palabra,"zzz")){
        scanf("%s", Palabra);
        if(strlen(Palabra)==5) cantp++;
        printf("%s", Palabra);
    }
    printf(" cantidad de palabras con 5 de longitud:  %d", cantp);
    return 0;

}
