#include <stdio.h>
#include <stdint.h>

int main() {
    int parte_entera, parte_frac;
    printf("Ingrese un número en formato entera.fraccionaria (ej: -127.2500 como -127 2500): ");
    scanf("%d %d", &parte_entera, &parte_frac);

    if (parte_frac < 0 || parte_frac > 9999) {
        printf("Fracción fuera de rango (0-9999)\n");
        return 1;
    }

    int negativo = (parte_entera < 0);
    int abs_entera = parte_entera < 0 ? -parte_entera : parte_entera;

    int32_t valor = abs_entera << 8;  // *256
    valor += (parte_frac * 256) / 10000;

    if (negativo) {
        valor = -valor;
    }

    int16_t q7_8 = (int16_t)valor;
    printf("Q(7,8) en hexadecimal (16 bits): 0x%04X\n", (uint16_t)q7_8);

    return 0;
}
