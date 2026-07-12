#include <stdio.h>
#include <string.h>
#include <time.h>

struct fecha {
   int tipo;
   union {
      time_t f_unix;
      char f_texto[11];
   } datos_fecha;
};
int main()
{  struct fecha F;

   F.tipo = 1;
   F.datos_fecha.f_unix = time(NULL);
   printf("Segundos desde el 01-01-1970 = %ld\n", F.datos_fecha.f_unix);

   struct tm *struct_tm = localtime(&F.datos_fecha.f_unix);

   printf ("Hoy es: %02d-%02d-%d\n", struct_tm->tm_mday, 
                          1+struct_tm->tm_mon, 1900+struct_tm->tm_year);

   char fechaHora[50];

   strftime(fechaHora, sizeof(fechaHora), "%d-%m-%Y", struct_tm);

   printf("Fecha : %s\n", fechaHora);
   return 0;
}