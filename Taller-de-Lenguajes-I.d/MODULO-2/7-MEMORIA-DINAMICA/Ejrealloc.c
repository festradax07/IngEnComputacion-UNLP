#include <stdio.h>
#include <stdlib.h>
void mostrar(int [], int);
#define N 10
int main()
{  int i=0, n;
   int *pesos=NULL;

//   pesos = malloc(N * sizeof(int));
   printf("ingrese el peso (0, 250]: ");
   scanf("%d", &n);

   while (n>0 && n<= 250){
      if ((i % N)==0)
        pesos = realloc(pesos, (i+N)*sizeof(int));

      pesos[i]= n;
      i++;
      printf("ingrese el peso (0, 250]: ");
      scanf("%d", &n);
   }

   mostrar(pesos, i);
   free(pesos);
   return 0;
}

void mostrar(int V[], int cant){
  int i;
  for (i=0; i<cant; i++)
    printf("%d ", V[i]);
  printf("\n");
}
