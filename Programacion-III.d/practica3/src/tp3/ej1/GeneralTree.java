package tp3.ej1;
import tp3.ej1.Queue;
import java.util.List;
import java.util.LinkedList;


public class GeneralTree<T> {

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>();

	public GeneralTree(T data) {
		this.data = data;
	}
	public GeneralTree() {
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}

	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child); // añade un hijo a la lista de hijos
	}

	public boolean isLeaf() {
		return !this.hasChildren(); // si no tiene hijos es hoja
	}

	public boolean hasChildren() {
		return children != null && !children.isEmpty();
	}

	public boolean isEmpty() {
		return this.data == null && !hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren()) { // si tiene hijos
			List<GeneralTree<T>> children = this.getChildren(); // obtengo la lista de hijos
			if (children.contains(child)) // si lo tiene lo borro
				children.remove(child);
		}
	}
	
	public int altura() {
		int maxHeight = -2,height=0;
		if(!this.isEmpty()) {
			if(this.hasChildren()) {
				for(GeneralTree<T> child: this.children) {
					height= child.altura();	
					if(height > maxHeight) {
						maxHeight= height;
					}
				}
			} else {
				maxHeight++; // significa que debe retornar 0 y no utiliza recurrencia.
			}
		}
		return maxHeight + 1;			
	}
	public int nivel(T dato) {
	    return buscarNivel(this, dato, 0);
	}
	
	private int buscarNivel(GeneralTree<T> nodo, T dato, int nivelActual) {
	    if (nodo.isEmpty()) {
	        return -1; // Si el nodo está vacío, se devuelve -1 indicando que el dato no se encontró.
	    }

	    if (nodo.data.equals(dato)) {
	        return nivelActual; // Si el nodo actual contiene el dato, se devuelve el nivel actual.
	    }

	    for (GeneralTree<T> child : nodo.children) {
	        int nivelEncontrado = buscarNivel(child, dato, nivelActual + 1);
	        if (nivelEncontrado >= 0) {
	            return nivelEncontrado; // Si se encuentra el dato en el subárbol del hijo, se devuelve el nivel encontrado.
	        }
	    }

	    return -1; // Si el dato no está en el subárbol, se devuelve -1.
	}
	
	public int ancho() {
		Queue <GeneralTree<T>>cola = new Queue<GeneralTree<T>>();
		List <GeneralTree<T>> children;
		int MaxNodos = 0, nodos=0;
		GeneralTree<T> aux; // variable auxiliar
		cola.enqueue(this);
		cola.enqueue(null); // para diferencial el nivel 0
		while(!cola.isEmpty()) {
			aux = cola.dequeue();
			if( aux != null) {
				nodos++;
				children =  aux.getChildren();
				for( GeneralTree<T> child : children) {
					cola.enqueue(child);
				}
			}else {
					if(nodos > MaxNodos) MaxNodos = nodos;
					nodos = 0;
					if( !cola.isEmpty()) { // si no llegue a recorrer todos los niveles
						cola.enqueue(null); // fin de nivel
					}
			}
		}
	return MaxNodos;
	}
	public boolean esAncestro(T a , T b) { // encontrar elemento en a y luego, trazar los caminos desde a en un submodulo privado
		boolean res= false;
		if(this.isEmpty()) {
			return false;
		}
		res= EncontrarAncestro(a, b);
		return res;
	}
	// ej5
	private boolean EncontrarAncestro(T a, T b){
		List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>();
		boolean res= false;
		if(!this.isEmpty()) {
			children = this.getChildren();
			if(this.data.equals(a)) {
				for(GeneralTree<T> child : children ) {
					res = child.CaminoAB(b);
					if(res) return res;
				}
			}else {
				for(GeneralTree<T> child: children) {
					res= child.EncontrarAncestro(a, b);
					if(res) return res;
				}
			}	
		} return res;
	 }
	 private boolean CaminoAB(T b) {
		 boolean res= false;
		 if(!this.isEmpty()) {
			 if(this.data.equals(b)) {
				 return true;
			 }else {
				 children = this.getChildren();
				 for(GeneralTree<T> child : children ) {
					 res= child.CaminoAB(b);
					 if(res) return res;
				 }
			 }
		 } return res;
		 }
	}

