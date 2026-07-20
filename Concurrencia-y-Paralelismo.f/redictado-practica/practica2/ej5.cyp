// c corredores (proceso); Maquina expendedora proceso (rec compartido) con 20 botellas; repositor (proceso)
// flujo: llegan los c corredores al inicio (barrera), cuando un corredor termina la carrera se dirije a la maquina (respetar orden de llegada), saca una botella y se retira. sino hay, avisa al repositor para cargar la maquina con 20 botellas; espera a que se recargue, saca una botella  y se va.

sem mutex=1; //mutex global para el uso de la maquina, cola y acciones independientes por etapa.
//mgmt_corredor 
int contador=0;
sem barrera=0;
//mgmt_expededora;
int botellas=20;
sem mutex_corredores[C]=([C] 0);
cola fila_corredores;
sem turno=0;
//mgmt_repositor
sem esperar_repositor=0
sem aviso_repositor=0;


proceso corredor[id:0..c-1]{
P(mutex)
	contador++;
	if(contador==c){
	for i=1..C -> V(barrera) // queda responsabilidad del ultimo en llegar activar la carrera.
	}
v(mutex)
P(barrera)
correrMaraton(); // acción de correr
// espera mi turno
P(mutex)
Push(filacorredores,id);
v(mutex)
v(pedidos) // aviso que estoy encolado para laburar
P(mutex_corredor[id]) // espero a que sea mi turno, ademas protege al sistema en el momento de cambio a repositor
P(mutex) // estoy tocando a la expendedora como rec compartido
	if(botellas==0){
		V(aviso_repositor)
		V(mutex) deshabilito el mutex para darle el control al repositor
		P(esperar_repositor) // espero a que termine de insertar las 20 nuevas botellas.
		P(mutex) vuelvo
	}
	botellas--;
V(mutex)
V(turno)// me fui
}
proceso expendedora{

while(true){
int idC;
	P(pedidos)
		P(mutex)
			Pop(filacorredores,idC)
			v(mutex_corredor[idC] // le habilito el turno al corredor que toca.
		v(mutex)
		P(turno) // espero a que termine su turno, para avanzar
}
proceso repositor{

while(true){
	P(aviso_repositor) espero a que me llame un corredor
	P(mutex) espero a que me den el mgmt de la maquina
	botellas=20
	V(mutex)
	v(esperar_repositor) // aviso que terminé
}
}
