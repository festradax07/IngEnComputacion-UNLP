#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
int main (void) {
int c;
pid_t pid;
static int p=1;
printf ( " Comienzo . : \n " );
for ( c = 0 ; c < 3 ; c++ )
{
pid = fork();
if (pid==0){
	p+= 1 << c;
}
}
printf ( " P r o c e s o %d \n ",p);
return p;
}
