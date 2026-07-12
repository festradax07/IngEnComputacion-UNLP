package tp2.ejercicio2;
import java.util.ArrayList;

import tp2.ejercicio1.*;
public class ContadorArbol <Integer> {
	private BinaryTree <Integer> treeNode;

	public BinaryTree<Integer> getTreeNode() {
		return treeNode;
	}

	public void setTreeNode(BinaryTree<Integer> treeNode) {
		this.treeNode = treeNode;
	}

	public ContadorArbol(BinaryTree<Integer> treeNode) {
		super();
		this.treeNode = treeNode;
	}
	public ContadorArbol() {
		
	}
	public ArrayList<Integer> numerosPares( BinaryTree <Integer> tree) {
		ArrayList<Integer> l = new ArrayList<Integer>();
		if(tree != null && !tree.isEmpty()) {
			if( (int) tree.getData() % 2 == 0)
				l.add(tree.getData());
			if(tree.hasLeftChild())
				l.addAll(numerosPares(tree.getLeftChild()));
			if(tree.hasRightChild())
				l.addAll(numerosPares(tree.getRightChild()));
		}
		return l;
	}
	public ArrayList<Integer> numerosParesIn( BinaryTree <Integer> tree) {
		ArrayList<Integer> l = new ArrayList<Integer>();
		if(tree != null && !tree.isEmpty()) {
			if(tree.hasLeftChild())
				l.addAll(numerosPares(tree.getLeftChild()));
			if( (int) tree.getData() % 2 == 0)
				l.add(tree.getData());
			if(tree.hasRightChild())
				l.addAll(numerosPares(tree.getRightChild()));
		}
		return l;
	}
	public ArrayList<Integer> numerosParesPost( BinaryTree <Integer> tree) {
		ArrayList<Integer> l = new ArrayList<Integer>();
		if(tree != null && !tree.isEmpty()) {
			if(tree.hasLeftChild())
				l.addAll(numerosPares(tree.getLeftChild()));
			if(tree.hasRightChild())
				l.addAll(numerosPares(tree.getRightChild()));
			if( (int) tree.getData() % 2 == 0)
				l.add(tree.getData());
		}
		return l;
	}
	
}
