package BuildBinaryTree;

import java.util.LinkedList;

import tp2.ejercicio1.BinaryTree;

public class TestBuilder {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			
		Builder b= new Builder();
		LinkedList<Integer> pre= new LinkedList<Integer>();
		LinkedList<Integer> in= new LinkedList<Integer>();
		pre.add(3);pre.add(9);pre.add(20);pre.add(15);pre.add(7);
		in.add(9);in.add(3);in.add(15);in.add(20);in.add(7);
		BinaryTree<Integer> root = b.buildTreePreIn(pre, in);
		root.printLevelTraversal();
		
	}

}
