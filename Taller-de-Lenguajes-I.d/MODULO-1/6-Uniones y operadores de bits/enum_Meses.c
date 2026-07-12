#include <stdio.h>
#include <stdlib.h>
enum meses { ENE = 1, FEB, MAR, ABR, MAY, JUN,
                 JUL, AGO, SEP, OCT, NOV, DIC };
int main()
{
    enum meses mes;
    const char *nombreMes[] = { "", "Enero", "Febrero",
        "Marzo", "Abril", "Mayo", "Junio", "Julio",
        "Agosto", "Septiembre", "Octubre","Noviembre",
        "Diciembre" };

    /* ciclo a través de los meses */
    for ( mes = ENE; mes <= DIC; mes++ )
       printf( "%2d%11s \n", mes, nombreMes[ mes ] );

    return 0;
}

