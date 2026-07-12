#include <stdio.h>
#include <stdlib.h>

int main()
{
    int alturat;
    printf("Ingrese la altura del rombo que desea!( DEBE SER UN NUMERO PAR a partir de 4): \n");
    scanf("%d",&alturat);
    while((alturat%2) || (alturat<4)){
     printf("DEBE INGRESAR UN NUMERO PAR A partir de 4: \n");
     scanf("%d",&alturat);
    }
    int altura= alturat/2;
    int fila,espacio,ast;
    for(fila=0; fila<altura;fila++){
        //bucle espacios
                    // mas chica que altura-fila-1
                    /* 4-1=3  fila 0
                       4-2=2 fila 1
                       4-3=1 fila 2  altura-fila =4-2-1 = 1 > altura-fila-1
                       4-4=0; fila 3 termina con fila 4 y corta el for*/
        for(espacio=0; espacio < (altura-fila-1); printf(" "),espacio++);
        //bucle asteriscos
        for(ast=0; ast < (2*fila)+1; printf("*"),ast++);
                            //2*0+1= 1 ast
                            //2*1 + 1 = 3
                            //2*2+1 = 5
                            //2*3 + 1= 7 fila 3 termina f4 y corta
                            //2 > fila-1 = 0
     printf("\n");
    }
    for(fila=altura-2;fila>-1;fila--){ // tenia que modificar los parametros de fila, el patron era el mismo dependiendo de la fila
       for(espacio=0;espacio < altura-fila-1; espacio++){
        printf(" ");
       }
       for(ast= 0; ast <(2*fila)+1 ;printf("*"),ast++);

     printf("\n");
    }
    return 0;
}
