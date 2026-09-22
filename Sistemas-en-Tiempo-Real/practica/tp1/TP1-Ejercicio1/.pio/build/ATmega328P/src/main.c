#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>

void GPIO_Init(void){
	DDRD &= ~((1 << PORTD2) | (1 << PORTD3));// Entradas: PD2 y PD3 
	PORTD |= (1 << PORTD2) | (1 << PORTD3);// Resistencias Pull-Up 

	DDRB |= (1 << PORTB0) | (1 << PORTB1); // Salidas: PB0 y PB1 
	PORTB |= (1 << PORTB0) | (1 << PORTB1);// Estado inicial: ambos LEDs encendidos
}

int main(void){
	GPIO_Init();
	uint8_t parpadeo = 0;

	while (1){
		if (!parpadeo){
			if (!(PIND & (1 << PORTD2)) || !(PIND & (1 << PORTD3))){
				parpadeo = 1;
				PORTB &= ~(1 << PORTB1);
			}
		}
		else{
			_delay_ms(250);
			PORTB ^= (1 << PORTB0) | (1 << PORTB1);
		}
	}
	return 0;
}



