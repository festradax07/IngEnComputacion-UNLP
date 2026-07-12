package tp2.ejercicio5;

import tp2.ejercicio1.BinaryTree;

public class Transformacion {
		private BinaryTree<Integer> treeNode;
		
		
		public Transformacion(BinaryTree<Integer> treeNode) {
			super();
			this.treeNode = treeNode;
		}
		

		public Transformacion() {
			super();
		}
		

		public BinaryTree<Integer> getTreeNode() {
			return treeNode;
		}


		public void setTreeNode(BinaryTree<Integer> treeNode) {
			this.treeNode = treeNode;
		}


		public BinaryTree<Integer> suma(){ // implementado el correcto parasaje de parametros
			if(this.treeNode.isEmpty()) {
				return null;
			}else {
				UpdateNodeWSubTrees(getTreeNode());
				return treeNode;
			}
			
		}
		private int UpdateNodeWSubTrees(BinaryTree<Integer> tree) { // METODO PRIVADO OCULTO AL IMPLEMENTADOR del Objeto
			if(tree== null || tree.isEmpty()) {
				return 0;
			}else {	
				int sum=0, tot=0;
				if(tree.hasLeftChild()) {
					sum += UpdateNodeWSubTrees(tree.getLeftChild());
				}
				if(tree.hasRightChild()) {
					sum += UpdateNodeWSubTrees(tree.getRightChild());
				}
				tot= tree.getData() + sum;
				tree.setData(sum); 
				return tot;
			}
		}
		
		
}
