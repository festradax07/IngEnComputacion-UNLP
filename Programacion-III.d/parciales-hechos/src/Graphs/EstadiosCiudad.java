package Graphs;

import java.util.ArrayList;
import java.util.List;
import tp5.ej1.*;

/*
 * Un grupo de amigos ecuatorianos asistieron el domingo 20 al primer partido del mundial en la ciudad de Jor, 
 * en el cual se enfrentaron Ecuador-Qatar. 
 * 
 * Luego de disfrutar el encuentro, contrataron un auto en una agencia por una cantidad de kilometros, 
 * con el objetivo de conocer por fuera el resto de los estadios. 
 * 
 * La agencia les entregó un mapa que contiene los 8 estadios que estan distribuidos en 5 ciudades diferentes. 
 * Este mapa se puede modelizar como un grafo sin direccion, donde cada vertice representa un estadio y las aristas las rutas que los conectan. 
 * De cada estadio se conoce: nombre y el nombre de la ciudad a la que pertenece. De cada arista la cantidad de kilometros.   
 *  Se debe implementar el siguiente metodo: 
	
	List<String> estadios(Graph<???>mapa, String estadioOrigen, int cantKm)
	El cual recibe un mapa de los estadios, el nombre del estadio de la ciudad de jor, "ai bayt stadium" 
	y la cantidad de kilometros contratados. 
	El algoritmo debe retornar una lista con los nombres de los estadios que pueden recorrer como maximo en esa cantidad de kilometros. 
	Tenga presente que para la cantidad de kilometros contratados pueden existir distintos caminos posibles, 
	por lo cual debe retornar el que visite la MAYOR cantidad de estadios.
	
 */
public class EstadiosCiudad {
	List<String> estadios(Graph<Estadio>mapa, String estadioOrigen, int cantKm){
		List<String> caminoMax = new ArrayList<>();
		if(!mapa.isEmpty()) {
			Vertex<Estadio> origin = searchOrigin (mapa,estadioOrigen);
			if(origin != null && cantKm != 0) {
				List<String> current = new ArrayList<>();
				estadiosHelper(mapa,origin,new boolean[mapa.getSize()],cantKm,caminoMax,current,0,0);
			}
			
		}
		return caminoMax;
	}
	
	private int estadiosHelper(Graph<Estadio>mapa, Vertex<Estadio> origin, boolean[]marca, int cantKm, List<String> caminoMax, List<String> current, int curEstadios, int maxEstadios) {
		marca[origin.getPosition()]= true;
		current.add(origin.getData().getEstadio());
		if( maxEstadios < curEstadios) {
			maxEstadios = curEstadios;
			caminoMax.clear();
			caminoMax.addAll(current);
		}else {
			List<Edge<Estadio>> ady = mapa.getEdges(origin);
			for( Edge<Estadio> e: ady) {	
				if(!marca[e.getTarget().getPosition()] && cantKm >=  e.getWeight()) { // mayor igual, recorro y visito pero me quedo ahi
					maxEstadios = estadiosHelper(mapa,e.getTarget(),marca,cantKm - e.getWeight(), caminoMax, current, curEstadios + 1, maxEstadios);
				}
			}
			
		}
		marca[origin.getPosition()]= false; // desmarco para poder revisitarlo por otro camino si es necesario
		current.remove(current.size()-1); // saco de la lista el ultimo elemento añadido en esta llamada, para no afectar el backtracking.
		return maxEstadios;
		
	}
	private Vertex<Estadio> searchOrigin ( Graph<Estadio>mapa, String estadio){ 
		/*no puedo usar search, o hago override de estadio con un objeto distinto (Estadio equals un  String, cosa que no veo muy copada en POO) 
		 * o simplemente creo este metodo y lo busco en el grafo de acuerdo al parametro del nombre de la ciudad.
		*/
		List<Vertex<Estadio>> vertices = mapa.getVertices();
		for(Vertex<Estadio> v: vertices) {
			if(v.getData().getEstadio().equals(estadio)) {
				return v;
			}
		}
		return null;
	}
	
	// comentarios: OJO: me estoy olvidando modificadores de acceso.
}
