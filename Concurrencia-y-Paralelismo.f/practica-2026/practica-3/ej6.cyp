
process Personas[id:0..19]{
    int idG= darEquipo();
    int total,montoind=0;
    Grupo[idG].llegar();
    -- juntar 15 monedas
    int montoind=describirMonedas(monedas);
    Grupo[idG].depositar(montoind,total);
}

Monitor Grupo[id:0..4]{
    cond espera;
    int total,esperando,esperando_fin=0;
    procedure  llegar(){
        esperando++;
        if (esperando<4) wait(espera);
        else signal_all(espera);
    }
    procedure depositar(monto in int; totalG out int){
        total=total + monto;
        esperando_fin++;
        if (esperando_fin<4) wait (espera);
        else signal_all(espera)
        totalG=total;
    }
}