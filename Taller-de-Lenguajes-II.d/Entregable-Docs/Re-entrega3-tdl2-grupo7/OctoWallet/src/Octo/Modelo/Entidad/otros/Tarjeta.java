package Octo.Modelo.Entidad.otros;
/**
 * @author Giovanna Gotusso,Francisco Estrada,Ludmila Dosil
 * @version 1.0
 * {@link Debito}
 * Esta clase abstracta Tarjeta representa las carateristicas comunes de las tarjetas. 
 * 
 */
public abstract class Tarjeta {
	private String nom_ape;
	private long num_tarjeta;
	private String fecha_S;
	private String fecha_V;
	private int num_seg;
	private boolean es_v;
	private int cod_v;
	private double limD;
	/**@param nom_a indica el nombre en la tarjeta
	 * @param numT indica el numero de la tarjeta
	 * @param fechaS indica la fecha en la cual fue entregada la tarjeta
	 * @param fechaV indica la fecha en la cual vence la tarjeta
	 * @param numS indica el numero de seguridad de la tarjeta
	 * @param esV indica si la tarjeta es vitual o no
	 * @param codV en caso de que lo sea indica el numero virtual de la tarjeta
	 * @param limD indica el limite por dia de la tarjeta*/
	
	public Tarjeta(String nom_a,long numT,String fechaS,String fechaV,int numS,boolean esV,double limD) {
		this.nom_ape=nom_a;
		this.num_tarjeta=numT;
		this.fecha_S=fechaS;
		this.fecha_V=fechaV;
		this.num_seg=numS;
		this.es_v=esV;
		this.limD=limD;
	}
 /** @return retorna el nombre y apellido*/
  public String getNom_ape() {
	return nom_ape;
  }
  public void setNom_ape(String nom_ape) {
	this.nom_ape = nom_ape;
}
  /** @return retorna el numero de la tarjeta*/
  public long getNum_tarjeta() {
	return num_tarjeta;
}
  public void setNum_tarjeta(long num_tarjeta) {
	this.num_tarjeta = num_tarjeta;
}
  /** @return retorna la fecha en la cual se dio la tarjeta*/
  public String getFecha_S() {
	return fecha_S;
}
  public void setFecha_S(String fecha_S) {
	this.fecha_S = fecha_S;
}
  /** @return retorna la fecha en la que vence la tarjeta*/
  public String getFecha_V() {
	return fecha_V;
}
  public void setFecha_V(String fecha_V) {
	this.fecha_V = fecha_V;
}
  /** @return retorna el numero de seguridad de la tarjeta*/
  public int getNum_seg() {
	return num_seg;
}
  public void setNum_seg(int num_seg) {
	this.num_seg = num_seg;
}
  /** @return retorna el limite por dia de la tarjeta*/
  public double getLimD() {
	return limD;
}
 public void setLimD(double limD) {
	this.limD = limD;
}
 /** @return retorna si la tarjeta es virtual o no*/
 public boolean isEs_v() {
	return es_v;
}
 public void setEs_v(boolean es_v) {
	this.es_v = es_v;
}
}
