package Octo.Modelo.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
    public static final String URL = "jdbc:sqlite:monedas.db";
    public static final String USERNAME = "";
    public static final String PASSWORD = "";
    public static Connection conexion= null;
    static{
        try {
            conexion = DriverManager.getConnection(URL);
            creacionDeTablasEnBD();
        } catch( SQLException e) {
            System.out.println("ERROR AL HACER CONEXION CON LA BBDD");

        }
    }
    private Conexion(){

    }
    public static Connection getConexion(){
        return conexion;
    }
    public static void cerrarConexion(){
        if(conexion != null){
            try {
                if (!conexion.isClosed()) {
                    conexion.close();
                    System.out.println("conexion cerrada!");
                }
            } catch (SQLException e) {
                System.out.println("error! la conexion no pudo cerrarse!");
            }
        }

    }
    public static void creacionDeTablasEnBD() throws
            SQLException {
        Statement stmt;
        stmt = conexion.createStatement();
        String sql = "CREATE TABLE IF NOT EXISTS MONEDA "
                + "("
                + " TIPO       VARCHAR(1)    NOT NULL, "
                + " NOMBRE       VARCHAR(50)    NOT NULL, "
                + " NOMENCLATURA VARCHAR(10)  PRIMARY KEY   NOT NULL, "
                + " VALOR_DOLAR	REAL     NOT NULL, "
                + " VOLATILIDAD	REAL     NULL, "
                + " STOCK	REAL     NULL "  + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS STOCK "
                + "( "
                + " NOMENCLATURA VARCHAR(10) PRIMARY KEY NOT NULL, "
                + " CANTIDAD REAL NOT NULL "
                + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS ACTIVO_CRIPTO"
                + "("
                + " NOMENCLATURA VARCHAR(10)  PRIMARY KEY     NOT NULL, "
                + " CANTIDAD	REAL    NOT NULL " + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS ACTIVO_FIAT"
                + "("
                + " NOMENCLATURA VARCHAR(10)  PRIMARY KEY     NOT NULL, "
                + " CANTIDAD	REAL    NOT NULL " + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS TRANSACCION"
                + "("
                + " RESUMEN VARCHAR(1000)   NOT NULL, "
                + " FECHA_HORA		DATETIME  NOT NULL " + ")";
        stmt.executeUpdate(sql);
        stmt.close();
    }

}
// consultar herencia de conexion o conexion singleton