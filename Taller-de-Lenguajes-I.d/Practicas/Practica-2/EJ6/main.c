#include <stdio.h>
#include <stdlib.h>
#define dimf 10
int main()
{   int var,dig, i;
    int digitos[10]={0};
    printf("ingrese un numero entero!\n");
    scanf("%d", &var);
    while(var!=0 ){
        dig= var%10;
        digitos[dig]++;
        var/=10;
    }
    for(i=0;i<dimf;i++){
        if(digitos[i]!=0){
         printf("digito %d aparece %d veces \n", i,digitos[i]);
        }
    }
    return 0;
}
