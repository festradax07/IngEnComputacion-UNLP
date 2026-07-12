#include <stdio.h>
#define COL 2
int mini(int [][COL], int);
int main()
{   int M1[2][COL]={{10,2},{4,1}};
    int M2[4][COL]={{3,4},{12,2},{76,1}};

    printf("El menor valor de M1 es %d\n", mini(M1,2));
    printf("El menor valor de M2 es %d\n", mini(M2,4));

    return 0;
}

int mini(int M[][COL], int f)
{  int i,j, menor=M[0][0];

   for(i=0; i<f; i++)  /* recorre las filas */
      for (j=0; j<COL; j++) /*recorre las columnas */
         if (menor>M[i][j])
             menor = M[i][j];

   return(menor);
}
