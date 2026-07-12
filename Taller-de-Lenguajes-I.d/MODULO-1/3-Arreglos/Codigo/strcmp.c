#include <stdio.h>
#include <string.h>
int main()
{
   char texto1[] = "Función strcmp",
        texto2[] = "Preguntas?",
        texto3[] = "función strcmp",
        texto4[] = "Esta terminado!";

   printf("%d %d %d\n",strcmp(texto1, texto2),
          strcmp(texto1, texto3),
          strcmp(texto1, texto4));

   return 0;
}

