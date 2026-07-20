
int cantpersonas=0;
Process Empleado[id:0..N-1]{
    int mi_grupo;

    P(llego);
    mi_grupo=dargrupo()
    cantpersonas++;
    if (cantPersonas< 5){
        V(llego)
        P(mutex_espero[mi_grupo]); \\ espero al resto
    }else{
        for i in 0..3 do {
            V(mutex_espero[mi_grupo])
        }
        cantPersonas=0; // reseteo para siguiente mi_grupo
        grupos++; // cantidad de grupos creados;
        V(llego)
    }

    hacemueble()

    P(mutex_muebles[mi_grupo]);
        while(muebles[mi_grupo]< M){
            muebles[mi_grupo]++;
            V(mutex_muebles[mi_grupo]);
            hacermueble()
            sleep(rand()); // no tardan lo mismo
            P(mutex_muebles[mi_grupo]);
        }
    V(mutex_muebles[mi_grupo])

}