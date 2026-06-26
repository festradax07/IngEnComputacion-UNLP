process Worker(id=0..6){
    P(mutexTrx)
        while(not empty(trxs)) do {
            t=pop(trxs);
            V(mutexTrx);
            res_val= validar(t);
            P(mutex_cont[res_val]);
            contador[res_val]++;
            V(mutex_cont[res_val]);
            P(mutexTrx);
        }
    V(mutexTrx);
    P(nutex_barrera);
    cant=cant+1;
    if (cant<7) {
        V(mutex+nutex_barrera);
        P(mutex_esperar);
    }else{
        for i in 0..9 do 
            print(i,contadores{i})
        fir i in 0..5 do begin
            V(mutex_esperar) // despuierto a los otros;
        V(mutex_barrera); // continuamos
    }
}