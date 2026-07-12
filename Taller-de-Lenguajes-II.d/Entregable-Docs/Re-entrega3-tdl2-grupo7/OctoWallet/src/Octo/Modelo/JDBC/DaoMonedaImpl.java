package Octo.Modelo.JDBC;

import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.DAO.DaoMoneda;
import Octo.Modelo.Entidad.Moneda;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// acá me encargo de darle forma a la conexion pasando los objetos a la bbdd
public class DaoMonedaImpl implements DaoMoneda {
    @Override
    public long crear(Moneda dato){
        long id = -1;
        String sql = "INSERT INTO MONEDA (TIPO, NOMBRE, NOMENCLATURA, VALOR_DOLAR, VOLATILIDAD, STOCK, NOMBRE_ICONO)" +
                "VALUES(?, ?, ?, ?, ?, ?, ?);";
        try {
            // se puede usar sets de Statement y los campos para evitar errores de tipeo.
            PreparedStatement st = Conexion.getConexion().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, dato.getTipo());
            st.setString(2, dato.getNombre());
            st.setString(3, dato.getNomenclatura());
            st.setDouble(4, dato.getCotizacion());
            st.setDouble(5, dato.getVolatilidad());
            st.setDouble(6, dato.getStock());
            st.setString(7, dato.getImagen());
            st.executeUpdate();
            System.out.println("dato ingresado" + dato);
            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    id = generatedKeys.getLong(1);
                }
            } catch (SQLException e) {
                System.out.println("error al crear la moneda solicitada");
            }
            st.close();

        } catch (SQLException e) {
            System.out.println("error al crear la moneda solicitada");
        }
        return id;
    }

    @Override
    public List<Moneda> listar() throws OctoElemNotFoundException{
        List<Moneda> monedas = new ArrayList<>();
        Moneda moneda;
        try {
            Statement st= Conexion.getConexion().createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM MONEDA");
            while( res.next()) {
                monedas.add(convertir(res));
            }
            res.close();
            st.close();
        } catch (SQLException e) {
            System.out.println("error al listar las monedas");
        }
        return monedas;
    }
    private Moneda convertir(ResultSet rs) throws SQLException{
        Moneda moneda = new Moneda();
        moneda.setIdMoneda(rs.getLong("ID"));
        moneda.setTipo(rs.getString("TIPO"));
        moneda.setNombre(rs.getString("NOMBRE"));
        moneda.setNomenclatura(rs.getString("NOMENCLATURA"));
        moneda.setCotizacion(rs.getDouble("VALOR_DOLAR"));
        moneda.setVolatilidad(rs.getDouble("VOLATILIDAD"));
        moneda.setStock(rs.getDouble("STOCK"));
        moneda.setImagen(rs.getString("NOMBRE_ICONO"));
        return moneda;
    }
    @Override
    public Moneda obtener(long id) throws OctoElemNotFoundException{
        Moneda moneda = null;
        try {
            String str = "SELECT * FROM MONEDA WHERE ID = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(str);
            st.setLong(1,id);
            ResultSet res = st.executeQuery();
            if (res.next()){
                moneda = convertir(res);
            }
        } catch (SQLException e) {
            throw new OctoElemNotFoundException("error! no se encontró el elemento con id: " + id);
        }
        return moneda;
    }
    // foco: tener id y stock para actualizarlo
    @Override
    public int actualizar(Moneda moneda) throws OctoElemNotFoundException{
        int res = -1;
        try{
            String sql = "UPDATE MONEDA SET STOCK = STOCK + ? WHERE ID = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(sql);
            st.setDouble(1,moneda.getStock());
            st.setLong(2,moneda.getIdMoneda());
            res = st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            throw new OctoElemNotFoundException("error! no se encontró la moneda con id: " + moneda.getIdMoneda());
        }
        return res;
    }
    @Override
    public Moneda obtenerPorNomenclatura(String nomenclatura){
        Moneda mon = null;
        try {
            String str = "SELECT * FROM MONEDA WHERE NOMENCLATURA = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(str);
            st.setString(1,nomenclatura);
            ResultSet res = st.executeQuery();
            if (res.next()){
                mon = convertir(res);
            }
        } catch (SQLException e) {
            throw new OctoElemNotFoundException("error! no se encontró el elemento con nomenclatura: " + nomenclatura);
        }
        return mon;
    }
}
