package tp3.ej4;

import java.util.ArrayList;
import java.util.List;

import tp3.ej1.GeneralTree;

public class TestMayorPromedio {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		GeneralTree<AreaEmpresa> g;
		List <GeneralTree<AreaEmpresa>> children = new ArrayList < GeneralTree<AreaEmpresa>>();
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("J",13)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("K",25)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("L",10))); //               5
		
		g = new GeneralTree<AreaEmpresa>(new AreaEmpresa("M",14), children);
		children =  new ArrayList < GeneralTree<AreaEmpresa>>();
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("A",4)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("B",7)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("C",5)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("D",6)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("E",10)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("F",18)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("G",9)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("H",12)));
		children.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("I",19)));
		List <GeneralTree<AreaEmpresa>> childs  = g.getChildren();
		int i = 0;
		for (GeneralTree<AreaEmpresa> c : childs) {
			c.addChild(children.get(i++));
			c.addChild(children.get(i++));
			c.addChild(children.get(i++));
		}
		AnalizadorArbol util = new AnalizadorArbol();
		System.out.println(util.devolverMaximoPromedio(g));
	}

}
