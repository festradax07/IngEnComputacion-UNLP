package tp3.ejsparciales;
import java.util.LinkedList;
import java.util.List;

import tp3.ej1.*;
public class Parcial {
	
	//ej9
	public static boolean esDeSeleccion(GeneralTree <Integer> arbol) {
		if( arbol == null || arbol.isLeaf()) { // si esta vacio, cumple y si es una hoja tambien!
			return true;
		}
		int valor = arbol.getData();
		int min= Integer.MAX_VALUE; // set valor 9999
		for(GeneralTree<Integer> child: arbol.getChildren()) {
			if(child.getData() < min) {
				min = child.getData(); // busco el nodo minimo de la lista de hijos
			}
			if(!esDeSeleccion(child)) { // verifico que todos los nodos cumplan, caso contrario, todo el arbol no cumple
				return false;
			}
		}
		return valor == min;
	}
	//ej10
	public static List<Integer> resolver(GeneralTree<Integer>arbol){
		if(arbol== null) {
			return null;
		}
		List<Integer> historial = new LinkedList<Integer>();
		List<Integer> camino = new LinkedList<Integer>();
		BuscarCaminoMaximo(arbol,0,0,historial,camino,Integer.MIN_VALUE);
		return camino;
	}
	private static int BuscarCaminoMaximo(GeneralTree<Integer> a, int level,int suma, List<Integer> historial, List<Integer> camino,int sumaMax) {
		// la primera vez level 0
		if(a.isEmpty() || a == null)
			return sumaMax;
			suma += a.getData()*level; // do
			if(a.getData().equals(1)) {
				historial.add(a.getData());
			}
			if(a.isLeaf()) {
				if(sumaMax < suma) {
					sumaMax= suma;
				
				camino.clear();
				camino.addAll(historial);
				}
		   }
		for(GeneralTree<Integer> child: a.getChildren()) {
			sumaMax = BuscarCaminoMaximo(child,level +1, suma, historial, camino,sumaMax);
			
		}
		if(!a.getData().equals(1)) {
			historial.remove(historial.size()-1); // mantiene linealidad del backtracking de la recursion
		}
	 return sumaMax;
	}
	
	
	
	//ej11
	public static boolean ejercicio11(GeneralTree<Integer> arbol) {
		int sumxnivel = 0, expectedsum=1; boolean status = true;
		GeneralTree<Integer> aux;
		Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		cola.enqueue(arbol);
		cola.enqueue(null);
		while(!cola.isEmpty() && status) {
			aux = cola.dequeue();
			if(aux != null) {
				sumxnivel++;
				for(GeneralTree<Integer> child: aux.getChildren()) {
					cola.enqueue(child);
				}
			}else {
				status =  sumxnivel == expectedsum;
				if(status) {
					expectedsum++;
					sumxnivel=0;
				}
				if(!cola.isEmpty()) { // si no recorri todos los niveles
					cola.enqueue(null); // encolo un null para el cambio de nivel 
				}
			}
			
		}
	 return status;
	}
}
