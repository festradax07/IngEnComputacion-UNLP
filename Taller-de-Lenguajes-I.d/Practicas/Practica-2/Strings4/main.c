#include <stdio.h>
#include <stdlib.h>
int strlength(char*);
int main()
{   char word[32]= "spider-man";
    printf(" longitud de spiderman : %d", strlength(word));
    return 0;
}
int strlength(char*p){
int length=0;
while(*p!='\0'){
    length++;
    p++;
}
return length;
}
