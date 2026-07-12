#include <stdio.h>
#include <string.h>
enum BOOLEAN
{ false, /* false = 0, true = 1 */
  true };

int main()
{
    enum BOOLEAN esMayor;

    int a=30, b=20;

    esMayor = a > b;
    if (esMayor == true)
        printf("%d es mayor que %d",a ,b);

    return 0;
}

