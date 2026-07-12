package tp5.ej5;

public class Jubilado extends Persona {
	private boolean cobroJubilacion;
	
	public Jubilado(String tipo, String nombre_Apellido, String domicilio, boolean cobroJubilacion) {
		super(tipo, nombre_Apellido, domicilio);
		this.cobroJubilacion = cobroJubilacion;
	}

	public boolean isCobroJubilacion() {
		return cobroJubilacion;
	}

	public void setCobroJubilacion(boolean cobroJubilacion) {
		this.cobroJubilacion = cobroJubilacion;
	}
	

}
