package Octo.Modelo.Entidad;
import java.time.LocalDateTime;
public class Transaccion {
    private String resumen;
    private LocalDateTime fechaHora;
    // utilizar un objeto java.sql.timestamp para mandar a la bbdd


    public Transaccion(String resumen, LocalDateTime fechaHora) {
        this.resumen = resumen;
        this.fechaHora = fechaHora;
    }
    public Transaccion(){
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
        return "resumen='" + resumen + '\'' +
                ", fechaHora=" + fechaHora;
    }
}
