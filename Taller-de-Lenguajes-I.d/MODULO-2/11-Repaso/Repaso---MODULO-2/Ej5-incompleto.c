#include <stdio.h>

int main()
{
    FILE * archT;
    int n1, n2, cant;
    char nom[30];

    archT = fopen("habitantes.txt", "r+");

    if (archT == NULL)
        printf("no existe el archivo\n");
    else{
      fscanf(archT, "%d%d%s%d", &n1, &n2, nom, &cant);
      while (!feof(archT)){
         printf("%d %d %s %d\n", n1, n2, nom, cant);
         fscanf(archT, "%d%d%s%d", &n1, &n2, nom, &cant);
      }
    }
    fclose(archT);
}
