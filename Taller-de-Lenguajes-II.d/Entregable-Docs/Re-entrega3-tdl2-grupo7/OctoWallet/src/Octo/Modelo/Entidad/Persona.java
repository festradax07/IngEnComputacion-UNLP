
package Octo.Modelo.Entidad;

public class Persona {
     private String nombres;
     private String apellidos;
	 private long idPersona;
	public Persona(String nombres, String apellidos, long idPersona) {
		this.nombres = nombres;
		this.apellidos = apellidos;
		this.idPersona = idPersona;
	}

	public Persona(String nombres, String apellidos) {
		this.nombres = nombres;
		this.apellidos = apellidos;
	}

	public Persona(){}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public long getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(long idPersona) {
		this.idPersona = idPersona;
	}

     
	
     
}
