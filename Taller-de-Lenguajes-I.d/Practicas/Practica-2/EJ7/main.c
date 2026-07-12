#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define fila 12
#define col 30
#define z 10
void darValorTensor(float[][col][z], int,int,int);
void mesMenosLlovido(float[][col][z],int,int, int);
int main()
{   float preci[fila][col][z];
    darValorTensor(preci,fila,col,z);
    mesMenosLlovido(preci,fila,col,z);
    return 0;
}

void mesMenosLlovido(float preci[][col][z],int fil, int colum, int zeta){
int i,j,k,month; // mes, dia , año
float min,promedio;
for(k=0; k < zeta;k++){
        min= 999999.9;
        month=0;
        for(i=0;i<fil;i++){
            promedio=0;
            for(j=0;j < colum;j++){
                promedio+=preci[i][j][k];
            }
            promedio/=colum;
            if(promedio < min){
             min=promedio;
             month= i;
            }
        }
        printf("el mes que menos llovió fue: %d en el año %d \n", month+1,k+1);
    }
}
void darValorTensor(float preci[][col][z],int fil, int colum, int zeta){
    int i, j, k;
    srand(time(NULL));
    for(i=0; i < fil;i++){
        for(j=0;j<colum;j++){
            for(k=0;k < zeta;k++){
                preci[i][j][z] = rand() % 100;
            }
        }
    }
}
