#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void palabrasrepetidas(char[]);
int main()
{   char cadena[12]="laboratorio";
    palabrasrepetidas(cadena);
    return 0;
}
void palabrasrepetidas(char cadena[]){
    char *c=cadena; int i, cant, palabra;
    for(i=0;i<strlen(cadena);i++){
        *c=cadena[i];
        cadena=0;
        while( c != NULL){
            cant++;
            *c=strchr(cadena[i+1],*c);
        }
        printf("el valor %c aparece %d veces" ,cadena[i],cant);
    }
}
