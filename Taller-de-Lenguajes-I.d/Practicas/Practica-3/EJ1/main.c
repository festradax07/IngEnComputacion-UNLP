#include <stdio.h>
#include <stdlib.h>
#define DIMF 10
struct rectangle{
    float base;
    float altura;
};
typedef struct rectangle rectan;
void LeerRectangulo(rectan*);
float CalcularArea(rectan);
int main()
{
    rectan rec;
    LeerRectangulo(&rec);
    printf("%.1f %.1f",rec.base, rec.altura);
    printf("%.2f", CalcularArea(rec));

    rectan r[DIMF];
    int i;
    for(i=0;i<DIMF;i++){
        LeerRectangulo((r+i));
        printf("%.1f %.1f \n", r[i].base, r[i].altura);
        printf("%.2f \n", CalcularArea(r[i]));
    }


    return 0;
}
void LeerRectangulo (rectan * rec){
    scanf("%f", &(rec->base));
    scanf("%f",&((*rec).altura));
}
float CalcularArea(rectan rec){
    return (rec.base)*(rec.altura);
}

