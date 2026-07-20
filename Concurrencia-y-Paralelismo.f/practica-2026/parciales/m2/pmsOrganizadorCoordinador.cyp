Process Organizador {
    int idC; text desafio
    for i in 0..N-1 {
        desafio= darDesafio();
        Competidor[*]?pedirDesafio(idC);
        Competidor[idC]!recibirDesafio(desafio);
    }
}

Process Competidor[id:0..N-1]{
    text desafio; bool ok;
    Organizador!pedirDesafio(id);
    Organizador? recibirDesafio(desafio);
    ok=false;
    while(not ok){
        resolver(desafio);
        Coordinador!enviarDesafio(desafio,id);
        Supervisor[*]?recibirCorrecion(ok);
    }
}
Process Coordinador{
    cola pedidos;
    int idC, idS, text desafio;

    do
        Competidor[*]?enviarDesafio(idC,desafio) --> push(pedidos,idC,desafio);

        [] not empty(pedidos);Supervisor[*]?haypedido(idS) --> pop(pedidos,idC,desafio); Supervisor[idS]!darPedido(idC,pedido);
    od

}

Process Supervisor[id:0..S-1]{
    int idC, text desafio, bool ok;
    while (true){
        Coordinador!haypedido(id);
        Coordinador?darPedido(idC,desafio);
        ok=corregir(desafio);
        Competidor[idC]!recibirCorrecion(ok);
    }
}