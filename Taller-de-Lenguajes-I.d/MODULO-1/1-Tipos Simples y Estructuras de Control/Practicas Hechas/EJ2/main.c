#include <stdio.h>
#include <stdlib.h> // innecesario AHORA.

int main()
{   // NO HAY WARNINGS
    //CHAR TO INT
    char car = 65; //{-128,127}  -128 +(dato-127) -1 =
    printf("char %c \n", car);
    char c = 'a';
    int x= 64;
    printf("char c = %c\n", x);
    printf("int x = %d\n", c);
    //float to double
    /*diferencias
    float 4 bytes double 8 bytes => el doble de valores alcanzados del flotante.*/
    double doble= 54.23;
    float ma= 3.2212;
    ma=doble; //aparentemente se asignan perfectamente
    printf("ma %.2f", ma);
    printf("doble %.2lf \n", doble);

    //  64 +0-1
    x= 2*32+10%2-1;
    //hay un orden o separacion de terminos de manera matematica para las operaciones;
    printf("x es %d \n", x);
    printf("el x vale en memoria %d \n", sizeof(x));
    printf("el doble vale en memoria %d \n ", sizeof(doble));
    printf("el float vale en memoria %d \n", sizeof(ma));
    printf("el char vale en memoria %d \n ", sizeof(char));
    //size of funcion que me puede enviar con forma de int el espacio en memoria ocupado por la variable;
    return 0;
    }
