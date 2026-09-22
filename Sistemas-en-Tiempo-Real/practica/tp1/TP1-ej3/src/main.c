#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

const uint8_t tabla_7seg[16] = {
    0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
    0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
};
// Tabla de conversión: índice = utiliza la devolucion de valor hexadecimal (0-F),
// valor = patrón destinada al display

void mostrar_digito(uint8_t patron, uint8_t pin_LE)
{
    PORTB = patron;             //fija el patrón en el bus
    PORTC |= (1 << pin_LE);     // sube LE -> 74LS373 en modo "transparente", copia el bus
    _delay_us(5);                // seteo tiempo para que el latch termine de copiar
    PORTC &= ~(1 << pin_LE);    // baja LE -> 74LS373 "retiene" (memoriza) ese valor
}

uint16_t ADC_leer(void)
{
    ADCSRA |= (1 << ADSC);               // ADCSRA.ADSC = 1 -> inicio la conversión
    while (!(ADCSRA & (1 << ADIF)));     // waiting sobre ADCSRA.ADIF (bit 4), esperando la finalizacion
    ADCSRA |= (1 << ADIF);               // limpio con un 1
    return ADC;                          // ADCH:ADCL combinados, 10 bits
}
void setear_regs(void){
    DDRB = 0xFF;                          // PORTB entero como salida (bus de datos)
    DDRC |= (1 << PC1) | (1 << PC2);      // PC1, PC2 como salida (LE de U4 y U3)
    DDRC &= ~(1 << PC0);                  // PC0 seteado como entrada (para el ADC)

    ADMUX  = (1 << REFS0);                // Vref=AVCC, canal ADC0
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);  // ADC on, prescaler 128
}

int main(void)
{
    setear_regs();

    while (1)
    {
        uint16_t valor  = ADC_leer();            // 0x000-0x3FF, según Vin del potenciómetro
        uint8_t d_bajo  = (valor >> 0) & 0x0F;    // nibble LS
        uint8_t d_alto  = (valor >> 4) & 0x0F;    // nibble MS

        mostrar_digito(tabla_7seg[d_bajo], PC1);  // -> U4 -> display0,1
        mostrar_digito(tabla_7seg[d_alto], PC2);  // -> U3 -> display2,3
    }
}