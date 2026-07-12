#include <stdio.h>
void ArregloDinamico(void);
int main()
{   printf("ArregloDinamico - 1ra. vez\n");
    ArregloDinamico();

    printf("\n\n\nArregloDinamico - 2da. vez\n");
    ArregloDinamico();
    return 0;
}
void ArregloDinamico(void)
{  int nros[3] = {1,2,3};
   int i;

   printf("Valores al entrar\n");
   for (i=0; i<3; i++)
     printf("nros[%d]=%d  ",i,nros[i]);

   printf("\n\nSumamos 5 a c/u y salimos\n");
   for (i=0; i<3; i++)
     printf("nros[%d]=%d  ",i,nros[i]+=5);
}
