package Octo.Modelo.JDBC;

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
            if (conexion != null) {
                creacionDeTablasEnBD();
                // si se crea se obtiene la info de las apis
                System.out.println("Conexión establecida con la base de datos.");}
        } catch( SQLException e) {
            System.out.println(e.getMessage());
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
    /**
     * Este método se encarga de la creación de las tablas.
     *
     * @throws SQLException
     */
    private static void creacionDeTablasEnBD() throws
            SQLException {
        Statement stmt;
        stmt = conexion.createStatement();
        String sql = "CREATE TABLE IF NOT EXISTS PERSONA "
                + "("
                + " ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , "
                + " NOMBRES VARCHAR(50) NOT NULL, "
                + " APELLIDOS VARCHAR(50) NOT NULL "
                + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS USUARIO " + "(" +
                " ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , "
                + " ID_PERSONA INTEGER NOT NULL, "
                + " EMAIL VARCHAR(50) NOT NULL, "
                + " PASSWORD VARCHAR(50) NOT NULL, "
                + " ACEPTA_TERMINOS BOOLEAN NOT NULL, "
                + " FOREIGN KEY(ID_PERSONA) REFERENCES PERSONA(ID)"
                + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS MONEDA "
                + "("
                + " ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , " +
                " TIPO VARCHAR(1) NOT NULL, "
                + " NOMBRE VARCHAR(50) NOT NULL, "
                + " NOMENCLATURA VARCHAR(10) NOT NULL, "
                + " VALOR_DOLAR REAL NOT NULL, "
                + " VOLATILIDAD REAL NULL, "
                + " STOCK REAL NULL, "
                + " NOMBRE_ICONO VARCHAR(50) NOT NULL "
                + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS ACTIVO_CRIPTO"
                + "("
                + " ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , " +
                " ID_USUARIO INTEGER NOT NULL, "
                + " ID_MONEDA INTEGER NOT NULL, "
                + " CANTIDAD REAL NOT NULL, "
                + " FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID),"
                + " FOREIGN KEY(ID_MONEDA) REFERENCES MONEDA(ID) "
                + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS ACTIVO_FIAT"
                + "("
                + " ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,"+  "ID_USUARIO INTEGER NOT NULL, "
                + " ID_MONEDA INTEGER NOT NULL, "
                + " CANTIDAD REAL NOT NULL, "
                + " FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID),"
                + " FOREIGN KEY(ID_MONEDA) REFERENCES MONEDA(ID)"
                + ")";
        stmt.executeUpdate(sql);
        sql = "CREATE TABLE IF NOT EXISTS TRANSACCION"
                + "("
                + " ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , "
                + " RESUMEN VARCHAR(1000) NOT NULL, "
                + " FECHA_HORA DATETIME NOT NULL, "
                + " ID_USUARIO INTEGER NOT NULL, "
                + " FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)"
                + ")";
        stmt.executeUpdate(sql);
        stmt.close();
    }

}
