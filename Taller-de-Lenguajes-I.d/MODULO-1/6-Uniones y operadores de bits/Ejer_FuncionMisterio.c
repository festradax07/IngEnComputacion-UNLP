#include <stdio.h>

int misterio( unsigned );
void verBits( unsigned );

int main()
{  unsigned x;

   printf("Ingrese un entero: ");
   scanf( "%u", &x );

   verBits(x);

   printf( "\nEl resutado es %d\n", misterio( x ) );

   return 0;
}

int misterio( unsigned bits )
{
   unsigned i;
   unsigned mascara = 1 << 31;
   unsigned total = 0;

   for ( i = 1; i <= 32; i++, bits <<= 1 )

       if ( ( bits & mascara ) == mascara )
            total++;

   return !( total % 2 ) ? 1 : 0;
}

void verBits( unsigned valor )
{
  unsigned Mascara = 1 << 31;

  printf("%10u = ", valor);

  for (int i=1; i <= 32 ; i++){
    putchar( valor & Mascara ? '1' : '0');
    valor = valor << 1;

    if (i % 8 == 0)
        putchar(' ');
  }
}
