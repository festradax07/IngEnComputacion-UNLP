chan solicitar(int,int, text);
chan usarCabina[N] (int);
chan irse[N]();
Process Cliente[id:0..N-1]{
    int numC;
    send solicitar(id,-1,pedido);
    receive usarCabina[id](numC);
    --usarCabina
    pedido='liberar'
    send solicitar(id,numC,pedido);
    receive irse[id]();
}

Process Empleado{
    int idC, numC, idAUX;
    text pedido
    cola libres, pedidos;
    for i in 1..11 push (libres,i);
    while(true){
        receive solicitar(id,numC,op);
        if (pedido= liberar){
            send irse[idC]();
            if empty(pedidos) push(libres, numC);
            else{
                pop(pedidos,idAux);
                send usarCabina[idAux](numC);
            }
        }else if (empty(libres)) or not empty pedidos push (pedidos,idC)
        else{
            pop(libres, numC);
            send usarCabina[idC](numC);
        }
    }

}
