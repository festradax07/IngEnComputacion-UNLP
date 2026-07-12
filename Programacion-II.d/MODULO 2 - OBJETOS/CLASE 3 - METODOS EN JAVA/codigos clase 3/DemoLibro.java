/*
 Programa que instancia un objeto libro e inicializa sus v.i.s enviando mensajes set#
 */

public class DemoLibro {

    public static void main(String[] args) {
        Libro libro = new Libro();
        libro.setTitulo("Java: A Beginner's Guide");
        libro.setEditorial("Mcgraw-Hill");
        libro.setAñoEdicion(2014);
        libro.setPrimerAutor("Herbert Schildt");
        libro.setISBN("978-0071809252");
        libro.setPrecio(21.72);
        libro.setIdioma("Inglés");
        libro.setCantidadEnStock(100);
        libro.setPaginas(699);
		System.out.println(libro.toString());
        //System.out.println(libro); /* invoca automaticamente al metodo toString */

    }
    
}
