package Trees;

import java.util.ArrayList;
import java.util.List;

import tp2.ejercicio1.BinaryTree;

public class ObjetoProcesador {
	private List<BinaryTree<Integer>> lista;
	private int valores;
	
	public ObjetoProcesador() {
		this.lista = new ArrayList<>();
		this.valores = 0;
	}
	public List<BinaryTree<Integer>> getLista() {
		return lista;
	}
	public void setLista(List<BinaryTree<Integer>> lista) {
		this.lista = lista;
	}
	public int getValores() {
		return valores;
	}
	public void incValores() {
		this.valores++;
	}
	
	
}
