#include <stdio.h>
#include <stdlib.h>

int main()
{   int a,b,res,i,nota=0;
    srand(time(NULL));
    printf("resuelva las siguientes operaciones \n");
    for(i=0;i<4;i++){
      a=rand() % 101; b=rand() % 101;
      printf("%d + %d = ?", a,b);
      scanf("%d",&res);
      if(res ==(a+b)) nota++;
    }
    printf("tu nota es : ");
    switch (nota){
        case 4: printf(" A!\t Felicidades!");
            break;
        case 3: printf("B!\t Muy bien!");
            break;
        case 2: printf(" C!\t Aprobado!");
            break;
        case 1: printf(" D!\t por poco!");
            break;
        case 0: printf(" E!\t a leer más!");
            break;
    }
    return 0;
}
