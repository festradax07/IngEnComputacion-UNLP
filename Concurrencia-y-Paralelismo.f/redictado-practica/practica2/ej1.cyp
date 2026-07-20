1) un sistema operativo mantiene 5 instancias de un recurso almacenadas en una cola, cuando un proceso necesita usar una instancia del recurso  la saca de la cola, la usa y cuando termina de usarla la vuelve a depositar.
int cantidad=5;
cola c = (r1,r2,r3,r4,r5);
process consumidorRecurso[0..n-1]{
Recurso r;
p(cantidad) // verifico que haya un recurso disponible, sino espera
p(mutex)
r= pop(c);
v(mutex);
// utilizo recurso fuera de la SC para maximizar concurrencia

p(mutex); // el mutex como valor binario me brinda seguridad en el uso del recurso compartido
push(C,R);
v(mutex);
v(cantidad); // devuelvo la cantidad para que la utilice otro recurso.
