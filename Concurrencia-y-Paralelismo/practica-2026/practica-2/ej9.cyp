int cant=0; int P=random()
sem mutexCantidad=1; 
sem mutexUnidades[15]=([15] 1);
int cantUnidades[miGrupo]=([15] 0);

Process Empleado[id:0..14]{
    int miGrupo;
    P(mutexCantidad) // para asignar migrupo
    miGrupo=cant/3
    cant++;
    V(mutexCantidad)
    P(mutexUnidades[miGrupo])
        while ((GrupoUnidades[miGrupo]) < P ){
            cantUnidades[miGrupo]++;
            V(mutexUnidades[miGrupo]);
            --hacer unidad
            P(mutexUnidades[miGrupo])
        }
        V(mutexUnidades[miGrupo]);
}


