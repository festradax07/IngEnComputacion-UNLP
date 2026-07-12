#include <stdio.h>
int main () {
    int x = 1;
    float r = 1.0;

    void* vptr = &x;
   *(int *) vptr = 2;
   printf("x = %d\n", x);

   vptr = &r;
   *(float *)vptr = 1.1;
   printf("r = %1.1f\n", r);
}
