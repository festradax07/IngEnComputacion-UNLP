/*
ESTE ES MI
PRIMER PROGRAMA EN C*/
#include <stdio.h> // ESTE ES  STANDAR IO

int main() // PROGRAMA PRINCIPAL ES UNA FUNCION
{
    int misMaterias;
    printf("ingresa el num de materias hechas : ");
    scanf("%d", &misMaterias); // tipo de dato a ingresar "decimal", &? pero es la variable
    printf("Hola mundo, tengo %d mater
           ias hechas \n", misMaterias);// muestra result en pantalla
    printf("vamos los pibes!!");
    return 0; //  al ser una funcion debe devolver algo, buena practica que devuelva.

}
