package tp2.ejercicio4;
import tp1.ejercicio8.Queue;
import tp2.ejercicio1.*;
public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> treeNode;

	public ProfundidadDeArbolBinario(BinaryTree<Integer> treeNode) {
		this.treeNode = treeNode;
	}

	public ProfundidadDeArbolBinario() {
		super();
	}
	public int sumaElementosProfundidad(int p) { // respeta los parametros por ser iterativo, no requiere cambios!
		if(this.treeNode == null) {
			return 0;
		}else {
			return profundidadHelper(p,this.treeNode,0);
		}
	}
	
	private int profundidadHelper(int p, BinaryTree<Integer> node, int currentDepth){ // fixed!! no era por niveles, asi es las bonito.
		int total=0;
		if(node !=null && !node.isEmpty()) {
			if( currentDepth == p) { // caso base
				return node.getData();
			}
			if(node.hasLeftChild()) {
				total+= profundidadHelper(p, node.getLeftChild(),currentDepth+1);
			}
			if(node.hasRightChild()) {
				total+=profundidadHelper(p,node.getRightChild(),currentDepth+1);
			}
		}
		return total;
	}
}

