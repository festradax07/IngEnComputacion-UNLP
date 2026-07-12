#include <stdio.h>
#include <stdlib.h>
#define col 4
#define fila 4
void matrizTranspuesta(int [][col],int,int);
void imprimirMatriz(const int[][col], int,int);
int main()
{
    int matrix[fila][col]={{1,2,3},{4,5,6},{7,8,9},{10,11,12}};
    imprimirMatriz(matrix,fila,col);
    matrizTranspuesta(matrix,fila,col);
    printf("\n");
    imprimirMatriz(matrix,fila,col);
    return 0;
}
void matrizTranspuesta (int matrix[][col],int fil,int colum){
int i,j,br,dato; //solo col
br=1;
for(i=1;i<fil; br++,i++){
    for(j=0;j<br;j++){
        dato=matrix[i][j];
        matrix[i][j]= matrix[j][i];
        matrix[j][i]=dato;
      }
    }
}
void imprimirMatriz(const int matrix[][col], int fil, int colum){
    int i,j; //fila,columna
    for(i=0;i<fil;i++){
        printf("| ");
        for(j=0;j<colum;j++){
            printf(" %d ", matrix[i][j]);
        }
        printf(" | \n");
    }
}
