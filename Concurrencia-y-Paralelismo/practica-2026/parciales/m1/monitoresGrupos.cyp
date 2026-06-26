process Vendedor[id:0..N-1]{
    int idE=miEquipo();
    int cant=0,total;
    Equipo[idE].llego();
    cant=venderejemplares();
    Equipo[idE].juntar(cant,total);
}

MONITOR EQUIPO[id:0..4]{
    int esperando=0;
    cond barrera; int totalv=0;

    procedure llego(){
        esperando++;
        if(esperando<4){
            wait(barrera)
        }else{
            signal_all(barrera);
            esperando=0;
        }
    }

    procedure junta(cant in int, total out int){
        esperando++;
        totalv+= cant
        if (esperando<4){
            wait(barrera)
        }else{
            signal_all(barrera)
        }
        total=totalv;
    }
}