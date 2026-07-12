#include <stdio.h>
struct LEDStatus {
    unsigned char LED1 : 1; // 1 bit para el LED1
    unsigned char LED2 : 1; // 1 bit para el LED2
    unsigned char LED3 : 1; // 1 bit para el LED3
    unsigned char LED4 : 1; // 1 bit para el LED4
    unsigned char : 4;      // relleno, 4 bits no utilizados
};
void verBits(unsigned);
int main(){
    struct LEDStatus status;

    status.LED1 = 1;
    status.LED2 = 0;
    status.LED3 = 1;
    status.LED4 = 1;

    unsigned char byte = *(unsigned char*)&status;
    printf("Estado del LED: 0x%x\n", byte); // salida: Estado del LED: 0x1101
    verBits(byte);

    status.LED2 = 1;
    byte = *(unsigned char*)&status;
    printf("Estado del LED: 0x%x\n", byte); // salida: Estado del LED: 0x1111
    verBits(byte);

    return 0;
}
void verBits(unsigned valor){
  unsigned int mascara = 1<<31;
  int i;

  printf("%10u = ", valor);
/*
  for (i=1; i<=32; i++){
    putchar(valor & mascara ? '1' : '0');
    valor = valor <<1;
    if (i % 8 == 0)
        printf(" ");
  }

*/
  i=1;
  while (mascara > 0){
    printf("%c",valor & mascara ? '1' : '0');
    mascara = mascara >> 1;

    if (i++ % 8 == 0)
        printf(" ");
  }
   printf("\n");
}

