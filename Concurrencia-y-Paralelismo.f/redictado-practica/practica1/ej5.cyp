int vector[1000]= (elementos);
int total=0;
int terminaron=0;
process buscador[id:0..9]{
	int saltos=100;
	int total_buscador:=0;
	double res;
	int pos_inicio:=id*saltos;
	for i=pos_inicio ... (pos_inicio + saltos-1) {

		total_buscador:=total_buscador + vector[i];
	}
	<total= total + total_buscador>;
	terminaron++;
	<await (terminaron == 10)>
	res=total/1000; // consultar cuando agregar dentro y cuando no.
}
