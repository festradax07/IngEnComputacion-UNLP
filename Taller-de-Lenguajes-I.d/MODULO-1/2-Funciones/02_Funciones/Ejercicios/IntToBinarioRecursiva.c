/* Convierte a binario */
#include <stdio.h>
unsigned int IntToBinario(int);
int main()
{  int i;

   for (i=9 ; i<=127; i+=9)
      printf("%3d    %7d\n", i, IntToBinario(i));

   return 0;
}

unsigned int IntToBinario(int n)
{
  if(n<2)
       return n;
  else return 10*IntToBinario(n/2)+n % 2;

}
