chan atender;
chan imprimedir;
chan imprimeadministrativo;
chan impresoras(int);
chan copias[3];

process Director{
    while(true){
        --trabaja
        send imprimedir(doc);
        send atender(1);
    }
}
process administrativo[id:0..N-1]{
    while(true){
        --trabaja
        send imprimeadministrativo(doc);
        send atender;
    }
}

process Coordinador{
    while(true){
        receive impresoras(idImp);
        receive atender(valor);
        if (!empty(imprimedir)){
            receive imprimedir(doc);
        }else{
            receive imprimeadministrativo(doc);
        }
        send copias[idImp](doc);
    }
}

process Impresora[id:0..2]{
    while(true){
        send impresoras(id);
        receive copias[id](doc);
        imprimir(doc);
    }
}