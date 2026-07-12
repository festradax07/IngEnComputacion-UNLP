package Octo.Modelo.Entidad.otros;
/**
 * @author Giovanna Gotusso,Francisco Estrada,Ludmila Dosil
 * @version 1.0
 * Esta clase publica contacto representa las carateristicas que tiene contacto para poder agregar adecuadamente un contacto nuevo a la billetera
 */
public class Contacto {
    private String nombre;
    private String Alias;
    private long cbu;
    private String nomB;
    /**@param nom indica el nombre del contacto
     * @param alias indica el alias del contacto
     * @param cbu indica el cbu del contacto
     * @param nomB indica el nombre del banco/billetera del contacto*/
    public Contacto(String nom,String alias,long cbu,String nomB) {
    	this.nombre=nom;
    	this.Alias=alias;
    	this.cbu=cbu;
    	this.nomB=nomB;
    }
    /**@return retorna el alias del contacto*/
    public String getAlias() {
		return Alias;
	}
    /** @param alias indica el alias del contacto*/
    public void setAlias(String alias) {
		Alias = alias;
	}
    /**@return retorna el cbu del contacto*/
    public long getCbu() {
		return cbu;
	}
    /** @param cbu indica el cbu del contacto*/
    public void setCbu(long cbu) {
		this.cbu = cbu;
	}
    /**@return retorna el nombre del contacto*/
    public String getNombre() {
		return nombre;
	}
    /**@param nom indica el nombre del contacto*/
    public void setNombre(String nombre) {
		this.nombre = nombre;
	}
    /**@return retorna el nombre del banco/billetera del contacto*/
    public String getNomB() {
		return nomB;
	}
    /** @param nomB indica el nombre del banco/billetera del contacto*/
    public void setNomB(String nomB) {
		this.nomB = nomB;
	}
} 
