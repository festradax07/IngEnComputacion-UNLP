/* Tipos de datos nuevos */
#include <stdio.h>
int main()
{   short int a,b,c; /* Entero de -32768 a 32767 sin punto decimal */
    char x,y,z; /* de -128 a 127 sin punto decimal */
    float numero, gato, casa; /* de 3.4E-38 a 3.4E+38 con punto decimal */

    a = b = c = -27;
    x = y = z = 'A';
    numero = gato = casa = 3.6792;
    a = y; /* a es ahora 65 (caracter A) */
    x = b; /* x es ahora -27 */
    numero = b; /* num será -27.00 */
    a = gato;  /* a tomará el valor de 3 */

    return 0;
    /* Este programa no muestra nada , :-) */
}
