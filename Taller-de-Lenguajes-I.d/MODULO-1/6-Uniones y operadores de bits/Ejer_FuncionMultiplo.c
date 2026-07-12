/* Este programa determina si el valor es un múltiplo de X. */
#include <stdio.h>

int multiplo( int );
void verBits( unsigned );
int main()
{
   int y;
   printf( "Introduce un entero entre 1 y 32000: " );
   scanf( "%d", &y );

   //y = 24576;
   //y = 227328;
   verBits(y);
   printf("\n");

   /* si y es un múltiplo de X */
   if ( multiplo( y ) )
        printf( "%d es un multiplo de X\n", y );
   else
        printf( "%d no es un multiplo de X\n", y );

   return 0; /* indica terminación exitosa */
}

/* determina si num es un múltiplo de X */
int multiplo( int num )
{
   int i;
   int mascara = 1;
   int mult = 1;

   for ( i = 1; i <= 10; i++, mascara <<= 1 ) {
         if ( ( num & mascara ) != 0 ) {
              mult = 0;
              break;
          }
    }
    return mult;
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
