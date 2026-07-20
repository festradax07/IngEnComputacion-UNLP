process Estudiante[id:0..E-1]{
    MICROONDAS.pedir();
    calentarComida();
    MICROONDAS.liberar();
}

MONITOR MICROONDAS{
    bool libre=true;
    cond espera;
    int esperando=0;
    procedure pedir(){
        if (not libre){
            esperando++;
            wait(espera);
        }else{
            libre=false;
        }
    }

    procedure liberar(){
        if (esperando>0){
            esperando--;
            signal(espera);
        }else{
            libre=true
        }
    }
}