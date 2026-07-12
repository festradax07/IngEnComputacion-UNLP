package tp3.ej4;
import java.util.List;

import tp3.ej1.*;
public class AnalizadorArbol {
	public int devolverMaximoPromedio(GeneralTree<AreaEmpresa> Arbol) {
		// utilizo un recorrido por nivel bfs porque el necesario devolver un dato maximo 
		// ligado a valores mediante niveles
		Queue<GeneralTree<AreaEmpresa>> cola = new Queue<GeneralTree<AreaEmpresa>>();
		List<GeneralTree<AreaEmpresa>> children; // variable auxiliar para lista de hijos
		GeneralTree<AreaEmpresa> aux; // variable auxiliar
		int MaxPromedio=0 ,promedioNivel = 0, totalNodos=0, totalTardanza=0;
		cola.enqueue(Arbol); // recibe nodo
		cola.enqueue(null); // diferencial el cambio de nivel de 0 a 1 en cola
		while( !cola.isEmpty()) {
			aux = cola.dequeue();
			if( aux != null) {
				totalNodos++;
				totalTardanza += aux.getData().getTardanza();
				children = aux.getChildren();
				for(GeneralTree<AreaEmpresa> child: children) {
					cola.enqueue(child);
				}
			}else {
				promedioNivel = totalTardanza/totalNodos;
				if( MaxPromedio < promedioNivel) MaxPromedio = promedioNivel;
				totalNodos= 0; totalTardanza = 0;
				if( !cola.isEmpty()) {
					cola.enqueue(null); // cambio de nivel
				}
			}
		}
		return MaxPromedio;
	}
}
