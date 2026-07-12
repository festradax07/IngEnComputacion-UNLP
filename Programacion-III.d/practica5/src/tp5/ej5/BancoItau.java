package tp5.ej5;

import java.util.ArrayList;
import java.util.List;

import tp1.ejercicio8.Queue;
import tp5.ej1.*;

public class BancoItau {
	public List<Jubilado> ListadoDeJubilados(Graph<Persona> red, Empleado empleado, int gradoSeparacion){
		List<Jubilado> lista = new ArrayList<>();
		if(!red.isEmpty()) {
			int distancia=0;Jubilado jub; 
			Vertex<Persona> emp = red.search(empleado);
			Queue<Vertex<Persona>> cola = new Queue<>();
			boolean marca[] = new boolean[red.getSize()];
			marca[emp.getPosition()]= true; // visitado el empleado;
			cola.enqueue(emp);
			cola.enqueue(null);// para saber el cambio de distnacias.
			while(!cola.isEmpty()) {
				Vertex<Persona> aux = cola.dequeue();
				if(aux!= null) {
					if(lista.size()<40 && aux.getData().getTipo().toLowerCase().equals("jubilado") ) {
						jub= (Jubilado)aux.getData();
						if(!jub.isCobroJubilacion())lista.add(jub);
					}
					List<Edge<Persona>> adyacentes = red.getEdges(aux);
					for(Edge<Persona> ady : adyacentes) {
						int j = ady.getTarget().getPosition();
						if((!marca[j]) && (distancia<=gradoSeparacion)) {
							marca[j]= true;
							cola.enqueue(ady.getTarget()); // encolo el elemento
						}
					}
				}else {
					if(!cola.isEmpty())distancia++;
					if(distancia<=gradoSeparacion) {
						cola.enqueue(null); // cambio de nivel 
					}
				}
			
			}
		}
		return lista;
	}
}
