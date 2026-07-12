#include <stdio.h>
#include <stdlib.h>
#DEFINE DIMF 5
int main()
{
    int arreglo[DIMF]={1,2,3,4,5};
    swapVector(arreglo,limite); // para terminar con swap:

    return 0;
}
void swapVector(int arreglo[],int limite){
int *p=arreglo,*p2=*p+(limite-1),i;
while(p2>p1){
    i=*p;
    *p=*p2; // le puse 5 , tengo 1 en el aire;
    *p2=i;
    p++;
    p2--;
}
}
