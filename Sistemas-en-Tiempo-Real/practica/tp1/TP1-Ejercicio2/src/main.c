#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

void GPIO_Init(void){
	DDRD &= ~((1 << PORTD2) | (1 << PORTD3));// Entradas: PD2 y PD3 
	PORTD |= (1 << PORTD2) | (1 << PORTD3);// Resistencias Pull-Up 

	DDRB |= (1 << PORTB0) | (1 << PORTB1); // Salidas: PB0 y PB1 
	PORTB |= (1 << PORTB0) | (1 << PORTB1);// Estado inicial: ambos LEDs encendidos
}

void TIMER0_init(void){
	TCCR0A |= (1 << WGM01); // Modo CTC
	TCCR0B |= (1 << CS01) | (1 << CS00); // Prescaler 64
	OCR0A = 249; // Valor de comparación cada 1ms
	TIMSK0 |= (1 << OCIE0A); // Habilitar interrupción por comparación
}

volatile uint8_t parpadeo = 0;
ISR(TIMER0_COMPA_vect){
	static uint16_t contador = 0;

	if (parpadeo){
		if (++contador >= 250){
			contador = 0;
			PORTB ^= (1 << PORTB0) | (1 << PORTB1);
		}
	}
}

int main(void){
	GPIO_Init();
	TIMER0_init();
	sei();

	while (1){
		if (!parpadeo){
			if (!(PIND & (1 << PORTD2)) || !(PIND & (1 << PORTD3))){
				PORTB &= ~(1 << PORTB1);
				parpadeo = 1;
			}
		}

	}
	return 0;
}



