package tp5.ej2;
import java.util.ArrayList;
import java.util.List;
import tp1.ejercicio8.Queue;


import tp5.ej1.*;
import tp5.ej1.listaAdy.AdjListGraph;
public class Traversals <T>{
	public List<T> dfs(Graph<T> grafo){
		boolean[] marca = new boolean[grafo.getSize()];
		List<T> camino = new ArrayList<T>();
		 for (int i = 0; i < grafo.getSize(); i++) {
			 if (!marca[i]) {
				 System.out.println("bfs inicia con: "+ grafo.getVertex(i).getData());
				 dfs(i, grafo, marca,camino);
			 }
		 }
		return camino;
		
	}
		private void dfs(int i, Graph<T> grafo, boolean[] marca,List<T> camino) {
			marca[i] = true;
			Vertex<T> v = grafo.getVertex(i);
			camino.add(v.getData());
			List<Edge<T>> adyacentes = grafo.getEdges(v); //adyacentes
			for (Edge<T> e: adyacentes){
			  int j = e.getTarget().getPosition();
			  if (!marca[j]) {
				  dfs(j, grafo, marca,camino);
			  }
			}
		}
		public List<T> bfs(Graph<T> grafo) {
		   boolean[] marca = new boolean[grafo.getSize()];
		   List<T> camino = new ArrayList<T>();
		   for (int i = 0; i < marca.length; i++) {
			 if (!marca[i]){
				 System.out.println("bfs por : " + grafo.getVertex(i).getData() + '\n');
				 bfs(i, grafo, marca,camino); //las listas empiezan en la pos 1
			 }
			}
		   return camino;
		}
		private void bfs(int i, Graph<T> grafo, boolean[] marca,List<T> camino) {
			 Queue<Vertex<T>> q = new Queue<Vertex<T>>();
			 q.enqueue(grafo.getVertex(i));
			 marca[i] = true;
			 while (!q.isEmpty()) {
			 Vertex<T> w = q.dequeue();
			 camino.add(w.getData());
			 // para todos los vecinos de w:
			 List<Edge<T>> adyacentes = grafo.getEdges(w);
			 for (Edge<T> e: adyacentes) {
				 int j = e.getTarget().getPosition();
				 if (!marca[j]) {
					 marca[j] = true;
					 q.enqueue(e.getTarget());
				 }
			 }
			 
			}
		}
			
}
