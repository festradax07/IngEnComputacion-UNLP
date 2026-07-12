#include <stdio.h>
int main()
{
  unsigned x;

  printf("Ingrese un entero sin signo: ");
  scanf("%u", &x);

  printf("%u es %s \n", x, ( x % 2 ? "impar" : "par"));

  printf("%u es %s \n", x, ( x & 1 ? "impar" : "par"));

  return 0;
}

