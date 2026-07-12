package tp3.ej7;

import java.util.ArrayList;
import java.util.List;

import tp3.ej1.GeneralTree;

public class TestCaminos {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GeneralTree<Integer> g = new GeneralTree<Integer>(5);
		g.isEmpty();
		List <GeneralTree<Integer>> children = new ArrayList < GeneralTree<Integer>>();
		children.add(new GeneralTree<Integer>(4));
		children.add(new GeneralTree<Integer>(1));
		children.add(new GeneralTree<Integer>(6)); //               5
													// 4,       1,        6,        9
		children.add(new GeneralTree<Integer>(9)); //11 - 10 , 15 - 19, 20 - 25,  12- 3
		g = new GeneralTree<Integer>(5, children);
		children = new ArrayList < GeneralTree<Integer>>();
		children.add(new GeneralTree<Integer>(11));
		children.add(new GeneralTree<Integer>(10));
		children.add(new GeneralTree<Integer>(15));
		children.add(new GeneralTree<Integer>(19));
		children.add(new GeneralTree<Integer>(20));
		children.add(new GeneralTree<Integer>(25));
		children.add(new GeneralTree<Integer>(12));
		children.add(new GeneralTree<Integer>(3));
		List <GeneralTree<Integer>> list  = g.getChildren();
		int i = 0;
		for (GeneralTree<Integer> c : list) {
			c.addChild(children.get(i++));
			c.addChild(children.get(i++));
		}
		Caminos c = new Caminos(g);
		System.out.println(c.caminoAHojaMasLejana());
		
	}

}
