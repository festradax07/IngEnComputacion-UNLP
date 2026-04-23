
int disponibles[4] = ([4] 25);
int solicitud[C];
bool respuesta[C];
Cola fila_vendedor;

// Semáforos
sem mutex_vendedor = 1;
sem pedido = 0;
sem turno_atendido[C] = ([C] 0);
sem respuesta_lista[C] = ([C] 0);

sem lleno[4] = ([4] 0);    // Avisa a la combi que puede salir
sem llego_combi[4] = ([4] 0); // Avisa a los pasajeros que pueden bajar
sem bajaron_todos[4] = ([4] 0); // Avisa a la combi que ya está vacía

process Cliente[id: 0..C-1] {
    int mi_combi = elegirCombi(); 
    
    
    
    P(mutex_vendedor);
    fila_vendedor.push(id);
    solicitud[id] = mi_combi; // Ya le dejo mi pedido listo
    V(mutex_vendedor);
    V(pedido);

    // Esperar atención
    P(turno_atendido[id]);
    
    if (respuesta[id]) {
        // Subir y esperar a que la combi llegue al destino
        P(llego_combi[mi_combi]);
        
        // 4. Bajarse
        V(bajaron_todos[mi_combi]); 
    }
    // Si respuesta[id] es false, el proceso termina (se retira).
}

process Vendedor {
    int id_c, combi_id;
    while(true) {
        P(pedido);
        P(mutex_vendedor);
        id_c = fila_vendedor.pop();
        V(mutex_vendedor);

        combi_id = solicitud[id_c];

        if (disponibles[combi_id] > 0) {
            disponibles[combi_id]--;
            respuesta[id_c] = true;
            
            // Si es el pasajero 25, despacho la combi
            if (disponibles[combi_id] == 0) {
                V(lleno[combi_id]);
            }
        } else {
            respuesta[id_c] = false;
        }

        V(turno_atendido[id_c]); // Le aviso que ya decidí su suerte
    }
}

process Combi[id: 0..3] {
    while(true) {
        P(lleno[id]); // Espero a estar completa
        
        Viajar(); // Sección Crítica: El viaje en sí
        
        // Avisar a los 25 pasajeros que llegamos
        for i = 1..25 -> V(llego_combi[id]);
        
        // Esperar a que los 25 bajen para reiniciar el ciclo
        for i = 1..25 -> P(bajaron_todos[id]);
        
        // IMPORTANTE: Resetear la combi para el próximo grupo
        disponibles[id] = 25; 
        
    }
}
