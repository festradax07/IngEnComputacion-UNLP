8. Realice una solución concurrente de grano grueso (utilizando <> y/o <await B; S>) el 
siguiente problema. En una playa hay 5 personas que deben juntar 15 monedas cada una y 
obtener el TOTAL de dinero juntado entre todos (la suma del valor de las 75 monedas que 
pueden ser de 1, 2 o 5 pesos). Al terminar todos los procesos deben guardarse en una variable 
local el TOTAL. Nota: maximizar la concurrencia. Suponga que existe una función Moneda() 
llamada por las personas que simula encontrar UNA moneda y retorna el valor de la misma. 
Cada persona trabaja sobre una zona diferente de la playa.
cant=0;
Total=0; // variable compartida para todos los procesos, debo protegerla en una seccion critica, no hace falta condición
proceso Persona[id:1..5]{
monedasLocal=0;totalLocal=0;
for i = 1.. 15{ 
	monedasLocal+= Moneda() // trato al total de las monedas como un acumulador
}
<Total+=monedasLocal;cant+=15>
<await cant==75;totalLocal=Total);

}
