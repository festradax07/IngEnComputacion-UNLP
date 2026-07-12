#include <stdio.h>
#include <stdlib.h>
char * reemplazo(char*,char,char);
int main()
{
    char word[32]="pemegramde";
    char m='m'; char n='n';
    char * p = reemplazo(word,m,n);
    int i;
    for(i=0; word[i] !='\0';i++){
        printf("%c ", word[i]);
    }
    return 0;
}
char * reemplazo(char *p, char m, char n){
    char * aux;
    for(aux=p;*p!='\0';p++){
        if(*p==m)*p=n;
    }
    return aux;
}

