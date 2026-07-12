#include <stdio.h>
#include <stdlib.h>

int main()
{ //como crear .h y .c//
    //a
    double pi= 3.14;
    //int y= 5; LO BORRÈ PORQUE NEVER USED
    printf("pi= %lf \n", pi); // da cualquier cosa porque pide decimal y le doy un int
    //b
    int x=10;
    if (x==5) // va a ser 0 pero originalmente era una asignacion, la toma como valido;
    printf("x = 5\n");
    return 0;
}

