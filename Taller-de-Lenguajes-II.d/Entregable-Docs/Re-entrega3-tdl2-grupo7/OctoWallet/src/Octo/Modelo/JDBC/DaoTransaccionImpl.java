package Octo.Modelo.JDBC;

import Octo.Controlador.Sesion;
import Octo.Servicios.AppServices.FiatConsumo;
import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.DAO.DaoTransaccion;
import Octo.Modelo.Entidad.Activo;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.Entidad.Transaccion;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class DaoTransaccionImpl implements DaoTransaccion {
    private List<Transaccion> transacciones = new ArrayList<>();
    @Override
    // guarda los negativos
    public void comprarCriptoMonedas(long cripto, long fiat, double cantidad) throws OctoElemNotFoundException {
        long userId = Sesion.getInstance().getUser().getUserId();
        Moneda monFiat = FactoryDao.getMoneda().obtener(fiat);
        Moneda monCripto = FactoryDao.getMoneda().obtener(cripto);
        double valorAGastar = FiatConsumo.getCotizacion(monFiat.getNomenclatura())* cantidad;
        double cantAComprar = valorAGastar / Sesion.getInstance().getCotizacionByNom(monCripto.getNomenclatura());
        Activo actiFiat = FactoryDao.getFiat().obtenerporIdyMoneda(userId,fiat);
        try {
            Conexion.getConexion().setAutoCommit(false);
            if (valorAGastar <= actiFiat.getSaldo()*FiatConsumo.getCotizacion(monFiat.getNomenclatura())) {
                Activo actiCripto = FactoryDao.getCrypto().obtenerporIdyMoneda(userId,cripto);
                if (actiCripto == null) {
                    FactoryDao.getCrypto().crear(new Activo(userId, monCripto, cantAComprar));
                } else {
                    FactoryDao.getCrypto().actualizarCantidad(cantAComprar, Sesion.getInstance().getUser().getUserId(), monCripto.getIdMoneda());
                }
                FactoryDao.getFiat().actualizarCantidad((-1) * cantidad, Sesion.getInstance().getUser().getUserId(), fiat);
                /*if(factory.getFiat().obtener(userId,actiFiat.getMoneda().getIdM()).getSaldo() == 0){
                    factory.getFiat().borrar(userId, actiFiat.getMoneda().getIdM());
                }*/
                Transaccion transaccion = new Transaccion();
                transaccion.setResumen("Compra de " +monCripto.getNomenclatura() + " con " + "$" + String.format("%.2f",cantidad) +fiat+ ", +$" + String.format("%.2f",cantAComprar) +monCripto.getNomenclatura());
                transaccion.setFechaHora(LocalDateTime.now());
                transaccion.setIdUsuario(Sesion.getInstance().getUser().getUserId()); // Set a default or appropriate user ID
                crear(transaccion);
                Conexion.getConexion().commit();
            } else {
                throw new OctoElemNotFoundException("problemas con los valores! no hay suficiente saldo");
            }
        } catch (SQLException e) {
            System.out.println("error durante la carga!");
            try {
                Conexion.getConexion().rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            try {
                Conexion.getConexion().setAutoCommit(true);
            } catch (SQLException e) {
                System.out.println("error! no se pudo modificar el commit");
            }
        }
    }

    @Override
    public void swap(long criptoOriginal, double cantidad, long criptoEsperada) {

        long userId = Sesion.getInstance().getUser().getUserId();
        try {
            Moneda monedaOriginal = FactoryDao.getMoneda().obtener(criptoOriginal);
            Moneda monedaEsperada = FactoryDao.getMoneda().obtener(criptoEsperada);

            double cotizacionOriginal = Sesion.getInstance().getCotizacionByNom(monedaOriginal.getNomenclatura());
            double cotizacionEsperada = Sesion.getInstance().getCotizacionByNom(monedaEsperada.getNomenclatura());

            if (cotizacionOriginal <= 0 || cotizacionEsperada <= 0) {
                throw new OctoElemNotFoundException("Cotización inválida para las monedas seleccionadas.");
            }

            Conexion.getConexion().setAutoCommit(false);

            double cantidadACambiar = cantidad * cotizacionOriginal;
            double cantidadEsperada = cantidadACambiar / cotizacionEsperada;

            Activo actiCriptoOriginal = FactoryDao.getCrypto().obtenerporIdyMoneda(userId, criptoOriginal);
            if (actiCriptoOriginal == null || actiCriptoOriginal.getSaldo() < cantidad) {
                throw new OctoElemNotFoundException("Saldo insuficiente en la moneda original o inexistente " + monedaOriginal.getNomenclatura());
            }

            Activo actiCriptoEsperada = FactoryDao.getCrypto().obtenerporIdyMoneda(userId, criptoEsperada);
            if (actiCriptoEsperada == null) {
                throw new OctoElemNotFoundException("No se tiene ninguna cantidad de la moneda " + monedaEsperada.getNomenclatura());
            }
                FactoryDao.getCrypto().actualizarCantidad(cantidadEsperada, userId, criptoEsperada);
                FactoryDao.getCrypto().actualizarCantidad(-cantidad, userId, criptoOriginal);

                Activo saldoRestante = FactoryDao.getCrypto().obtenerporIdyMoneda(userId, criptoOriginal);
                /*if (saldoRestante != null && saldoRestante.getSaldo() == 0) {
                    factory.getCrypto().borrar(userId, criptoOriginal);
                }*/

                Transaccion transaccion = new Transaccion();
                transaccion.setResumen("SWAP A " + monedaEsperada.getNomenclatura() + " con " + "$" + String.format("%.2f", cantidad) + monedaOriginal.getNomenclatura() + ", +$" + String.format("%.2f", cantidadEsperada) + monedaEsperada.getNomenclatura());
                transaccion.setFechaHora(LocalDateTime.now());
                transaccion.setIdUsuario(userId);
                crear(transaccion);

                Conexion.getConexion().commit();
        } catch (SQLException e) {
            try {
                Conexion.getConexion().rollback();
            } catch (SQLException rollbackEx) {
                throw new OctoElemNotFoundException("Error al intentar realizar rollback: " + rollbackEx.getMessage());
            }
            throw new OctoElemNotFoundException("Error al realizar swap: " + e.getMessage());
        } finally {
            try {
                Conexion.getConexion().setAutoCommit(true);
            } catch (SQLException e) {
                throw new OctoElemNotFoundException("Error! No se pudo restablecer el flujo de la aplicación.");
            }
        }
    }

    @Override
    public long crear(Transaccion transaccion) {
        String sql = "INSERT INTO TRANSACCION (RESUMEN, FECHA_HORA, ID_USUARIO) VALUES (?, ?, ?)";
        Connection connection = Conexion.getConexion();
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, transaccion.getResumen());
            pstmt.setTimestamp(2, Timestamp.valueOf(transaccion.getFechaHora()));
            pstmt.setLong(3, transaccion.getIdUsuario());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("SQL error mientras se cargaba la transaccion: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("error inesperado mientras se cargaba la transaccion: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }


    private Transaccion convertir(ResultSet rs) throws SQLException {
        Transaccion tr = new Transaccion();
        tr.setResumen(rs.getString("RESUMEN"));
        tr.setFechaHora(LocalDateTime.of(rs.getDate("FECHA_HORA").toLocalDate(), LocalTime.MIDNIGHT));
        tr.setIdUsuario(rs.getInt("ID_USUARIO"));
        tr.setId(rs.getLong("ID"));
        return tr;
    }
    @Override
    public List<Transaccion> listarPorId(long id) {
        List<Transaccion> transacciones = new ArrayList<>();
        try {
            Statement st = Conexion.getConexion().createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM TRANSACCION WHERE ID_USUARIO =" + id);
            while (res.next()) {
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
    public Transaccion obtener(long ID) throws OctoElemNotFoundException{
        String sql = "SELECT * FROM TRANSACCION WHERE ID = ?";
        Connection connection = Conexion.getConexion();
        Transaccion transaccion = null;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setLong(1, ID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    transaccion = new Transaccion();
                    transaccion.setResumen(rs.getString("RESUMEN"));
                    transaccion.setFechaHora(rs.getTimestamp("FECHA_HORA").toLocalDateTime());
                    transaccion.setIdUsuario(rs.getLong("ID_USUARIO"));
                    transaccion.setId(rs.getLong("ID"));
                    // Otros atributos si existen
                }
            }
        } catch (SQLException e) {
            throw new OctoElemNotFoundException(" error! no se encontró la transacción solicitada.");
        }
        return transaccion;  // Devuelve el objeto Transaccion o null si no existe
    }
    public Transaccion obtener(String a){
        return null;
    }

    public void actualizar(Transaccion transaccion) {
        String sql = "UPDATE TRANSACCION SET RESUMEN = ?, FECHA_HORA = ?, ID_USUARIO = ? WHERE ID = ?";
        Connection connection = Conexion.getConexion();
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, transaccion.getResumen());
            pstmt.setTimestamp(2, Timestamp.valueOf(transaccion.getFechaHora()));
            pstmt.setLong(3, transaccion.getIdUsuario());
            pstmt.setLong(4, transaccion.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            e.printStackTrace();
        }
    }
}
