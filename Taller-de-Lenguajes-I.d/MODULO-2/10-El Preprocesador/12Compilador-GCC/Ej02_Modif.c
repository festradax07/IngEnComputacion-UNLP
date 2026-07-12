#include "hola.h"

int main ()
{
  hola ("mundo");
  return 0;
}
#include <stdio.h>

/* Dibuja una linea en pantalla */
void print_line(int width)
{
    int i;
    for (i = 0; i < width; i++)
    {
	    printf("-");
    }
    printf("\n");
}

int main(int argc, char *argv[])
{
    int index;
    int not_used;
    int letter;

    /* Imprime una linea */
    print_line(LINEWIDTH);

    /* Imprimir los argumentos del main */
    printf("  argc = %d\n", argc);
    for (index = 0; index < argc; index++) {
	    printf("  argv[%d] = %s\n", index, argv[index]);
    }

    /* Invocando muchas veces */
    for (index = 0; index < 1000000000; index++){
	     letter = calculate_letter(index);
    }

    /* Imprime una linea */
    print_line(LINEWIDTH);
}

int calculate_letter(int i)
{
    return 'a' + (i % 24);
}
