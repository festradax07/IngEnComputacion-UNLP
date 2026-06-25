N clientes --> empleado 

process Cliente [id:0..N-1]{
    text listaprod;
    Gestion.llegar(listaprod,id,comp);
}
process Empleado{

    for i in 1..N do{
        Gestion.atender(idc,pedido);
        hacerComprobante(pedido);
        Gestion.liberar(comp,idc);
    }
}

Monitor Gestion{
    cond espera[N];
    text lista_act; text comprobante[N];
    cola cliente;
    procedure Llegar(listarprd:in text, id: in int, compr out text){
        push (cliente,(id,lista));
        signal(pedido);
        wait(espera[id]);
        compr=comprobante[id];
    }
                 
    procedure atender(idc out int, lista_act out text){
        while (empty (cliente)){
            wait(pedido);
        }
        pop(cliente,idC,lista_act);
   
    }
    procedure liberar(comp, idC){
        comprobante[idC]=comp;
        signal(esperar[idC]);
    }


}