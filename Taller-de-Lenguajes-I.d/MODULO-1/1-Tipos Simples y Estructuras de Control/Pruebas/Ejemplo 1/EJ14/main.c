#include <stdio.h>
#include <stdlib.h>
int espejo(int);
int main()
{   int n;
    printf("espejo!");
    scanf("%d",&n);
    printf(" el espejo de  %d  es:  %d", n,espejo(n));
    return 0;
}
int espejo(int n){
    int dig,espejo=0;
    while(n!=0){
        dig=n%10; // tengo el ult dig
        n=n/10; // tengo el resto
        espejo= espejo*10 + dig;
    }
    return espejo;
}
