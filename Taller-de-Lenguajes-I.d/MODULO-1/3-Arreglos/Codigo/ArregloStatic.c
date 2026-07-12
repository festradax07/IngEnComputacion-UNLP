#include <stdio.h>
void ArregloStatic(void);
int main()
{   printf("ArregloStatic - 1ra. vez\n");
    ArregloStatic();

    printf("\n\n\nArregloStatic - 2da. vez\n");
    ArregloStatic();
    return 0;
}
void ArregloStatic(void)
{  static int nros[3];
   int i;

   printf("Valores al entrar\n");
   for (i=0; i<3; i++)
     printf("nros[%d]=%d  ",i,nros[i]);

   printf("\n\nSumamos 5 a c/u y salimos\n");
   for (i=0; i<3; i++)
     printf("nros[%d]=%d  ",i,nros[i]+=5);
}
