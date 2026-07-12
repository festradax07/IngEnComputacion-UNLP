#include <stdio.h>
int main()
{ unsigned int uentero;
  char caracter;
  unsigned char ucarac;

  uentero = -190 ;
  caracter = uentero;
  ucarac = uentero;

  printf("entero   = %u  %d\n", uentero, uentero);
  printf("caracter = %d  %c\n", caracter, caracter);
  printf("ucarac   = %u  %c\n", ucarac, ucarac);
  return 0;
}

