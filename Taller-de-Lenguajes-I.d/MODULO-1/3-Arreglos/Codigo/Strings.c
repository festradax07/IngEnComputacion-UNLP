/*Strings como vectores de caracteres */
#include <stdio.h>
int main()
{   char string1[20],
         string2[] = "Primer ejemplo";
    int i;
    printf("Ingrese un string : ");
    scanf("%s", string1);

    printf("string1 es %s \n"
           "string2 es %s \n"
           "String1 con blancos es ",
           string1, string2);
    for (i=0; string1[i]!='\0'; i++)
       printf("%c ",string1[i]);

    return 0;
}
