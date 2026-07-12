package Trees;
import tp2.ejercicio1.*;

public class ProcesadorDeArbol {
	BinaryTree<Integer> tree;

	public ProcesadorDeArbol(BinaryTree<Integer> tree) {
		super();
		this.tree = tree;
	}
	public ObjetoProcesador procesar() {
		ObjetoProcesador obj = new ObjetoProcesador();
		if(this.tree != null && !this.tree.isEmpty()) {
			procesarHelper(this.tree,obj);
		}
		return obj;
	}
	private void procesarHelper(BinaryTree<Integer> tree, ObjetoProcesador obj) {
		if( tree != null && !tree.isEmpty()) {
			if(tree.getData() % 2 ==0) {
				obj.incValores();
				if(tree.hasLeftChild() && tree.hasRightChild()) {
					obj.getLista().add(tree);
				}
			}
			
			if(tree.hasLeftChild()) {
				procesarHelper(tree.getLeftChild(),obj);
			}
			if(tree.hasRightChild()) {
				procesarHelper(tree.getRightChild(),obj);
			}
			
		}
	}
}
