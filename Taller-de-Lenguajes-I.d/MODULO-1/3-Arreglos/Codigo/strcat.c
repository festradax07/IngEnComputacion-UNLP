#include <stdio.h>
#include <string.h>
int main()
{
   char linea1[50] = "Esto es un string";
   char linea2[]=". Preguntas?";

   strcat(linea1, linea2);
   printf("%s",linea1);

   return 0;
}

