#include <stdio.h>
#include <stdlib.h>
int esNumeroPrimo(int);
int main()
{int total=0,pri;
  while(total < 5){
    printf("es primo? \n");
    scanf("%d",&pri);
    if(esNumeroPrimo(pri)){ // los 0s los toma como falsos mientras que todo lo demas es true;
        printf("si lo es!");
        total++;
    } else printf("no lo es!");
  }
    return 0;

}
int esNumeroPrimo(int n){
    int i;
    for(i=2; i< n;i++){
        if (n%i==0){
            return 0;
        }
    }
    return 1;
}
