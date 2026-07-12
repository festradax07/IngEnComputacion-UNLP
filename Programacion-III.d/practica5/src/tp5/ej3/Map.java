package tp5.ej3;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import tp5.ej1.*;
public class Map {
	private Graph<String> ciudades ;

	public Map(Graph<String> ciudades) {
		super();
		this.ciudades = ciudades;
	}
	
	/* RETORNA LA LISTA DE CIUDADES QUE SE DEBEN ATRAVESAR PARA IR DE C1 A C2
	 * SI NO SE PUEDE LLEGAR, LISTA NULL
	 */
	public List<String> devolverCamino(String ciudad1,String ciudad2){
			List<String> camino = new ArrayList<String>();
			if(!this.ciudades.isEmpty()) {
				Vertex<String> origin = this.ciudades.search(ciudad1);
				Vertex<String> destination = this.ciudades.search(ciudad2);
				if( (origin != null) && (destination != null) ) {
					buscarCamino(origin, new boolean [this.ciudades.getSize()], camino, destination);
				}
			}
			return camino;	
		}
			private boolean buscarCamino(Vertex<String> origin, boolean[] marca,List<String> camino, Vertex<String> destination) {
				boolean exito= false;
				marca[origin.getPosition()] = true; // recorrido el vertice
				camino.add(origin.getData());
				if( origin == destination) {
					return true;
				}
				else {
					List<Edge<String>> adyacentes = this.ciudades.getEdges(origin); //adyacentes
					Iterator<Edge<String>> it = adyacentes.iterator();
					int j;
					while((it.hasNext())&& (!exito)) {
						 Vertex<String>aux = it.next().getTarget();
						j=aux.getPosition();
						 if(!marca[j]) {
							exito = buscarCamino(aux,marca,camino,destination);
						}
					}
				}
				if(!exito) {
					camino.remove(camino.size()-1); // como no llego a nada, se elimina de la lista recursivaente
				}
				return exito;
			}
			
					public List<String> devolverCaminoExceptuando(String ciudad1,String ciudad2,List<String> ciudades){
						List<String> camino = new ArrayList<String>();
						if(!this.ciudades.isEmpty()) {
						Vertex<String> origin = this.ciudades.search(ciudad1);
						Vertex<String> destination = this.ciudades.search(ciudad2);
						List<Vertex<String>>evitar = new ArrayList<>();
						for(String city: ciudades) {
							evitar.add(this.ciudades.search(city));
						}
						if( (origin != null) && (destination != null) && (evitar!=null) ) {
							if(!evitar.contains(origin) && !evitar.contains(destination)) {
								buscarCaminoExcepto(origin, new boolean [this.ciudades.getSize()], camino, destination,evitar);
							}
						}
					}
					return camino;
					
					
				}
					private boolean buscarCaminoExcepto(Vertex<String> origin, boolean[] marca,List<String> camino, Vertex<String> destination,List<Vertex<String>> evitar) {
						boolean exito= false;
						marca[origin.getPosition()] = true; // recorrido el vertice
						camino.add(origin.getData()); // coloco el elemento
						if( origin == destination) {
							return true;
						}
						else {
							List<Edge<String>> adyacentes = this.ciudades.getEdges(origin); // obtengo los adyacentes
							Iterator<Edge<String>> it = adyacentes.iterator();
							int j;
							while((it.hasNext())&& (!exito)) { // mientras haya tenga adyacentes y no haya llegado a mi destino.
								 Vertex<String>aux = it.next().getTarget(); // obtengo el objeto adyacente
								 j=aux.getPosition(); // obtengo su posicion 
								 if((!marca[j]) && (!evitar.contains(aux))) { // si no esta marcado ni debo evitarlo
									exito = buscarCaminoExcepto(aux,marca,camino,destination,evitar); // busco
								}
							}
						}
						if(!exito) { // si no llegue a mi destino, elimino la lista
							camino.remove(camino.size()-1); // como no llego a nada, se elimina de la lista recursivaente
						}
						return exito;
					}
					
					public List<String> CaminoMasCorto(String ciudad1,String ciudad2){
						List<String> camino = new ArrayList<String>();
						List<String> act = new ArrayList<String>();
						if(!this.ciudades.isEmpty()) {
							Vertex<String> origin = this.ciudades.search(ciudad1);
							Vertex<String> destination = this.ciudades.search(ciudad2);
							if( (origin != null) && (destination != null) ) {
								CaminoCorto(origin, new boolean [this.ciudades.getSize()], camino,act, destination,0,99999);
							}
						}
						return camino;	
					}
					private int CaminoCorto(Vertex<String> origin, boolean[]marca, List<String> camino,List<String> act, Vertex<String> destination, int total, int min) {
						marca[origin.getPosition()]= true;
						act.add(origin.getData());
						//System.out.println("actual:" + act);
						if((origin == destination)&&(total< min)) {
							camino.removeAll(camino);
							camino.addAll(act);
							//System.out.println("camino min : " + camino);
							min = total;
						}else {
							List<Edge<String>> adyacentes = this.ciudades.getEdges(origin);
							Iterator<Edge<String>> it = adyacentes.iterator();
							int j ;
							while(it.hasNext() && total < min) { // sirve el corte de control para que sepa cuando volver y no recorrer al pepe
								Vertex<String> aux = it.next().getTarget();
								j= aux.getPosition();
								if(!marca[j]) {
									min = CaminoCorto(aux,marca,camino,act,destination,total+1,min);
								}	
							}
						}
						marca[origin.getPosition()]= false; // lo desmarco
						act.remove(act.size()-1);
						return min;
					}
					// re hacer despues con dijkstra y floyd
				
					public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
						// pensando que las aristas contienen el gasto de combustible que conlleva ir de ciudad en ciudad
						List<String> camino = new ArrayList<>();
						List<String> cur = new ArrayList<String>();
						if(!this.ciudades.isEmpty()) {
							Vertex<String> origin = this.ciudades.search(ciudad1);
							Vertex<String> destination = this.ciudades.search(ciudad2);
							if(origin != null && destination!= null && tanqueAuto != 0) {
								sinCargarCombustibleHelper(origin,destination,camino,cur, new boolean [this.ciudades.getSize()], tanqueAuto);
							}
						}
						return camino;
					}
					private void sinCargarCombustibleHelper(Vertex<String> origin, Vertex<String> destination,List<String>camino, List<String> cur, boolean[] marca, int tanque){
						marca[origin.getPosition()]= true; // marcado / visitado
						cur.add(origin.getData());
						if(origin == destination) {
							camino.clear();
							camino.addAll(cur);
							marca[origin.getPosition()]= false; // desmarco para poder revisitarlo por otro camino si es necesario;
							cur.remove(cur.size()-1);	
								
							return;
						}
						List<Edge<String>> adyacentes= this.ciudades.getEdges(origin);
						for(Edge<String> ady : adyacentes ) {
							int j = ady.getTarget().getPosition();
							if(tanque - ady.getWeight() > 0 ) {
								if(!marca[j]) {
									sinCargarCombustibleHelper(ady.getTarget(),destination,camino,cur,marca,tanque - ady.getWeight());
								}
							}
						}
						marca[origin.getPosition()]= false; // desmarco para poder revisitarlo por otro camino si es necesario;
						cur.remove(cur.size()-1);	
							
						}
						public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
							List<String> camino = new ArrayList<>();
							if(!this.ciudades.isEmpty()) {
								List<String> current = new ArrayList<>();
								Vertex<String> origin = this.ciudades.search(ciudad1);
								Vertex<String> destination = this.ciudades.search(ciudad2);
								if(origin != null && destination != null && tanqueAuto !=0) {
									caminoMenorCargaHelper(origin,destination, new boolean[this.ciudades.getSize()], current,camino, tanqueAuto,0,Integer.MAX_VALUE, 100);
									
								}
							}
							return camino;
						}
						private int caminoMenorCargaHelper(Vertex<String> origin, Vertex<String> destination, boolean[] marca, List<String> current, List<String>camino, int tanque, int currentCargas, int minCargas,int fullTanque ) {
							marca[origin.getPosition()]= true; // visitado
							current.add(origin.getData());
							if(origin == destination) {
								if(currentCargas<minCargas) {
									minCargas = currentCargas;
									camino.clear();
									camino.addAll(current);
								}
								marca[origin.getPosition()]= false;
								current.remove(current.size()-1);
								return minCargas;
							} // implmentacion con else facilitaria la labor
							List<Edge<String>> adyacentes= this.ciudades.getEdges(origin);
							for(Edge<String> e : adyacentes) {
								int j = e.getTarget().getPosition();
								int  consumo = e.getWeight();
								if((!marca[j])&&(currentCargas<minCargas)) { // esto hace que no recorra si ya las carga actual es mayor	
										if(tanque < consumo) {
											currentCargas++;
											tanque = fullTanque; // supongo 
										}
										if (currentCargas<minCargas){
									     	minCargas = caminoMenorCargaHelper(e.getTarget(),destination,marca,current,camino,tanque - consumo, currentCargas, minCargas,fullTanque);
										}
									}
								}
							marca[origin.getPosition()]= false;
							current.remove(current.size()-1);
							return minCargas;
							
						}
							
							
							
						}
						

