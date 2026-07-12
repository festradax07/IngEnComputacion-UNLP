#include <stdio.h>
#include <stdlib.h>
int factorialn(int);
int factorialrecursive(int);
int main()
{   int n;
    printf("factorial de n! \n");
    scanf("%d", &n);
    printf(" factorial iterativo: %d", factorialn(n));
    printf(" factorial recursivo: %d", factorialrecursive(n));
    return 0;
}
int factorialn(int n){
    int factorial=1;
    while(n!=0){
        factorial*=n;
        n--;
    }
    return factorial;
}
int factorialrecursive(int n){
    if(n<=1)return 1;
    else return (n*factorialrecursive(n-1));

}
