package Octo.Modelo.DAO;

import Octo.Modelo.Entidad.Activo;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.Entidad.Stock;
import Octo.Modelo.Entidad.Transaccion;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class DaoTransaccionImpl implements DaoTransaccion {

    @Override
    public void comprarCriptoMonedas(String cripto, String fiat, double cantidad) {
        // vamos a usar rollback
        // consultar por transaccion fallida si debe documentarse.
        // obtengo las monedas utilizadas para comprar
        FactorySQLManager factory = FactorySQLManager.getInstancia();
        Moneda monFiat = factory.getMoneda().obtener(fiat);
        Moneda monCripto = factory.getMoneda().obtener(cripto);
        // obtengo la cantidad de $$$ a utilizar para comprar cripto
        double valorAGastar = monFiat.getCotizacion()*cantidad;
        double cantAComprar = valorAGastar/monCripto.getCotizacion();
        // obtengo los stocks y activos requeridos
        Stock stFiat = factory.getStock().obtener(fiat);
        Stock stCripto = factory.getStock().obtener(cripto);
        //Activo actiFiat = factory.getActivoFiat().obtener(fiat);
        try {
            Conexion.getConexion().setAutoCommit(false);
            //if (( valorAGastar < actiFiat.getCantidad()) && (cantAComprar < stCripto.getMonto()))  { // esto verifica que lo que voy a comprar puede ser cubierto por la app
                /* Activo actiCripto = factory.getActivoCripto().obtener(fiat);
                if (actiCripto == null){
                    factory.getActivoCripto().crear(cripto,cantAComprar)
                }else{
                    factory.getActivoCripto().actualizar(cantidad,cantAComprar);
                }
                factory.getActivoCripto().actualizar(cantidad,-cantidad);
                Transaccion transaccion = new Transaccion ("se compraron " + cantAComprar + "criptomonedas " + monCripto.getNomenclatura +() "gastando  $" + valorAGastar + " de la moneda FIAT: " + monFiat.getNomenclatura(), LocalDateTime.now());
                crear(transaccion);
                boolean res = true; // leeria una confirmacion, creo
                if(res) Conexion.getConexion().commit();
                else Conexion.getConexion().rollback();
                 */  //}
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            Conexion.getConexion().setAutoCommit(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public void swap(Moneda criptoOriginal, double cantidad, Moneda criptoEsperada) {
        // verificar que criptoOriginal y criptoEsperada existan como activos en mis activos
        // editar despues
        try {
            // Retrieve the original and expected cryptocurrencies
            Moneda original = FactorySQLManager.getInstancia().getMoneda().obtener(criptoOriginal.getNomenclatura());
            Moneda esperada = FactorySQLManager.getInstancia().getMoneda().obtener(criptoEsperada.getNomenclatura());

            // Check if the original cryptocurrency exists and has enough stock
            if (original == null || original.getStock() < cantidad) {
                throw new RuntimeException("stock insuficiente para el que .");
            }

            // Calculate the equivalent amount of the expected cryptocurrency
            double valorOriginal = original.getCotizacion() * cantidad;
            double cantidadEsperada = valorOriginal / esperada.getCotizacion();

            // Update the stock for both cryptocurrencies
            String updateOriginal = "UPDATE MONEDA SET STOCK = STOCK - ? WHERE NOMENCLATURA = ?";
            String updateEsperada = "UPDATE MONEDA SET STOCK = STOCK + ? WHERE NOMENCLATURA = ?";

            try (PreparedStatement stOriginal = Conexion.getConexion().prepareStatement(updateOriginal);
                 PreparedStatement stEsperada = Conexion.getConexion().prepareStatement(updateEsperada)) {

                stOriginal.setDouble(1, cantidad);
                stOriginal.setString(2, original.getNomenclatura());
                stOriginal.executeUpdate();

                stEsperada.setDouble(1, cantidadEsperada);
                stEsperada.setString(2, esperada.getNomenclatura());
                stEsperada.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void crear(Transaccion dato) {
        // crear transaccion va a ser con la ayuda de todos los de acá
        // a subir la transaccion finalmente con los datos correspondientes
        try {
            Statement st = Conexion.getConexion().createStatement();
            String sql = "INSERT INTO MONEDA (TIPO, NOMBRE, NOMENCLATURA, VALOR_DOLAR, VOLATILIDAD, STOCK)" +
                    "VALUES('" + dato.getResumen() + "', '"+ Timestamp.valueOf(dato.getFechaHora())
                    +"');";
            // se puede usar sets de Statement y los campos para evitar errores de tipeo.
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    private Transaccion convertir(ResultSet rs) throws SQLException {
        Transaccion tr = new Transaccion();
        tr.setResumen(rs.getString("RESUMEN"));
        tr.setFechaHora(LocalDateTime.of(rs.getDate("FECHAYHORA").toLocalDate(), LocalTime.MIDNIGHT));
        return tr;
    }

    @Override
    public List<Transaccion> listar() {
        List<Transaccion> transacciones = new ArrayList<>(); Moneda moneda;
        try {
            Statement st= Conexion.getConexion().createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM TRANSACCION");
            while( res.next()) {
                transacciones.add(convertir(res));
            }
            res.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return transacciones;
    }

    @Override
    public Transaccion obtener(String id) {
        return null;
    }
}
