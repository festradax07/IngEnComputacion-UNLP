#include <stdio.h>
enum meses { ENE , FEB, MAR, ABR, MAY, JUN,
             JUL, AGO, SEP, OCT, NOV, DIC };
int main()
{
    enum meses mes;

    mes = MAR;

    printf("La variable" " mes vale %d\n", mes);

    return 0;
}

