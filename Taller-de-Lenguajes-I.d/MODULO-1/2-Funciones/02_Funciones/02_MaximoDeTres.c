/* Maximo de tres números */
#include <stdio.h>
double maximo(int, int, int);
int main()
{ float a,b,c;

  printf("Ingrese 3 nros.enteros : ");
  scanf("%f %f %f", &a, &b, &c);

  printf("Maximo = %d\n", (int) maximo(a,b,c));
  return 0;
}

double maximo(int x,int y,int z)
{ double mayor = x;

  if (y>mayor) mayor = y;
  if (z>mayor) mayor = z;

  return mayor;
}

