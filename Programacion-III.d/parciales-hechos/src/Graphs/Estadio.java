package Graphs;

public class Estadio{
	private String ciudad;
	private String Estadio;
	
	public Estadio(String ciudad, String estadio) {
		super();
		this.ciudad = ciudad;
		Estadio = estadio;
	}
	/*@Override
	public boolean equals(Object o ) {
		return this.Estadio.equals(o); // para no modificar nada ya que el metodo search utiliza equals
	}
	*/
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getEstadio() {
		return Estadio;
	}
	public void setEstadio(String estadio) {
		Estadio = estadio;
	}

}
