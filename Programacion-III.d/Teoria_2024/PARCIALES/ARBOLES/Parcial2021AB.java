package CodigosCualquiera.Parciales;

import tp03.ejercicio1.ArbolBinario;

public class Parcial2021AB {
	
	/*
	 * Parcial 8/5/2021. Módulo 1 primera instancia.
	 * 
	 * Implemente en la clase Parcial , el siguiente método:
			"Boolean resolver (ArbolBinariol<String> arbol)"
			Devuelve true si el árbol es degenerado con direcciones alternadas, esto es, si en lugar
			de ser una lista donde todos los hijos están en el lado izquierdo o derecho, se van alternando.
			El árbol vacío y el árbol hoja son árboles zigzag.
	 */
	
	public Boolean resolver (ArbolBinario<String> arbol) {
		if(arbol.esVacio()) return true;
		else {
			if(arbol.tieneHijoIzquierdo())
				return resolver(arbol, 1);
			else return resolver(arbol, 0);
		}
	}
	
	private Boolean resolver(ArbolBinario<String> ab, int sig) {
		if(ab.esHoja()) return true;
		else {
			boolean esDeg = false;
			if(sig == 1) {
				if(ab.tieneHijoDerecho()) return false;
				if(ab.tieneHijoIzquierdo()){
					esDeg = resolver(ab.getHijoIzquierdo(), 0); //si el sig tiene que ser derecha, mando 0
				}
			}else {
				if(ab.tieneHijoIzquierdo()) return false;
				if(ab.tieneHijoDerecho()) {
					esDeg = resolver(ab.getHijoDerecho(), 1); //si el sig tiene que ser izquierda, mando 1
				}
			}
			return esDeg;
		}
	}
	
	public static void main(String[] args) {
		
		ArbolBinario<String> ab = new ArbolBinario<String>("R");
		
		ArbolBinario<String> der = new ArbolBinario<String>("ID");
		der.agregarHijoIzquierdo(new ArbolBinario<String>("IDI"));
		//der.agregarHijoDerecho(new ArbolBinario<String>("IDD"));
		ArbolBinario<String> izq = new ArbolBinario<String>("I");
		izq.agregarHijoDerecho(der);
		//izq.agregarHijoIzquierdo(new ArbolBinario<String>("II"));
		
		ab.agregarHijoIzquierdo(izq);
		
		ab.recorridoPorNiveles();
		System.out.println("\n¿Es degenerado? " + (new Parcial2021AB().resolver(ab) ? "Si" : "No"));
	}

}
