#include <stdio.h>
#include <stdlib.h>

int Mayor(int, int, int);
int main()
{   int a,b,c;
    printf("Mayor de tres numeros!\n");
    scanf("%d %d ", &a,&b);
    scanf("%d",&c);
    printf("el mayor es %d\n", Mayor(a,b,c));
    return 0;
}
int Mayor(int n1,int n2,int n3){
    int mayor;
    if(n2>n1) mayor=n2;
    else mayor=n1;
    if(n3>mayor) mayor=n3;
    return mayor;
}
