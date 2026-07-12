#include <stdio.h>
#include <stdlib.h>
#define col 3
#define fila 4
void sumaDeMatriz(int [][col],int[][col],int[][col],int,int);
void imprimirMatriz(const int[][col], int,int);
int main()
{
    int matrix[fila][col]={{1,2,3},{4,5,6},{7,8,9},{10,11,12}};
    int matrix2[fila][col]={{1,2,3},{1,2,3},{1,2,3},{1,2,3}};
    int matrix3[fila][col]={0};
    printf("matriz uno : \n");
    imprimirMatriz(matrix,fila,col);
    printf("matriz dos : \n");
    imprimirMatriz(matrix2,fila,col);
    sumaDeMatriz(matrix,matrix2, matrix3,fila,col);
    printf("\n");
    imprimirMatriz(matrix3,fila,col);
    return 0;
}
void sumaDeMatriz (int matrix[][col], int matrix2[][col],int matrix3[][col],int fil,int colum){
int i,j; //
for(i=0;i<fil;i++){
    for(j=0;j<colum;j++){
        matrix3[i][j] += (matrix[i][j]+ matrix2[i][j]);
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
