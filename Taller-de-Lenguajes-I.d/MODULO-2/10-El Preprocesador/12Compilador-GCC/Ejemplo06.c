#include <stdio.h>
#include <time.h>

double powern (double , unsigned);

int main ()
{ clock_t start_t, end_t;
  double total_t, sum = 0.#include <stdio.h>
#include <time.h>

double powern (double , unsigned);

int main ()
{ clock_t start_t, end_t;
  double total_t, sum = 0.0;
  unsigned i;

  start_t = clock();
  for (i = 1; i <= 100000000; i++) {
      sum += powern (i, i % 5);
  }
  end_t = clock();

  printf ("suma = %g\n", sum);

  total_t = 1000.0* (end_t - start_t) / CLOCKS_PER_SEC;
  printf("\nTiempo de CPU (en mseg) = %.0f", total_t);

  return 0;
}

double powern (double d, unsigned n)
{
  double x = 1.0;
  unsigned j;

  for (j = 1; j <= n; j++)
    x *= d;

  return x;
}
