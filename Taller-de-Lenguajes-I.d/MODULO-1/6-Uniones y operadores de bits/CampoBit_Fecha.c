#include <stdio.h>

struct datetime {
    unsigned int second : 6;
    unsigned int minute : 6;
    unsigned int hour : 5;
    unsigned int day : 5;
    unsigned int month : 4;
    unsigned int year : 6;
};

int main() {
    struct datetime dt = {30, 25, 11, 10, 4, 23};

    printf("sizeof(struct datetime) = %d bytes\n", sizeof(struct datetime));

    printf("Fecha y hora: %d/%d/%d %d:%d:%d\n",
           dt.day, dt.month, dt.year + 2000,
           dt.hour, dt.minute, dt.second * 2);

    return 0;
}
