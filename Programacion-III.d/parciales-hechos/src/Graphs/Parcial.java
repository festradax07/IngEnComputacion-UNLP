package Graphs;

import java.util.ArrayList;
import java.util.List;

import tp5.ej1.*;

public class Parcial {
	
	List<String> resolver(Graph<FaseCiudad> ciudades, String origen, String destino){
		List<String> ciudadesCamino = new ArrayList<>();
		if(!ciudades.isEmpty()) {
			Vertex<FaseCiudad> origin = buscarVertice(ciudades,origen);
			Vertex<FaseCiudad> destination = buscarVertice(ciudades,destino);
			if(origin!=null && destination!=null) {
				boolean marca[] = new boolean[ciudades.getSize()];
				List<String> current = new ArrayList<>();
				resolverHelper(ciudades,origin,destination,marca,ciudadesCamino, current);
			}
		}
		return ciudadesCamino;
	}
	private void resolverHelper(Graph<FaseCiudad> ciudades,Vertex<FaseCiudad> origin, Vertex<FaseCiudad> destination, boolean[] marca, List<String> ciudadesCamino, List<String> current) {
		marca[origin.getPosition()]= true; // visitado
		current.add(origin.getData().getNombre());
		if(origin == destination) {
			for(String ciudad : current) {
				if(!ciudadesCamino.contains(ciudad)) {
					ciudadesCamino.add(ciudad);
				}
			}
			marca[destination.getPosition()] = false; // desmarco para los proximos caminos; no desmarco el resto porque solo puedo pasar una vez por las mismas zonas
		}else {
			List<Edge<FaseCiudad>> ady = ciudades.getEdges(origin);
			for(Edge<FaseCiudad> e : ady) {
				if(!marca[e.getTarget().getPosition()] && e.getTarget().getData().getFase() != 1) {
					resolverHelper(ciudades,e.getTarget(),destination,marca,ciudadesCamino,current);
					// no me queda bien en claro con el enunciado como saber se bloquea los caminos, supongo que con una lista de bloqueados
				}
			}
		}
	}
	public Vertex<FaseCiudad> buscarVertice(Graph<FaseCiudad> ciudades, String nombre){
		for(Vertex<FaseCiudad> v : ciudades.getVertices()) {
			if(v.getData().getNombre().equals(nombre))return v;
		}
		return null;
	}

}
