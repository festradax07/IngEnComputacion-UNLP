. Resolver con SEMÁFOROS el siguiente problema. En un restorán trabajan C cocineros y M mozos. De
forma repetida, los cocineros preparan un plato y lo dejan listo en la bandeja de platos terminados, mientras
que los mozos toman los platos de esta bandeja para repartirlos entre los comensales. Tanto los cocineros
como los mozos trabajan de a un plato por vez. Modele el funcionamiento del restorán considerando que la
bandeja de platos listos puede almacenar hasta P platos. No es necesario modelar a los comensales ni que
los procesos terminen.

Platos bandeja[P];
int poslibre=0; int posocupada=0;
sem Mutexbandeja=P; sem hayplato=0;
sem mutexC=1; mutexM=1;

process Cocinero[id:0..C-1]{
    while (true){
        
        Plato plato=hacerPlato();

        P(mutexbandeja)// espera a que la bandeja no este llena
            P(mutexC); // SC para la insercion de mis cocineros
                bandeja[poslibre]=plato;
                poslibre = (poslibre+1) mod P
            V(mutexC);
        V(hayplato); // aviso al mozo que hay una comida nueva
    }
}
process Mozo[id:0..M-1]{
    Plato plat;
    while(true){
        P(hayplato); // espero a que avisen que hay un plato disponible;
            P(mutexM); //SC para agarrar de la bandeja uno por vez
                plat=bandeja[posocupada];
                posocupada= (posOcupada +1) mod P;
            V(mutexM);
        V(mutexbandeja) // permito que habiliten nuevamente esto
    }

}