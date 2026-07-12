#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{   int palabraso=0;
    char palabra[32];
    while(strcmp(palabra,"xxx")){
        scanf("%s", palabra);
        if( palabra[strlen(palabra)-1] == 'o') palabraso++;
    }
    printf("cantidad de palabras terminadas en o : %d", palabraso);
    return 0;
}
