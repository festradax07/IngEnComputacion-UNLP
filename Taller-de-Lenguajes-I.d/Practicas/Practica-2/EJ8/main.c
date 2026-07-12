#include <stdio.h>
#include <stdlib.h>
#define DIMF 5
void promedioPosMaxMin(const float vector[],int,float *, int *, float *);
int main()
{
    float vector[DIMF]={5.4,12.9,32.0,64.444,10.6},promedio;
    int posMax;float Valmin;
    promedioPosMaxMin(vector,DIMF,&promedio,&posMax,&Valmin);
    printf("promedio= %.2f \n posicionmaxima = %d \n minimo=%.2f",promedio,posMax,Valmin);
    return 0;
}
void promedioPosMaxMin(const float vector[],int limite,float * promedio, int * posMax, float * Valmin){
    float total=0; int i,max=-1;
    for(i=0;i<limite;i++){
        total+=vector[i];
        if(vector[i]>max){
            max=vector[i];
            *posMax=i;
        }
        if(vector[i]< *Valmin) *Valmin=vector[i];
    }
    *promedio = total/(limite-1);
}
