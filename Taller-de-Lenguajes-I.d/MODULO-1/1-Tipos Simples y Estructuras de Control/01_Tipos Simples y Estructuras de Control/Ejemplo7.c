/* Tabla Fahrenheit-Celsius */
#include <stdio.h>
int main()
{  int fahr;
   float celsius;

   for (fahr=0; fahr<=300; fahr += 20)
   {
       celsius = (5.0/9)*(fahr-32);
       printf("%3d   %6.1f \n", fahr, celsius);
   }
   return 0;
}
