#include <stdio.h>
#include <stdlib.h>
#define DIMF 12
char* copiarStr(char*,char*);
int main()
{
    char wrd1[DIMF]= "popo", wrd2[DIMF]="perimetro";
    char *p = copiarStr(wrd1,wrd2); //consultar sobre devolver strings.
    printf("%s", wrd1);
    return 0;
}
char* copiarStr(char * p1, char * p2){
char aux=p1;
while(*p2!='\0'){
    *p1=*p2;
    p2++;
    p1++;
}
*p1=*p2; // asigno el \0
return aux;
}
