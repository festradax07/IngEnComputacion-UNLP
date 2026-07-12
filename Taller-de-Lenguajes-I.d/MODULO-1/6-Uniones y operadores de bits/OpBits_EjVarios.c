#include <stdio.h>
void verBits( unsigned );
int main()
{
  unsigned n1, n2, mascara;

  // Uso del operador de bits AND (&)
  n1 = 65535;
  mascara = 1;
  printf("El resultado de combinar los siguientes valores \n");
  verBits(n1);
  verBits(mascara);
  printf("con el uso del operador de bits AND (&) es\n");
  verBits(n1 & mascara);

  // Uso del operador de bits OR (|)
  n1 = 15;
  mascara = 241;
  printf("El resultado de combinar los siguientes valores \n");
  verBits(n1);
  verBits(mascara);
  printf("con el uso del operador de bits OR (|) es\n");
  verBits(n1 | mascara);

  // Uso del operador de bits XOR (^)
  n1 = 139;
  mascara = 199;
  printf("El resultado de combinar los siguientes valores \n");
  verBits(n1);
  verBits(mascara);
  printf("con el uso del operador de bits XOR (^) es\n");
  verBits(n1 ^ mascara);

  // Uso del operador de bits complemento (~)
  n1 = 21845;
  printf("El complemento a 1 de \n");
  verBits(n1);
  printf("es\n");
  verBits(~ n1);

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
