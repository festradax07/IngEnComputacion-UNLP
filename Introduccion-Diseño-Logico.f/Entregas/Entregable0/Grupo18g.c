#include <stdio.h>
#include <stdint.h>

int main() {
    int16_t q7_8;
    printf("Ingrese número Q(7,8) en hexadecimal (ej: 80C0): 0x");
    scanf("%hx", (unsigned short*)&q7_8);

    // Parte entera: hacer shift aritmético (preserva el signo)
    int16_t parte_entera = q7_8 >> 8;

    // Parte fraccionaria cruda (los bits bajos, sin signo)
    uint8_t parte_frac_bits = q7_8 & 0xFF;

    // Si el número es negativo y tiene fracción, hay que corregir
    int negativo = (q7_8 < 0);
    int parte_frac;

    if (negativo) {
        // Si es negativo, la parte fraccional está en complemento a dos también.
        // Para obtener el valor decimal correcto, hay que hacer:
        // - ajustar la parte entera (ya es -N-1)
        // - invertir la fracción (10000 - fracción)
        parte_frac = ((256 - parte_frac_bits) * 10000) / 256;

        // Si la fracción es exactamente 0, no se invierte
        if (parte_frac_bits == 0) {
            parte_frac = 0;
        } else {
            parte_entera += 1;  // porque estaba redondeada hacia abajo
        }
    } else {
        parte_frac = (parte_frac_bits * 10000) / 256;
    }

    printf("Número decimal: %d.%04d\n", parte_entera, parte_frac);
    return 0;
}
