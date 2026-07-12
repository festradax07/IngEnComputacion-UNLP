#include <stdio.h>
#define CARTAS 52
struct cartaBit {
   unsigned cara  : 4;
   unsigned palo  : 2;
   unsigned color : 1;
};

typedef struct cartaBit TCarta;

void llenarMazo(TCarta * const );
void repartir(const TCarta * const );
int main()
{
  TCarta mazo[CARTAS];

  llenarMazo(mazo);

  puts("Los valores de CARA van del 0 (As) al 12 (Rey)");
  puts("Los valores de PALO van 0 al 3 (0 = Diamantes, 1 = Corazones, 2 = Tréboles, 3 = Espadas)");
  puts("Los valores de COLOR son 0 (Rojo) o 1 (Negro)");

  repartir(mazo);
  return 0;
}
void llenarMazo(TCarta * const wMazo)
{ int i;
  /* ciclo a través de wMazo */
  for (i=0; i<CARTAS; ++i){
    wMazo[i].cara = i % (CARTAS/4);
    wMazo[i].palo = i / (CARTAS/4);
    wMazo[i].color = i / (CARTAS/2);
  }
};

/* muestra las cartas en formato de dos columnas; el subíndice de las
   cartas 0 a 25 es k1 (columna 1); el subíndice de las cartas 26 a 51
   es k2 (columna 2) */
void repartir(const TCarta * const wMazo)
{
    int k1; /* subíndice 0-25 */
    int k2; /* subíndice 26-51 */

    printf("%-10s%-8s%-12s%-10s%-8s%s\n", "Carta", "Palo", "Color",
           "Carta", "Palo", "Color");

    /* ciclo a través de wMazo */
    for ( k1 = 0, k2 = k1 + 26; k1 <= 25; k1++, k2++ ) {
      printf( "Carta:%3d Palo:%2d Color:%2d    ",
      wMazo[ k1 ].cara, wMazo[ k1 ].palo, wMazo[ k1 ].color );
      printf( "Carta:%3d Palo:%2d Color:%2d\n",
      wMazo[ k2 ].cara, wMazo[ k2 ].palo, wMazo[ k2 ].color );
    } /* fin de for */
};
