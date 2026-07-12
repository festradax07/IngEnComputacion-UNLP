#include <stdio.h>
#include <time.h>

/* Función para dibujar una linea en pantalla */
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
{   clock_t comienzo = clock();
    int line_width = 80;
    int index;
    int not_used;
    int letter;

    /* Imprime una linea */
    print_line(line_width);

    /* Imprimir los argumentos que recibe la función main */
    printf("  argc = %d\n", argc);
    for (index = 0; index < argc; index++)
    {
	    printf("  argv[%d] = %s\n", index, argv[index]);
    }

    /* Invocando una función muchas veces */
    for (index = 0; index < 1000000000; index++)
    {
	     letter = calculate_letter(index);
    }

    /* Imprime#include <stdio.h>
#include <time.h>

/* Función para dibujar una linea en pantalla */
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
{   clock_t comienzo = clock();
    int line_width = 80;
    int index;
    int not_used;
    int letter;

    /* Imprime una linea */
    print_line(line_width);

    /* Imprimir los argumentos que recibe la función main */
    printf("  argc = %d\n", argc);
    for (index = 0; index < argc; index++)
    {
	    printf("  argv[%d] = %s\n", index, argv[index]);
    }

    /* Invocando una función muchas veces */
    for (index = 0; index < 1000000000; index++)
    {
	     letter = calculate_letter(index);
    }

    /* Imprime una linea */
    print_line(line_width);
    printf("\nTiempo transcurrido (en mseg) = %.2f", 1000.00*(clock()-comienzo)/CLOCKS_PER_SEC);
}

int calculate_letter(int i)
{
    return 'a' + (i % 24);
}
