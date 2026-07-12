#include <stdio.h>
#include <stdlib.h>

int incremento(int);
int main(){
 float i;
 for(i=6; i>0.5; i/=2)
 printf("i=%5.1f j=%5d\n", i, incremento(i));
 return 0;
}
int incremento(int N){
 static int j=0;
 j++;
 return (N%2 ? N : N+j);// si n es par es n+1, si n es <> 0 devuelve n int
}
