package tp5.ej5;

import java.util.ArrayList;
import java.util.List;

public class Empleado extends Persona {
	private List<Jubilado> jubilados;

	public Empleado(String tipo, String nombre_Apellido, String domicilio) {
		super(tipo, nombre_Apellido, domicilio);
		jubilados = new ArrayList<>(); // por las dudas para evitar una null pointer exception
	}

	public List<Jubilado> getJubilados() {
		return jubilados;
	}

	public void setJubilados(List<Jubilado> jubilados) {
		this.jubilados = jubilados;
	}
	
	
	
}
