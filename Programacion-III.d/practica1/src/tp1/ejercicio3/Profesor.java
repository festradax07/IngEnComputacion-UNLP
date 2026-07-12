package tp1.ejercicio3;

public class Profesor {
	private String nombre;
	private String apellido;
	private String catedra;
	private String email;
	private String facultad;
	
	public Profesor() {
		// TODO Auto-generated constructor stub
	}
	

	public Profesor(String nombre, String apellido, String catedra, String email, String facultad) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.catedra = catedra;
		this.email = email;
		this.facultad = facultad;
	}


	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getCatedra() {
		return catedra;
	}

	public void setCatedra(String catedra) {
		this.catedra = catedra;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFacultad() {
		return facultad;
	}

	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}


	@Override
	public String toString() {
		return "Profesor [nombre=" + nombre + ", apellido=" + apellido + ", catedra=" + catedra + ", email=" + email
				+ ", facultad=" + facultad + "]";
	}
	
	
}
