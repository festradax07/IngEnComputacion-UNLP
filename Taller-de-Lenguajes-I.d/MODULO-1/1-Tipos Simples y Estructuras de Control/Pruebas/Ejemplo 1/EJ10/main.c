#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i,num1=0,num2=0;
    /* inicializacion = preparo el inicio del indice.
     condicion= le coloco una condicion para evaluar
     accion posterior: accion que se ejecuta entre indice e indice;

     ( ini / condi / post )  post es opcional, ya que puede estar dentro del argumento o simplemente no existir*/
    for(i=0;i<10;++i){
        printf("i = %d \n", i);
        printf("num1++ %d \n", num1++);
        printf("++num2 %d \n \n", ++num2);
    }
    return 0;
}
