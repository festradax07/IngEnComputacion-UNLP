#include <stdio.h>
int main()
{
  int a=1, b=2, c, d;

  c = a & b;  //0001  &  0010 = 0000
  d = 3 & b;  //0011  &  0010 = 0010

  printf("1&2 = %d \n", c);
  printf("3&2 = %d \n", d);

  c = a | b;  //0001  |  0010 = 0011
  d = 3 | b;  //0011  |  0010 = 0011

  printf("1|2 = %d \n", c);
  printf("3|2 = %d \n", d);

  c = a ^ b;  //0001  ^  0010 = 0011
  d = 3 ^ b;  //0011  ^  0010 = 0001

  printf("1^2 = %d \n", c);
  printf("3^2 = %d \n", d);

  c = (unsigned char)~b;  // 00000010 = 11111101
  printf("~2 = %d \n", c);

  a =  64;
  b = a >> 3;  //01000000 --> 00001000
  printf("64 >> 3 = %d \n", b);

  a =  1;
  b = a << 3;  //0001 --> 1000
  printf("1 << 3 = %d \n", b);

  return 0;
}
