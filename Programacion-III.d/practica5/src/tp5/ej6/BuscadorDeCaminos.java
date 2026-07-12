package tp5.ej6;

import java.util.List;
import java.util.ArrayList;

import tp5.ej1.*;
public class BuscadorDeCaminos {
	private Graph<String> bosque;
	
	public BuscadorDeCaminos(Graph<String> bosque) {
		this.bosque = bosque;
	}
	public List <List<String>> recorridosMasSeguro(){
		List<List<String>> caminos = new ArrayList<>();
		if(!this.bosque.isEmpty()) {
			Vertex<String> origin = this.bosque.search("Casa de Caperucita");
			Vertex<String> destination = this.bosque.search("Casa de la Abuela");
			if(origin != null && destination != null) {
				List<String> current = new ArrayList<>();
				recorridosHelper(origin,destination,new boolean[this.bosque.getSize()],caminos,current);
			}
		}
		return caminos;
	}
	public void recorridosHelper(Vertex<String> origin, Vertex<String> destination, boolean[] marca, List<List<String>> caminos, List<String> current){
		marca[origin.getPosition()] = true; // visitado;
		current.add(origin.getData());
		if(origin == destination) {
			caminos.add(new ArrayList<>(current)); // le añado un objeto copia cuya referencia no depende de current
		
		}else {
			List<Edge<String>> edges = this.bosque.getEdges(origin);
			for(Edge<String> e : edges) {
				int j = e.getTarget().getPosition();
				if(!marca[j] && e.getWeight() < 5) {
					recorridosHelper(e.getTarget(),destination,marca,caminos,current);
				}
			}
		}
		marca[origin.getPosition()] = false; // desmarcado para visitar proximamente si es parte de otro camino;
		current.remove(current.size()-1); // remueve el elemento recien visitado y añadido.
	}

}
