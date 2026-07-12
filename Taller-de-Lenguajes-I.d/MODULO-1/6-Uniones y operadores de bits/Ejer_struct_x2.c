#include <stdio.h>
struct persona {
   char nom[15];
   int edad;
}
struct empresa {
   char nom[15];
   char direccion[30];
}

int main()
{  struct persona p;
   struct empresa e;

   printf("Ingrese el nombre : ");
   scanf("%s",e.nom);

   p.nom = e.nom;

   printf("Ingrese la edad : ");
   scanf("%d", &p.edad);

   printf("nombre : %s  - edad : %d", p.nom, p.edad);

   return 0;
}
