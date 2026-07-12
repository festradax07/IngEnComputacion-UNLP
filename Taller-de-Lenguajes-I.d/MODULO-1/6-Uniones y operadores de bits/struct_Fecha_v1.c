#include <stdio.h>
#include <string.h>
#include <time.h>

struct fecha {
   int tipo;
   union XX{
      time_t f_unix;
      char f_texto[11];
   } datos_fecha;
};

int main()
{  struct fecha F;

   printf("sizeof(F)= %u\n", sizeof(F));

   F.tipo = 1;
   F.datos_fecha.f_unix = time(NULL);

   printf("Segundos desde el 01-01-1970 = %ld\n", F.datos_fecha.f_unix);

   F.tipo = 2;
   strcpy(F.datos_fecha.f_texto, "10-04-2023");
   printf("Fecha : %s\n", F.datos_fecha.f_texto);

   return 0;
}
