#include <stdio.h>
#include <stdlib.h>
#define dimf 5
float minimo(const float[], int);
float promedio(const float[],int);
int posicionmaxima (const float[],int);

int main()
{
    srand(time(NULL));
    float vector[dimf]={5.4,12.9,32.0,64.444,10.6};
    printf("promedio= %.2f \n",promedio(vector,dimf));
    printf("posicionmaxima = %d \n", posicionmaxima(vector,dimf));
    printf("minimo= %.2f", minimo(vector,dimf));
    return 0;
}
float promedio(const float vector[], int limite){
    float total=0; int i;
    for(i=0;i<limite;i++){
        total+=vector[i];
    }
    return (total/(limite-1));
}
int posicionmaxima(const float vector[],int limite){
    int i,pos; float maximo=-1;
    for(i=0;i<limite;i++){
        if(vector[i]>maximo){
            maximo=vector[i];
            pos=i;
        }
    }
    return pos;
}
float minimo(const float vector[], int limite){
    float min= 9999.9;
    int i;
    for(i=0;i< limite;i++){
        if(vector[i] < min) min = vector[i];
    }
    return min;
}
