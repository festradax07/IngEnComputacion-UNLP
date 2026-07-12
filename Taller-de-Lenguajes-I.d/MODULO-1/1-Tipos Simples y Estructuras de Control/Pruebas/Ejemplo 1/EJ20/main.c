#include <stdio.h>
#include <stdlib.h>
int damePar(int);
int main()
{
    int i,n;
    printf("indique los n numeros pares que desea ver:\n");
    scanf("%d", &n);
    for(i=0;i<n;i++){
        printf("%d \n", damePar(i));
    }
    return 0;
}
int damePar(int i){
    return 2*i;
}
