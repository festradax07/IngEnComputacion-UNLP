2. Se desea modelar el funcionamiento de un banco en el cual existen 5 cajas para realizar
pagos. Existen P clientes que desean hacer un pago. Para esto, cada una selecciona la caja
donde hay menos personas esperando; una vez seleccionada, espera a ser atendido. En cada
caja, los clientes son atendidos por orden de llegada por los cajeros. Luego del pago, se les
entrega un comprobante. Nota: maximizando la concurrencia.\


P clientes 5 cajas, cada cliente slecciona la caja donde hay menos personas esperando, una vez hecho, espera a ser atendido. en cada caja, los clientes son atendidos por orden de llagada por los cajeros. Luego del pago, se les entrega comprobante.
5 canales de cajas, minimo le manda al canal correspondiente. hay que darle un comprobante al final, de manera individual. canal privado entre cajas y cliente.

chan colas[5](id);
chan comprobantes[P](texto);

Process cliente[id:0..P-1]{
//llego
texto comp;
send colas[(minimo())](id); // se asume un modulo minimo que permita saber cual de las 5 cajas tiene menos clientes en la cola
receive comprobantes[id](comp);
}

Process cajero[id:0..4]{

texto comp; int idC;
while (true){
receive colas[id](idC);
comp=atender(idC);
send comprobantes[idC](comp);
}

}
