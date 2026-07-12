package Trees;

import java.util.ArrayList;
import java.util.List;

import tp3.ej1.GeneralTree;

/*
 * Dado un árbol general, encontrar todos los caminos desde la raíz a una hoja, tales que la cantidad de 
nodos en el camino sea un número par. Escribir el siguiente método dentro de la clase Parcial public ?? 
caminosPares(ArbolGeneral<Character> arbol)
 */
public class ArbolCaminosPares {
		public List<List<Character>> caminosPares(GeneralTree<Character> arbol){
			List<List<Character>> listaDeListas = new ArrayList<>(); // genero la lista madre.
			List<Character> actual = new ArrayList<>(); // auxiliar
			if(!arbol.isEmpty()) {
				caminosParesHelper(arbol,listaDeListas,actual);
			}
			return listaDeListas;
		}
		private void caminosParesHelper(GeneralTree<Character> arbol,List<List<Character>> lista2d, List<Character> actual ) {
			actual.add(arbol.getData()); // añado dato del nodo actual;
			if(arbol.isLeaf() && actual.size() % 2 == 0) {
				lista2d.add(new ArrayList<>(actual)); // IMPORTANTE: HACER COPIA DE OBJETO
			}else {
				for(GeneralTree<Character> child: arbol.getChildren()) {
					caminosParesHelper(child,lista2d,actual);
				}
			}
			actual.remove(actual.size()-1);
		}
}
