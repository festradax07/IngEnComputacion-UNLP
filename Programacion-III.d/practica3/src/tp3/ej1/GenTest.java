package tp3.ej1;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GenTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GeneralTree<Integer> g = new GeneralTree<Integer>(5);
		g.isEmpty();
		List <GeneralTree<Integer>> children = new ArrayList < GeneralTree<Integer>>();
		children.add(new GeneralTree<Integer>(4));
		children.add(new GeneralTree<Integer>(1));
		children.add(new GeneralTree<Integer>(6));
		children.add(new GeneralTree<Integer>(9));
		g = new GeneralTree<Integer>(5, children);
		children = new ArrayList < GeneralTree<Integer>>();
		children.add(new GeneralTree<Integer>(11));
		children.add(new GeneralTree<Integer>(10));
		children.add(new GeneralTree<Integer>(15));
		children.add(new GeneralTree<Integer>(19));
		List <GeneralTree<Integer>> list  = g.getChildren();
		int i = 0;
		for (GeneralTree<Integer> c : list) {
			c.addChild(children.get(i++));
		}
		// recorrer 
		List <Integer> l = new ArrayList <Integer>();
		preorder(g,l);
		System.out.println(l);
	    g = new GeneralTree<>();
		System.out.println(g.altura());
		
	}
	public static void preorder (GeneralTree<Integer> root, List<Integer> l){
		l.add(root.getData());
		List <GeneralTree<Integer>> list  = root.getChildren();
		for (GeneralTree<Integer> c : list) {
			preorder(c, l);
		}		
	}

}
