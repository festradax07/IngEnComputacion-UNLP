procesos consultores, 5 consultas disponibles base de datos.

process consultores[0..N-1]{
base.consultar();
hacerconsulta();
base.liberar();
}


Monitor Base{
cond esperar;
int cantdisp=5;
INT esperando=0;
procedure consultar(){

if(cantdisp==0){esperando++;
		wait(esperar);
}
cantdisp--;
}

procedure Liberar(){
if (esperando>0){ esperando--;
		signal(esperar);

}
else cantlibres++;
}
}
