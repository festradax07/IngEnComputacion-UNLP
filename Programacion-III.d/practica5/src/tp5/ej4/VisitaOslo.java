package tp5.ej4;
import tp5.ej1.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
public class VisitaOslo {
	/* cosas que condicionan si resolucion 
	 * dfs por hablar de caminos en un grafo pesado
	 * debe retornar el primer camino, por lo que no me importa el desmarcar en la matriz para el backtracking y encontrar una mejor ruta
	 * puede ser que no haya un camino entre ellos
	 * 
	 */
	public List<String> paseoEnBici(Graph<String>lugares,String destino, int maxTiempo,List<String> lugaresRestringidos){
		List<String> camino = new ArrayList<>();
		if(!lugares.isEmpty()) {
			Vertex<String> origin = lugares.search("Ayuntamiento");
			Vertex<String> destination = lugares.search(destino);
			if(origin != null && destination != null && maxTiempo != 0) {
				boolean [] marcas= new boolean[lugares.getSize()];
				restringirZonas(marcas,lugares,lugaresRestringidos);
				paseoEnBiciHelper(origin,destination,camino,marcas,lugares,maxTiempo);
			}
		}
		return camino;
	}
	
	private boolean paseoEnBiciHelper(Vertex<String> origin, Vertex<String> destination, List<String> camino, boolean[]marcas, Graph<String> lugares, int tiempo) {
		boolean exito = false;
		marcas[origin.getPosition()]= true;
		camino.add(origin.getData());
		if(origin== destination) {
			return true;
		}else {
			List<Edge<String>> edges = lugares.getEdges(origin);
			Iterator<Edge<String>>it = edges.iterator();
			while (it.hasNext() && !exito ) { // variable booleana para que en el backtracking no haya recorridos extra innecesarios.
				Edge<String> auxE= it.next();
				Vertex<String> aux= auxE.getTarget();
				if(!marcas[aux.getPosition()] && tiempo - auxE.getWeight() > 0) {
					exito = paseoEnBiciHelper(aux,destination,camino,marcas,lugares,tiempo - auxE.getWeight());
				}
			}
		}
		return exito;
	}
	private void restringirZonas(boolean[] marcas,Graph<String>grafo, List<String> restringidos) {
		for(String lugar: restringidos) {
			Vertex<String> aux = grafo.search(lugar);
			if(aux!= null) {
				marcas[aux.getPosition()]= true; // como resultado, los elementos restringidos aparecerán visitados y el dfs los ignorará
			}
		}
	}

}
