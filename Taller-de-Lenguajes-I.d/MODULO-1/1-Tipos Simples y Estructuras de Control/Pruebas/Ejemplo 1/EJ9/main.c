#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x, y; char c;
    scanf("%d",&x);
    scanf("%d",&y); //DOS FORMAS, IF ANIDADOS O SWITCH. POR SER ESTRUCTURAS DE DECISION
    scanf(" %c", &c);
    switch(c){
     case '+': printf("x + y = %d ",x+y);
                break;
     case '-': printf("x - y = %d", x-y);
                break;
     case '*': printf("x * y = %d", x*y);
                break;
     case '/': printf("x / y = %d", x/y);
                break;
     default: printf("error!! eso no es una operacion aritmetica! >:(");
    }
    return 0;
}
