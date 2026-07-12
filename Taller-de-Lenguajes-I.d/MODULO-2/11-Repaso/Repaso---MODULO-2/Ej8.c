#include <stdio.h>
typedef struct nodo {
   int dato;
   struct nodo * sig;
} lista;
void verLista(lista *);
lista * Borrar(lista *, int);

int main()
{
    lista * L = NULL;
    int i;
    lista * unNodo;

    for (i=0; i< 10; i++){
       unNodo = malloc(sizeof(lista));
       unNodo->dato = i;
       unNodo->sig = L;
       L = unNodo;
    }
    verLista(L);

    L = Borrar(L, 3);

    verLista(L);

    return 0;

}
lista * Borrar(lista *L, int N){
  int i;
  lista *ant, *act;
  act = L;
  if (N==1){
      L = L->sig;
      free(act);
     }
  else{
     ant = L;
     i = 2;
     act = L->sig;
     while ((act != NULL) && (i<N)){
        ant = act;
        act = act ->sig;
        i++;
     }
     if (act!=NULL){
        ant->sig = act->sig;
        free(act);
     }
  }
  return(L);
}

void verLista(lista * unNodo){
  while (unNodo != NULL){
      printf("%d ", unNodo->dato);
      unNodo = unNodo->sig;
  }
  printf("\n");
}
