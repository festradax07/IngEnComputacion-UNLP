package Octo.Modelo.Entidad.otros;
import java.util.List;
/**
 * @author Giovanna Gotusso,Francisco Estrada,Ludmila Dosil
 * @version 1.0
 * Esta clase publica Usuario representa las caracteristicas necesarias que usuario precisa para el manejo de billetera 
 **/
public class Usuario extends Persona{
	private String alias;
	private long Cbu;
	private String contrasena;
	private long idUsuario;
	private Tarjeta tarjeta;
	private List<String> PregSeg;
	private List<Integer> tickets;
	/**@param nom indica el nombre de la persona
     * @param ape indica el apellido de la persona
     * @param correo indica el correo de la persona
     * @param pais indica el pais de la persona
     * @param tel indica el telefono de la persona 
     * @param a indica el alias del usuario
     * @param cbu indica el cbu del usuario
     * @param contrasena indica la contrasena del usuario
     * @param IdUsuario indica la identificacion del usuario
     * @param target indica la tarjeta personal del usuario*/
	public Usuario(String nom,String ape,String correo,String pais,long tel,String a,long cvu,String contra,long id,Tarjeta target) {
		super(nom,ape,correo,pais,tel);
		this.alias=a;
		this.Cbu=cvu;
		this.contrasena=contra;
		this.idUsuario=id;
		this.tarjeta=target;
	}
	/**@return retorna el alias del usuario*/
public String getAlias() {
	return alias;
}
/** @param a indica el alias del usuario*/
public void setAlias(String alias) {
	this.alias = alias;
}
/**@return retorna el cbu del usuario*/
public long getCbu() {
	return Cbu;
}
/** @deprecated no deberia usarse ya que no el usuario no deberia poder modificar su cbu*/
public void setCbu(long cbu) {
	Cbu = cbu;
}
/**@return retorna la contrasena del usuario*/
public String getContrasena() {
	return contrasena;
}
/** @param contrasena indica la contrasena del usuario*/
public void setContrasena(String contrasena) {
	this.contrasena = contrasena;
}
/**@return retorna el id del usuario*/
public long getIdUsuario() {
	return idUsuario;
}
/** @deprecated no deberia usarse ya que usuario no deberia poder modificar su id*/
public void setIdUsuario(long idUsuario) {
	this.idUsuario = idUsuario;
}
/**@return retorna la tarjeta del usuario*/
public Tarjeta getTarjeta() {
	return tarjeta;
}
/** @param tarjeta indica la tarjeta personal del usuario*/
public void setTarjeta(Tarjeta tarjeta) {
	this.tarjeta = tarjeta;
}
}
