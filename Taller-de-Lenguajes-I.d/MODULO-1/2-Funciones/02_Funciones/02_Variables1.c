#include <stdio.h>
int contador;
int main()
{  int indice;
   for (indice=1; indice<10; indice++)
           auxiliar();

   MuestraLlamados();
   printf("contador = %d\n", contador);
   return 0;
}
int CantLlamados;

void auxiliar(void)
{ static int suma ;
  suma = suma + 1;
  printf("Suma = %d\n", suma);
  CantLlamados ++;
  contador++;
}
void MuestraLlamados(void)
{   CantLlamados ++;
    printf("Llamados = %d\n", CantLlamados);

}
