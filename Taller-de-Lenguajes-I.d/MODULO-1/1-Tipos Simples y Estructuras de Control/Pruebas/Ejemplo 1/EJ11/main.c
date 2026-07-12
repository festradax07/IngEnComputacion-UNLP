#include <stdio.h>
#include <stdlib.h>

int main()
{ int i;
/*for (i = 0; i <= 11; i++) // DE 0 A 11
    printf("%d ",i);


for (i = 0; i <= 11; ++i) //DE 0 A 11
    printf("%d\n",i);
for (i = 2; i <= 11; i+=2) // DE 2-4-6-8-10
    printf("%d\n",i);
for (i = 1; i <= 11; i*=2) //  1-2-4-8
    printf("%d\n",i);
for (i = 11; i >= 1; i-=2) //11-9-7-5-3-1
    printf("%d\n",i);
*/
for (i = 11; i > 1; i=+1){ // solo una vez se ejecutará
    printf("%d\n",i);
} // 11


return 0;
}
