package Octo.Modelo.Entidad;
import java.time.LocalDateTime;
public class Transaccion {
    private long id;
    private long idUsuario;
    private String resumen;
    private LocalDateTime fechaHora;
    // utilizar un objeto java.sql.timestamp para mandar a la bbdd



    public Transaccion(String resumen, LocalDateTime fechaHora, long idUsuario) {
        this.resumen = resumen;
        this.fechaHora = fechaHora;
        this.idUsuario = idUsuario;
    }

    public Transaccion(){
    }
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public LocalDateTime getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(LocalDateTime fechaHora) {
        this.fechaHora = fechaHora;
    }

    @Override
    public String toString() {
        return "resumen='" + resumen + '\t'+
                "fechaHora=" + fechaHora;
    }
}
