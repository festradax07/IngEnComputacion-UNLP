3 empleados, a,b,c

process empleado A{
while(true){
Muestra m =hacerMuestra();
Admin!muestras(m);
}
}

process Admin{
cola c; Muestra m,act;
do EmpleadoA?Muestras(m) --> push(c,m)
[] not empty(c); EmpleadoB?Pedido() --> Pop(c,m); EmpleadoB!DarMuestraB(m);
od
}
process EmpleadoB{
muestra m; texto set,res;
while(true){
Admin!Pedido();
Admin?DarMuestraB(m);
set=DarSetMuestra(m);
EmpleadoC!DarSetAnalisis(m,set);
EmpleadoC?Resultados(res);
}
}

process EmpleadoC{
muestra m, texto set,res;
while (true) {
EmpleadoB?DarSetAnalisis(m,set);
res= Analizar(m,set);
EmpleadoB!Resultados(res);
}
