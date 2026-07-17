chan atender(int); // idE
chan respuesta[C](text) // 
chan pedido(int,text) // id pedido
chan darVendedor[v](idp,text) //

Process Cliente[id: 0..C-1]{
    text rta, pedido; // se asume cargado pedido
    send pedido(id, pedido);
    receive respuesta[id](rta);
}

Process Admin{
    
    while (true){

        receive atender(idV); // primero debo sincronizar con el atender del consumidor
        if (not empty(pedido)){
                receive pedido(idP,pedido);
        }else{
            idp=-1, pedido=´´;
        }
        send darVendedor[idV](idP,pedido);

    }
}
Process Vendedor[id:0..V-1]{

    while (true){
        send atender(id);
        receive darVendedor[id](idP,pedido);
        if(idp !=-1){
            atenderCliente(pedido,res);
            send respuesta[idP](res);
        }else{
            delay(random(2,4));
        }
    }
}