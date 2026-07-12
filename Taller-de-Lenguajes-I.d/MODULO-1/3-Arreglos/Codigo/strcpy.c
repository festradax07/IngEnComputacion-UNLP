#include <stdio.h>
#include <string.h>
int main()
{
   char copia[50];
   char linea[] = "Esto es un string";

   strcpy(copia, linea);
   printf("%s",copia);

   return 0;
}

