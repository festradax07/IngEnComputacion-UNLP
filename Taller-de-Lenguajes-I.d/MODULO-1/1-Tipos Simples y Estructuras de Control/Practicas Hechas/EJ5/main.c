#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i;
    for (i=1;i <51;i++){
        if(i%5==0)printf("%d  ",i);
    }
    printf("\n");
    for(i=5;i<=50; printf("%d  ",i),i+=5);
    return 0;
    }
