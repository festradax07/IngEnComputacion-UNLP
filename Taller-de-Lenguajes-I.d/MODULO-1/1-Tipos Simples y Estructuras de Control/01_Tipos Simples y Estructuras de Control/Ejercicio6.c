/* Qué imprime? */
#include <stdio.h>
int main()
{   int i;

    for (i=1; i<10; i=i+1)
       if (i % 3 == 0)
          printf("i = %d \n", i);

    return 0;
}
