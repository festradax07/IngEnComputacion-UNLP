package Octo.Modelo.DAO;

import Octo.Modelo.Entidad.Moneda;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// acá me encargo de darle forma a la conexion pasando los objetos a la bbdd
public class DaoMonedaImpl implements DaoMoneda{
    @Override
    public void crear(Moneda dato) {
        try {
            Statement st = Conexion.getConexion().createStatement();
            String sql = "INSERT INTO MONEDA (TIPO, NOMBRE, NOMENCLATURA, VALOR_DOLAR, VOLATILIDAD, STOCK)" +
                        "VALUES('" + dato.getTipo() + "', '"+ dato.getNombre() + "', '"+ dato.getNomenclatura() + "', '"
                        + dato.getCotizacion() + "', '" + dato.getVolatilidad()+ "', '" + dato.getStock() + "');";
                // se puede usar sets de Statement y los campos para evitar errores de tipeo.
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
        }
    }

    @Override
    public List<Moneda> listar() {
        List<Moneda> monedas = new ArrayList<>(); Moneda moneda;
        try {
            Statement st= Conexion.getConexion().createStatement();
            ResultSet res = st.executeQuery("SELECT * FROM MONEDA");
            while( res.next()) {
                monedas.add(convertir(res));
            }
            res.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return monedas;
    }
    private Moneda convertir(ResultSet rs) throws SQLException{
        Moneda moneda = new Moneda();
        moneda.setTipo(rs.getString("TIPO"));
        moneda.setNombre(rs.getString("NOMBRE"));
        moneda.setNomenclatura(rs.getString("NOMENCLATURA"));
        moneda.setCotizacion(rs.getDouble("VALOR_DOLAR"));
        moneda.setVolatilidad(rs.getDouble("VOLATILIDAD"));
        moneda.setStock(rs.getDouble("STOCK"));
        return moneda;
    }
    @Override
    public Moneda obtener(String nomenclatura){
        Moneda mon = null;
        try {
            String str = "SELECT FROM MONEDA WHERE NOMENCLATURA = ?";
            PreparedStatement st = Conexion.getConexion().prepareStatement(str);
            st.setString(1,nomenclatura);
            ResultSet res = st.executeQuery();
            if (res.next()){
                mon = convertir(res);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return mon;
    }
}
