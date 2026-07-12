#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int palindroma(char *);
int main()
{   char cadena[12]="arenera";
    printf("%d 1- no palindroma 0- palindroma!" , palindroma(cadena));
    return 0;
}
int palindroma (char * cadena){
 char *p=cadena, *p2=cadena + strlen(cadena)-1; int iguales=0;
 while((*p !='\0')&& (*p==*p2)){
    iguales++;
    p2--;
    p++;
 }
 if(iguales== strlen(cadena)){
    return 0;
 }else return 1;
}
