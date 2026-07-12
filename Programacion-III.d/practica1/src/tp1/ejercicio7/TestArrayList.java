package tp1.ejercicio7;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import tp1.ejercicio3.Estudiante; // importo clase estudiante;
public class TestArrayList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List <Integer> l = new ArrayList <Integer>(); // b -> la implementacion utilizando la clase Linked List en vez de Arraylist hubiera sido igual, ya que me manejo con los metodos provenientes de la clase abstracta List, que condiciona a cada uno a implementarlos de diferente manera internamente. No afecta el funcionamiento y cumple igualmente
		for(int i=0;i<args.length;i++) {
			l.add(Integer.parseInt(args[i]));
		}
		System.out.println("LISTA -> ARRAYLIST ");
		for(int numero:l) {
			System.out.print(" | " + numero + " | ");
		}
		// otras formas de recorrer la lista!
		Iterator itl = l.iterator(); // retorna un object
		while(itl.hasNext()) {
			System.out.println(((Integer)itl.next()).intValue()); // retorno y casteo de clase Wrapper
		}
		
		// caso 2 
		Iterator <Integer> itl2 = l.iterator();
		while( itl2.hasNext()) {
			System.out.println(itl2.next().intValue()); // condiciona a ser un iterador de clase Integer.
		}
		
		List <Estudiante> le = new ArrayList <Estudiante> ();
		le.add(new Estudiante("Francisco" ,"Estrada", "MC4","franestrada@gmail.com","43 y 122"));
		le.add(new Estudiante("Giovanna" ,"Gotusso", "MC3","giogottu@gmail.com"," 6 y 18"));
		le.add(new Estudiante("Ludmila" ,"Dosil", "MC6","ludmidosil@gmail.com","503 y 11"));
		
		for(Estudiante e : le) {
			e.setComision("MC4");
		}
		
		for(Estudiante e : le) {
			System.out.println(e);
		}
		
		
		for(int numero:l) {
			System.out.print(" | " + numero + " | ");
		}
		Estudiante est = new Estudiante ("Emma", "Woida", "MC4", "emmawoida@gmail.com", "666 y 6");
		if(!le.contains(est)) {
			le.add(est);
		}
		
		
		// volvemos a la l
		System.out.println((esCapicua(new ArrayList <Integer>(l)))? "es capicua" : "NO Es capicua");
		
		// falta g h i j 
		// g - 
	}
	public static void sucesion(int n ) {
		if ( n > 0) {
		System.out.print("f(" + n + ") = ");
		if (n % 2 == 0) {
			n = n/2;
			System.out.println( n + "/2" + " = " + n);
		} else {
			n= 3*n +1 ;
			System.out.println("3 *"+ n + " + " + " 1 = " + n);
		}
		sucesion(n);
	 }
	}
	public static boolean esCapicua (ArrayList <Integer> lista) {
		boolean verif = true;
		int j= lista.size() - 1;
		int i=0;
		while(i<j){
			if(!lista.get(i++).equals(lista.get(j--))) {
				verif= false;
				break;
			}
		}
		if ((i > j) && (verif)) {
			verif= true;
		}
		return verif;
	}

}
