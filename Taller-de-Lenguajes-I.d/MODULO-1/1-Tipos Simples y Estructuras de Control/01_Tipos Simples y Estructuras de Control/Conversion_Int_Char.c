#include <stdio.h>
int main()
{ unsigned int uentero; /* [0, 4294967295] */
  int entero;           /* [-2147483648, 2147483647] */
  char caracter;        /* [-128, 127] */
  unsigned char ucarac; /* [0, 255] */

  ucarac = 250;
  caracter = ucarac;
  uentero = caracter;
  entero = caracter;

  printf("\n  ucarac   = %u    %c\n", ucarac, ucarac);
  printf("  caracter = %d    %c\n", caracter, caracter);
  printf("  uentero  = %u\n", uentero);
  printf("  entero   = %d\n", entero);

  entero = -2147483649;
  printf("\n  entero   = %d\n", entero);

  return 0;
}
