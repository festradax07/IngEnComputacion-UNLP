#include <stdio.h>
enum Dupes
{  Base, /* Vale 0 */
   One,  /* Vale Base + 1 */
   Two,  /* Vale One + 1 */
   Negative = -1,
   AnotherZero /* Vale Negative + 1 == 0 */
};

int main()
{
  printf("Base = %d\n", Base);
  printf("Uno = %d\n", One);
  printf("Dos = %d\n", Two);
  printf("Negativo = %d\n", Negative);
  printf("otroCero = %d\n", AnotherZero);

  return 0;
}

