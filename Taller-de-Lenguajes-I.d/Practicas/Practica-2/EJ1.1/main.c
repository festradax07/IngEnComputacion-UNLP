#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define dimf 50
int main()
{
    srand(time(NULL));
    int i,vector[dimf];
    for(i=0;i< 50;i++){
      vector[i]= rand()%100;
    }
    printf("posiciones impares con numeros pares \n");
    printf("---------------------------------------- \n");
    for(i=0; (2*i+1) < 50;i++){
        if(vector[2*i+1] % 2 == 0) printf("numero: %d en posicion %d \n", vector[2*i+1],2*i+1);
    }
    printf("posiciones pares con numeros impares\n");
    printf("---------------------------------------- \n");
    for(i=0;2*i<50;i++){
        if(vector[2*i]%2 != 0) printf("numero: %d en posicion %d \n", vector[2*i],2*i);
    }
    return 0;
}
