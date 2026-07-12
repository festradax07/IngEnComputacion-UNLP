#include <stdio.h>
int main()
{  int *ptr;
   int dato=30;

   ptr = &dato;
   *ptr = 50;

   printf("Dato = %d\n", dato);

   return 0;
}
