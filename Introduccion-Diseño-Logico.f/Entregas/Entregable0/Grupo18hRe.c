#include <stdio.h>
#include <stdint.h>

/* ---------- estructuras de datos ---------- */
typedef struct { char  entera;    unsigned frac; } PuntoFijo;   // Q7.8
typedef struct { int32_t entera;  unsigned frac; } PuntoFijo32; // Q16.15

/* ---------- Prototipos  de funciones (preprocesador)---------- */
static uint16_t toQ7_8 (int ent, int frac);
static int32_t  toQ16_15(int ent, int frac);
static int16_t  toQ0_15 (int frac4);

static PuntoFijo   fromQ7_8  (int16_t q);
static PuntoFijo32 fromQ16_15(int32_t q);

/* ---------- programa principal ---------- */
int main(void)
{
    int ent, frac;     // entradas parte entera y fracc. (0‑9999)    
    int16_t m_q15;     // variable de m en Q0.15 (se debe ajustar)

    /* --------- Lectura de m  --------- */
    printf("Ingrese la parte fraccionaria m (como -9999 = -0.9999): ");
    if (scanf("%d", &frac) != 1 || frac < -9999 || frac > 9999) {
        puts("Entrada invalida para m.");
        return 1;
    }
    m_q15 = toQ0_15(frac);   // solo fracción → Q0.15 (signo incluido)

    /* --------- Lectura de b  --------- */
    printf("Ingrese el numero b (+/- eee.ffff): ");
    if (scanf("%d.%d", &ent, &frac) != 2 || ent < -128 || ent > 127 || frac < 0 || frac > 9999) {
        puts("Entrada invalida para b.");
        return 1;
    }
    uint16_t b_q7_8 = toQ7_8(ent, frac);
    printf("b en punto fijo (Q7.8): 0x%04X\n", b_q7_8);
    PuntoFijo pf_b = fromQ7_8(b_q7_8);
    printf("b = %hhd.%04u\n", pf_b.entera, pf_b.frac);

    /* --------- Lectura de x  --------- */
    printf("Ingrese X en formato eeee.ffff: ");
    if (scanf("%d.%d", &ent, &frac) != 2 || ent < -32768 || ent > 32767 || frac < 0 || frac > 9999) {
        puts("Entrada invalida para X.");
        return 1;
    }
    int32_t x_q16_15 = toQ16_15(ent, frac);
    printf("x en punto fijo (Q16.15): 0x%08X\n", (uint32_t)x_q16_15);
    PuntoFijo32 pf_x = fromQ16_15(x_q16_15);
    printf("x = %d.%04u\n", pf_x.entera, pf_x.frac);

    /* --------- Calculo de  y = m·x + b  --------- */
    /* m está en Q0.15, x en Q16.15 → producto en Q16.30.  
       >>15 normaliza a Q16.15                                     */
    int32_t prod = ((int64_t)x_q16_15 * (int64_t)m_q15) >> 15;

    /* b está en Q7.8.  Para sumarlo a Q16.15 multiplicamos por 2^7
       (equivalente a desplazar 7 bits, con extensión de signo)     */
    int32_t b_q16_15 = ((int16_t)b_q7_8) << 7;

    int32_t y_q16_15 = prod + b_q16_15;

    printf("y en punto fijo (Q16.15): 0x%08X\n", (uint32_t)y_q16_15);

    PuntoFijo32 pf_y = fromQ16_15(y_q16_15);
    printf("y = %d.%04u\n", pf_y.entera, pf_y.frac);

    return 0;
}

// funciones utilizadas en el programa:

/* decimal → Q7.8  (16 bits) */
static uint16_t toQ7_8(int ent, int frac)
{
    uint16_t frac_q8 = (frac * 256 + 5000) / 10000; // redondeo
    return ((uint16_t)ent << 8) | (frac_q8 & 0xFF);
}

/* decimal → Q16.15 (32 bits) */
static int32_t toQ16_15(int ent, int frac)
{
    uint32_t frac_q15 = (frac * 32768U + 5000) / 10000; // redondeo
    return ((int32_t)ent << 15) | (int32_t)(frac_q15 & 0x7FFF);
}

/* fracción decimal (‑9999..+9999) → Q0.15 */
static int16_t toQ0_15(int frac4)
{
    return (int16_t)((int32_t)frac4 * 32768 / 10000);
}

/* Q7.8 → decimal */
static PuntoFijo fromQ7_8(int16_t q)
{
    PuntoFijo r;
    r.entera = (q >> 8);
    r.frac   = ((q & 0xFF) * 10000 + 128) / 256;
    return r;
}

/* Q16.15 → decimal */
static PuntoFijo32 fromQ16_15(int32_t q)
{
    PuntoFijo32 r;

    if (q >= 0) {
        r.entera = q >> 15;
        r.frac   = ((q & 0x7FFF) * 10000 + 16384) / 32768;
    } else {
        int32_t absq = -q;
        int32_t ent  = absq >> 15;
        int32_t frac = absq & 0x7FFF;

        if (frac == 0) {
            r.entera = -ent;
            r.frac   = 0;
        } else {
            r.entera = -(ent + 1);
            r.frac   = ((32768 - frac) * 10000 + 16384) / 32768;
        }
    }
    return r;
}
