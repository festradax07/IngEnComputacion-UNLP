package Octo.Modelo.Entidad.otros;
/**
 * @author Giovanna Gotusso,Francisco Estrada,Ludmila Dosil
 * @version 1.0
 * Esta clase abstracta Persona representa las carateristicas comunes que tiene usuario */
public abstract class Persona {
    private String nombre;
    private String apellido;
    private String correo;
    private String pais;
    private long telefono;
    /**@param nom indica el nombre de la persona
     * @param ape indica el apellido de la persona
     * @param correo indica el correo de la persona
     * @param pais indica el pais de la persona
     * @param tel indica el telefono de la persona */
    public Persona(String nom,String ape,String correo,String pais,long tel){
    	this.nombre=nom;
    	this.apellido=ape;
    	this.correo=correo;
    	this.telefono=tel;
    	this.pais=pais;
		
	}
    /**@return retorna el apellido de la persona*/
    public String getApellido() {
		return apellido;
	}
    /** @param apellido indica el apellido de la persona*/
    public void setApellido(String apellido) {
		this.apellido = apellido;
	}
    /**@return retorna el nombre de la persona*/
    public String getNombre() {
		return nombre;
	}
    /**@param nom indica el nombre de la persona*/
    public void setNombre(String nombre) {
		this.nombre = nombre;
	}
    /**@return retorna el correo de la persona*/
    public String getCorreo() {
		return correo;
	}
    /** @param correo indica el correo de la persona*/
    public void setCorreo(String correo) {
		this.correo = correo;
	}
    /**@return retorna el pais de la persona*/
    public String getPais() {
		return pais;
	}
    /** @param pais indica el pais de la persona*/
    public void setPais(String pais) {
		this.pais = pais;
	}
    /**@return retorna el telefono de la persona*/
    public long getTelefono() {
		return telefono;
	}
    /** @param telefono indica el telefono de la persona */
    public void setTelefono(long telefono) {
		this.telefono = telefono;
	}
}
