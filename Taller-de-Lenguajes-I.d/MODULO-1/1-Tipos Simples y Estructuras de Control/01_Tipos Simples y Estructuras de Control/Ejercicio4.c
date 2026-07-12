#include <stdio.h>
int main()
{   float monto;

    printf("ingrese el monto "
           "de su factura : ");
    scanf("%f", &monto);

    if (monto < 300)
         printf("Gracias por su compra.");
    else
         printf("Ud. ha ganado "
                "un ticket de descuento!");

    return 0;
}