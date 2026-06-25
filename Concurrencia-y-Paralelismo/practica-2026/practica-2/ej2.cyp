a)
sem espacios_libres = N; // Capacidad máxima
sem preparado = 0;       // Paquetes listos
sem mut_contenedor = 1;

process Preparador {
    while(true) {
        prepararPaquete(p); 
        P(espacios_libres); // ESPERA si no hay lugar en la sala
        P(mut_contenedor);
            push(sala, p);
        V(mut_contenedor);
        V(preparado);       // AVISA que hay un paquete listo
    }
}

process Entregador {
    while(true) {
        P(preparado);       // ESPERA si no hay paquetes
        P(mut_contenedor);
            p = pop(sala);
        V(mut_contenedor);
        V(espacios_libres); // AVISA que ahora hay un lugar vacío
        entregar(p);
    }
}

-------------------------


