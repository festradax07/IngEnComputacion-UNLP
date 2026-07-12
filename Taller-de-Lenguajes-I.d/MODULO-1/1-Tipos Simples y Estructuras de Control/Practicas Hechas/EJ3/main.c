#include <stdio.h>
#include <stdlib.h>

int main()
{ //NUMEROS NATURALES Y ENTEROS EN C
    /*

    ENTERO == TIPO DE DATO
    SHORT, UNSIGNED, UNSIGNED SHORT == MODIFICADOR
DATO ENTERO MEM RANGO DE VALORES
short int 2 -32.768 a 32.767
unsigned short int 2 0 a 65.535
int 4 -2.147.483.648 a 2.147.483.647
usigned int 4 0 a 4.294.967.295
long int 4 -2.147.483.648 a 2.147.483.647
unsigned long int 4 0 a 4.294.967.295
   */
 short int p=32768;
 printf("%hd", p ); // dio la vuelta porque rebas‘;
 printf("tamanio short int %d", sizeof(p));
}
