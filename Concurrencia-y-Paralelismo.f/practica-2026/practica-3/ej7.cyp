Consigna:
Se debe simular una maratón con C corredores donde en la llegada hay UNA máquina expendedoras de agua con capacidad para 20 botellas. Además,
existe un repositor encargado de reponer las botellas de la máquina. Cuando los C corredores han llegado al inicio comienza la carrera. Cuando un corredor
termina la carrera se dirigen a la máquina expendedora, espera su turno (respetando el orden de llegada), saca una botella y se retira. Si encuentra la
máquina sin botellas, le avisa al repositor para que cargue nuevamente la máquina con 20 botellas; espera a que se haga la recarga; saca una botella y se
retira. Nota: mientras se reponen las botellas se debe permitir que otros corredores se encolen.

Process Corredor[id:0..C-1]{
    Carrera.llegue();
    --correr
    AdminMaquina.Entrar();
    Maquina.botella();
    AdminMaquina.Salir();
}
Process Repositor{
    while(true){
        Maquina.Reponer();
    }
}

MONITOR CARRERA{
    int llegaron=0;
    cond barrera;
    procedure llegue(){
        llegaron==;
        if( llegaron <C) wait(barrera);
        else signal_all(barrera);
    }
}
MONITOR ADMINMAQUINA{
    cond espera;
    int esperando=0;
    bool libre=true;
    procedure Entrar(){
        if (not libre){ esperando++;
                        wait(espera)}
        else{
            libre=false;
        }
    }
    procedure Salir(){
        if (esperando>0){
            esperando--;
            signal(espera);
        }else{
            libre=true
        }
    }
}
MONITOR MAQUINA{
    int botellas=20
    cond noBotellas, hayBotellas;
    procedure DameBotella(){
        if (botellas==0){
            signal(noBotellas);
            wait(hayBotellas);
        }
        botellas--;
    }
    procedur reponer(){
        if (botellas > 0) wait(nobotellas);
        botellas=20;
        signal(hayBotellas);
    }
}