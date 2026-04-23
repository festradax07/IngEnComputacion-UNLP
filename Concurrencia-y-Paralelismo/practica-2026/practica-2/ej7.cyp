sem mutex = 1; 
sem barrera = 0;
int llegaron = 0;

int botellas = 20;
sem aviso_repositor = 0;
sem reposicion_lista = 0;

sem pedidos = 0;
sem turno[C] = ([C] 0);
sem proceso_terminado = 0;
Cola fila;

process Corredor[id: 0..C-1] {
    // --- Barrera ---
    P(mutex);
    llegaron++;
    if (llegaron == C) {
        for i = 1..C -> V(barrera);
    }
    V(mutex);
    P(barrera);

    correrMaraton();

    
    P(mutex);
    fila.push(id);
    V(mutex);
    V(pedidos); 

    P(turno[id]); // El proceso expendedora me da permiso de pasar a la máquina

    
    // garantiza que solo UN corredor tenga su semáforo 'turno' en 1.
    
    if (botellas == 0) {
        V(aviso_repositor);
        P(reposicion_lista); // Espero al repositor
    }
    
    botellas--;
    
    V(proceso_terminado); // Le aviso a la expendedora que solté la máquina
}

process Expendedora {
    int id_prox;
    while(true) {
        P(pedidos);        // Espero que alguien llegue a la fila
        P(mutex);
        id_prox = fila.pop();
        V(mutex);

        V(turno[id_prox]);  // Habilito al corredor
        P(proceso_terminado); // Bloqueo la expendedora hasta que el corredor termine
    }
}

process Repositor {
    while(true) {
        P(aviso_repositor);
        // No necesita mutex porque el corredor que lo llamó está bloqueado
       
        botellas = 20;
        V(reposicion_lista);
    }
}
