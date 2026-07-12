package tp5.ej5;

public class Persona {
	private String tipo;
	private String nombre_Apellido;
	private String domicilio;
	
	public Persona(String tipo, String nombre_Apellido, String domicilio) {
		this.tipo = tipo;
		this.nombre_Apellido = nombre_Apellido;
		this.domicilio = domicilio;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNombre_Apellido() {
		return nombre_Apellido;
	}
	public void setNombre_Apellido(String nombre_Apellido) {
		this.nombre_Apellido = nombre_Apellido;
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	
}
