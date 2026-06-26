Resolver con SEMÁFOROS el siguiente problema. En una planta verificadora de vehículos, existen 7 estaciones donde
se dirigen 150 vehículos para ser verificados. Cuando un vehículo llega a la planta, el coordinador de la planta le
indica a qué estación debe dirigirse. El coordinador selecciona la estación que tenga menos vehículos asignados en ese
momento. Una vez que el vehículo sabe qué estación le fue asignada, se dirige a la misma y espera a que lo llamen
para verificar. Luego de la revisión, la estación le entrega un comprobante que indica si pasó la revisión o no. Más allá
del resultado, el vehículo se retira de la planta. Nota: maximizar la concurrencia.
int cant_estaciones[7]= ({0} 7)
int estaciones_asignadas[150];

sem mutex_estaciones=1; mutex_coordinador=1;
sem mutex_atender_coord=0;
sem mutex_espera_estacion[150]=([150] 0)
sem mutex_verificacion[7] = ([7] 0)

cola atender;
Process vehiculo[id:0..N-1]{
    P(mutex_coordinador)
    push (atender,id);
    V(mutex_coordinador);

    V(mutex_atender_coord);
    P(mutex_espera_estacion[id]); // espero a que me asignen una estacion;
    idestacion=estacion_asignada[id];
    
    P(mutex_estacion[idestacion]);
    push(estacion[idestacion]);
    V(mutex_estacion[idestacion]);
    // avisa para ser atendido
    V(mutex_atender_estacion[idestacion]);
    
    P(mutex_espera_res[id]);

    P(mutex_cont_estaciones);
    cant_estaciones[idestacion]--;
    V(mutex_cont_estaciones);
}

process Coordinador{
    int min_estacion, id;
    while (true){
        P(mutex_atender_coord);
        
        P(mutex_coordinador)
        id=pop(atender);
        V(mutex_coordinador);

        P(mutex_cont_estaciones);
        idmin=min(cant_estaciones);
        cant_estaciones[idmin]++; //incremento por el que viene
        V(mutex_cont_estaciones);

        estacion_asignada[id] = idmin;
        V(mutex_espera_estacion[id]);
    }
}
process estacion[id:0.. E-1]{
    int idV;
    while(true){
        P(mutex_atender_estacion);

        P(mutex_estacion[id]);
        idV=estacion[id];
        V(mutex_estacion[id]);

        resultado [idV]=comprobante();
        V(mutex_espera_res[idV]);
    }
}