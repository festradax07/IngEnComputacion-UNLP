chan señal();
chan atencion[P] (recibos,dinero);
chan pagarEmb(int,boletas,dinero);
chan pagarMenosde5(int, Boletas, Dinero);
chan pagarGeneral(int, boletas,Dinero);

Process Persona[id:0..P-1]{
    Boletas bol;
    Recibos rec;
    Dinero pago,vuelto;
    if (soyembAnc()){
        send pagarEmb(id,bol,pago);
    }else{
        if(len(bol))<5) then
            send pagarMenosde5(id,bol,pago)
        else  
            send pagarGeneral(id, bol, pago);
    }
    send señal();
    receive atencion[id] (rec,vuelto);
}
Process Caja{
    boletas bol;
    recibos rec;
    while true{
        receive señal();
        if (not empty(pagarEmb)) -->receive pagarEmb(idP,bol,pago);
        [] (empty(pagarEmb)) && (not empty(pagarMenosde5)) --> receive pagarMenosde5(idP,bol,pago);
        [] (empty(pagarEmb)) && (empty(pagarMenosde5)) && not empty(pagarGeneral) --> receive pagarGeneral(idP,bol,pago);
        fi;
        -- atiendo
        cobrar(bol,pago,rec,vuelto);
        send atencion[idP](rec,vuelto);
    }
}