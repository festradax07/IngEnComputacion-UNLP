package Octo.Modelo.JDBC;
import Octo.Controlador.Sesion;
import Octo.Exceptions.OctoDBException;
import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.DAO.DaoActivo;
import Octo.Modelo.Entidad.Activo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoActivoFiat implements DaoActivo {
    @Override
    public long crear(Activo dato) {
        String sql = "INSERT INTO ACTIVO_FIAT (ID_USUARIO, ID_MONEDA, CANTIDAD)" + "VALUES(?,?,?);";

        try {
            PreparedStatement st = Conexion.getConexion().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setLong(1, Sesion.getInstance().getUser().getUserId());
            st.setLong(2, dato.getMoneda().getIdMoneda());
            st.setDouble(3, dato.getSaldo());
            st.executeUpdate();
            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getLong(1);
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
            st.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public Activo obtener(long id) throws OctoElemNotFoundException {
        return null;
    }

    @Override
    public int actualizarCantidad(double valor, long idUser, long idMoneda) throws OctoDBException {
        int res = -1;
        try {
            String sql = "UPDATE ACTIVO_FIAT SET CANTIDAD = CANTIDAD + ? WHERE ID_USUARIO = ? AND ID_MONEDA = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(sql);
            st.setDouble(1, valor);
            st.setLong(2, idUser);
            st.setLong(3, idMoneda);
            res = st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            throw new OctoDBException("Error al actualizar los activos! intente nuevamente.");
        }
        return res;
    }
    @Override
    public Activo obtenerporIdyMoneda(long id, long idMoneda) {
        Activo activo = null;
        try {
            String str = "SELECT * FROM ACTIVO_FIAT WHERE ID_USUARIO = ? AND ID_MONEDA = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(str);
            st.setLong(1, id);
            st.setLong(2, idMoneda);
            ResultSet res = st.executeQuery();
            if (res.next()) {
                activo = convertir(res);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return activo;
    }

    public void borrar(long id) {
        try {
            String str = "DELETE FROM ACTIVO_FIAT WHERE ID_USUARIO = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(str);
            st.setLong(1, id);

            int filasAfectadas = st.executeUpdate(); // Ejecutar DELETE correctamente

            if (filasAfectadas == 0) {
                System.out.println("No se encontró el activo para el usuario con ID: " + id);
            } else {
                System.out.println("Activo eliminado correctamente.");
            }

            st.close();
        } catch (SQLException e) {
            throw new RuntimeException("Error al borrar activo: " + e.getMessage(), e);
        }
    }
    public Activo obtener(String nomenclatura) {
        Activo activo = null;
        try {
            String str = "SELECT * FROM ACTIVO_FIAT WHERE NOMENCLATURA = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(str);
            st.setString(1, nomenclatura);
            ResultSet res = st.executeQuery();
            if (res.next()) {
                activo = convertir(res);
            }
        } catch (SQLException e) {
            throw new OctoElemNotFoundException("error! no se encontró el activo con nomenclatura: " + nomenclatura);
        }
        return activo;
    }

    private Activo convertir(ResultSet res) throws SQLException {
        Activo activo = new Activo();
        activo.setId(res.getLong("ID"));
        activo.setMoneda(FactoryDao.getMoneda().obtener(res.getLong("ID_MONEDA")));
        activo.setSaldo(res.getDouble("CANTIDAD"));
        return activo;
    }

    @Override
    public List<Activo> listarPorId(long id) throws OctoElemNotFoundException {
        List<Activo> activos = new ArrayList<Activo>(); // lista de activos
        try {
            Statement st = Conexion.getConexion().createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM ACTIVO_FIAT WHERE ID_USUARIO = " + id);
            while (res.next()) {
                activos.add(convertir(res));
            }
            res.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return activos;
    }
}
