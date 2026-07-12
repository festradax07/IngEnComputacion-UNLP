#include <stdio.h>
void verBits( unsigned );
int main()
{
  unsigned n1 = 960;

  // Desplazamiento a izquierda
  printf("El resultado del desplazamiento a izquierda de\n");
  verBits(n1);
  printf("8 posiciones de bit con el uso del operador \n");
  printf("de desplazamiento a izquierda << es\n");
  verBits(n1 << 8);

  printf("\n\n");
  // Desplazamiento a derecha
  printf("El resultado del desplazamiento a derecha de\n");
  verBits(n1);
  printf("8 posiciones de bit con el uso del operador \n");
  printf("de desplazamiento a derecha >> es\n");
  verBits(n1 >> 8);

  return 0;
}

void verBits(unsigned valor)
{
  unsigned Mascara = 1 << 31;

  printf("%10u = ", valor);

  for (int i=1; i <= 32 ; i++){
    putchar( valor & Mascara ? '1' : '0');
    valor = valor << 1;

    if (i % 8 == 0)
        putchar(' ');
  }
  putchar('\n');
}
