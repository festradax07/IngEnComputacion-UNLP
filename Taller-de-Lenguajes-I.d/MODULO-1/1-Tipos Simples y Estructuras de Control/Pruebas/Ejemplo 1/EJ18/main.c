#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(){
    srand(time(NULL));
    int j;
    for( j=1; j<=15;j++){
        int i=rand();
        printf("%d \n",i);
    }
    //leer en el libro sobre srand y rand()
    return 0;
}
