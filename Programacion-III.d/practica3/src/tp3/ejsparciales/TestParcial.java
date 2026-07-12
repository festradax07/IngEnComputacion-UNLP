package tp3.ejsparciales;
import java.util.LinkedList;
import java.util.List;

import tp3.ej1.*;
public class TestParcial {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<GeneralTree<Integer>> c = new LinkedList<GeneralTree<Integer>>();
		c.add(new GeneralTree<Integer>(0));
		c.add(new GeneralTree<Integer>(1));
		//c.add(new GeneralTree<Integer>(1));
		GeneralTree<Integer> a = new GeneralTree<Integer>(1,c);
		//a.getChildren().get(0).addChild(new GeneralTree<Integer>(1));
		//a.getChildren().get(0).addChild(new GeneralTree<Integer>(1));
		System.out.println(Parcial.esDeSeleccion(a));
		System.out.println(Parcial.resolver(a));
		System.out.println(Parcial.ejercicio11(a));
	}

}
