#include <stdio.h>
#include <stdlib.h>
#define col 3
#define fila 2
void multiplicarMatriz(int [][col],int,int,int);
void imprimirMatriz(const int [][col],int,int);
int main()
{
    int c, matrix[fila][col]={{1,2,5},{2,9,6}};
    imprimirMatriz(matrix,fila,col);
    printf("ingrese un numero para multiplicar en la matriz; \n");
    scanf("%d", &c);
    multiplicarMatriz(matrix,fila,col,c);
    imprimirMatriz(matrix,fila,col);
    return 0;
}

void multiplicarMatriz( int matrix[][col],int fil,int colum, int c){
int i,j;
for(i=0;i<fil;i++){
    for(j=0;j<colum;j++){
        matrix[i][j]*=c;
    }
}
}
void imprimirMatriz(const int matrix[][col], int fil, int colum){
    int i,j; //fila,columna
    for(i=0;i<fil;i++){
        for(j=0;j<colum;j++){
            printf("fila %d, columna %d = %d \n", i,j, matrix[i][j]);
        }
    }
}
