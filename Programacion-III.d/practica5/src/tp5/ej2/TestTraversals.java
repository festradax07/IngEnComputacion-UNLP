package tp5.ej2;
import tp5.ej1.*;
import tp5.ej1.listaAdy.*;
public class TestTraversals {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Graph<String> ciudades = new AdjListGraph<String>();
        Traversals<String> rec = new Traversals<String>();
        Vertex<String> v1 = ciudades.createVertex("Buenos Aires");
        Vertex<String> v2 = ciudades.createVertex("Santiago");
        Vertex<String> v3 = ciudades.createVertex("Asunción");
        Vertex<String> v4 = ciudades.createVertex("Tokio");
        Vertex<String> v5 = ciudades.createVertex("Roma");
        Vertex<String> v6 = ciudades.createVertex("Paris");
        Vertex<String> v7 = ciudades.createVertex("Madrid");
        Vertex<String> v8 = ciudades.createVertex("Caracas");
        ciudades.connect(v1, v2); // bsas -- Santiango
        ciudades.connect(v1, v3); // bsas -- asuncion
        ciudades.connect(v2, v5); // santiago -- roma
        ciudades.connect(v3, v7); // asuncion -- madrid
        ciudades.connect(v3, v8); // asuncion -- caracas
        ciudades.connect(v8, v7); // caracas -- madrid
        ciudades.connect(v8, v4); // caracas -- tokio
        ciudades.connect(v5, v4); // roma -- tokio
        ciudades.connect(v7, v4); // madrid -- tokio
        ciudades.connect(v6, v5); // paris -- roma
        ciudades.connect(v6, v7); // paris -- madrid
        ciudades.connect(v6, v4); // paris -- tokio
        ciudades.connect(v4, v1); // tokio -- bsas
        System.out.println(rec.bfs(ciudades));
        System.out.println(rec.dfs(ciudades));
        
	}

}
