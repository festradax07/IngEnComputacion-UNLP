#include <stdio.h>
#include <stdlib.h>
#define N 2
struct TEmple{
  char *nom;
  int edad;
  };
void mostrar(struct TEmple *e, int cant);

int main()
{  int i=0;
   struct TEmple *E;

   E = malloc(N * sizeof(struct TEmple));

   for (i=0; i<N; i++){
      (E+i)->nom = malloc(20);
      printf("Nombre: ");
      scanf("%s", (E+i)->nom);

      printf("Edad : ");
      scanf("%d", &(E[i].edad));
   }

   mostrar(E,N);
   free(E);
   return 0;
}

void mostrar(struct TEmple *e, int cant){
  int i;
  for (i=0; i<cant; i++)
    printf("nom: %s  - edad: %d\n",
           e[i].nom, e[i].edad);
}
