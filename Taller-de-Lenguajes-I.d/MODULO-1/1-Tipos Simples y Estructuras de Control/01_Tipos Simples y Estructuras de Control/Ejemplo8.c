#include <stdio.h>
int main()
{   int n;

    for (n=5; n<=10; n++)
    { if (n==8)
           break;
      printf("%2d es menor que 8\n", n);
    }

    for (n=5; n<=10; n++)
    { if (n==8)
           continue;
      printf("%2d es distinto de 8\n", n);
    }
    return 0;
}
