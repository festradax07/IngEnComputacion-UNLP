package Octo.Exceptions;

public class OctoDBException extends RuntimeException {
    // utilizado para fallas en la base de datos en la parte de creación y listado.
    public OctoDBException(String message) {
        super(message);
    }
}
