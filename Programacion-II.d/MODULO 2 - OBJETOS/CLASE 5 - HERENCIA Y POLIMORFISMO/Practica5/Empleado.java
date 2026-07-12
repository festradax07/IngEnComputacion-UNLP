public  abstract class Empleado
{
    private int dni;
    private String nombre;
    private int edad;
    private double sueldo;

    /**
     * Constructor for objects of class Empleados
     */
    public Empleado(int dni, String nombre, int edad, double sueldo){
        this.dni=dni;
        this.nombre=nombre;
        this.edad=edad;
        this.sueldo=sueldo;
    }
    public int getDni(){
        return dni;
    }
    public String getNombre(){
        return nombre;
    }
    public int getEdad(){
        return edad;
    }
    public double getSueldo(){
        return sueldo;
    }
    public void setDni(int dni){
        this.dni=dni;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setEdad(int edad){
        this.edad=edad;
    }
    public void setSueldo( double sueldo){
        this.sueldo=sueldo;
    }
    public abstract double calcularSueldoACobrar();
    public String toString(){
     return  "  nombre " + nombre + " sueldo a cobrar: " + this.calcularSueldoACobrar();
    }
}
