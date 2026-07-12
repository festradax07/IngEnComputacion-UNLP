#include <stdio.h>
#include <stdlib.h>


// sea n=3
// 0 { 1 1 2 3, 5, 8
void Fibonacci(int penult,int ult,int n){
  printf("%d ", ult);
  if(n>1)Fibonacci(ult, penult + ult,--n);
 }
int main()
{
    int n;
    printf("escribe un n para la sucesion de fibonacci:(exit 0) \n");
    scanf("%d",&n);
    while(n!=0 ){
        Fibonacci(0,1,n);
        printf(" \n escribe OTRO n para la sucesion de fibonacci: (exit 0) \n");
        scanf("%d",&n);
    }
    printf("gracias por probarlo! :D \n");
    return 0;
}
