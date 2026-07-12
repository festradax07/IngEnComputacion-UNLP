#include <stdio.h>
int main(){

  union numero {
    int x;
    double y;
  };
  union numero valor;

  valor.x = 100;
  printf("Asigno 100 en el campo (int)\n");
  printf("   (int) valor.x = %d\n", valor.x);
  printf("(double) valor.y = %f\n\n", valor.y);

  valor.y = 100;
  printf("Asigno 100 en el campo (double)\n");
  printf("   (int) valor.x = %d\n", valor.x);
  printf("(double) valor.y = %f\n\n", valor.y);


  return 0;
}

