/* Qué imprime? */
#include <stdio.h>
int main()
{ int j;
  for (j=3; j<=10; ++j)
    switch (j)
    {
      case 3 : printf("j vale 3\n"); break;
      case 4 : printf("j vale 4\n"); break;
      case 5 :
      case 6 : case 7 :
      case 8 : printf("j entre 5 y 8\n"); break;
      default :
        printf("j es mayor que 8\n");
    }

  return 0;
}