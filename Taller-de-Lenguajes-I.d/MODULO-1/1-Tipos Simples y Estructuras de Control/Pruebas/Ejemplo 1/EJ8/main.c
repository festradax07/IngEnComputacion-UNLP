#include <stdio.h>
#include <stdlib.h>

int main()
{/*
    int edad;
if (edad >= 40);
 printf("Tiene %d años o más",&40);
 else
printf("Tiene menos de %d años",&40);
   */
   int edad;
   printf("introduzca su edad: \n");
   scanf("%d", &edad);
   if(edad >=40) printf("tiene 40 anios o mas: %d \n" , edad);
   else printf("tiene menos de 40 anios:  %d \n", edad);

   printf("ejercicio 3 \n");
   printf("---------------");
    int valor;
    scanf("%d",&valor);
    switch (valor % 2) {
    case 0: printf("El valor es par");
        break; //faltaban los breaks;
    case 1: printf("El valor es impar");
            break;
    }
    printf("\n ejercicio 2 \n");
    printf("---------------\n");
    int total=0, x = 1; //total debe estar inicializado?
    while (x <= 10) {
    total += x;
    ++x;
    }
    printf("Total = %d",total); // esto estaba en f

    printf("\n ejercicio 4 \n");
    printf("---------------\n");
    int x2, y;
    scanf("%d",&x2);
    scanf("%d",&y);
    printf("x + y = %d ",x2+y);

    return 0;

}
