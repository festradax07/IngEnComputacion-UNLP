Process proceso [id: 0..19]{
    int prioridad= obtenerPrioridad() menor valor mayor prioridad (niceness)
    while(true){
        resultados= procesar();
        ES.Pedir(id,prioridad);
        guardar(res);
        ES.Liberar();
    }
}

MONITOR ES{
    int esperando=0;
    bool libre=true;
    cond espera[20];
    cola espera;

    procedure pedir(id in int, prioridad in int){
        if (not libre){
            esperando++;
            push(espera,id,prioridad);
            wait (espera[id]);
        }else{
            libre=false;
        }
    }
    procedure liberar(){
        if (esperando>0){
            esperando--;
            idp=pop(espera);
            signal(espera[idp]);
        }else{
            libre=true;
        }
    }
}