package misServlets;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;


public class Productos extends HttpServlet {

    private Map<String, Integer> golosinas;
    private Integer cantidad;
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        golosinas = new LinkedHashMap<>(); // mantiene el orden de inserción

        Enumeration<String> nombres = config.getInitParameterNames();
        while (nombres.hasMoreElements()) {
            String param = nombres.nextElement();

            if (param.startsWith("golo")) {
                String nombreProducto = config.getInitParameter(param);
                String numero = param.substring(4); // extrae el número después de 'golo'

                String precioParam = "pu" + numero;
                String precioStr = config.getInitParameter(precioParam);

                if (precioStr != null) {
                    try {
                        int precio = Integer.parseInt(precioStr);
                        golosinas.put(nombreProducto, precio);
                    } catch (NumberFormatException e) {
                        System.err.println("Precio inválido para producto " + nombreProducto);
                    }
                }
            }
        }

        // Almacenar en el ServletContext para que Facturar lo use
        getServletContext().setAttribute("precios", golosinas);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        Map<String, Integer> precios = (Map<String, Integer>) getServletContext().getAttribute("precios");

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html><html><head><title>Productos</title></head><body>");
            out.println("<h1>Seleccione las cantidades que desea comprar</h1>");
            out.println("<form action=\"" + request.getContextPath() + "/Facturar\" method=\"POST\">");
            out.println("<table border='1'>");
            out.println("<tr><th>Producto</th><th>Precio Unitario</th><th>Cantidad</th></tr>");

            for (Map.Entry<String, Integer> entry : precios.entrySet()) {
                String producto = entry.getKey();
                int precio = entry.getValue();

                out.println("<tr>");
                out.println("<td>" + producto + "</td>");
                out.println("<td>" + precio + "</td>");
                out.println("<td><input type='number' name='cantidad_" + producto + "' min='0' value='0'></td>");
                out.println("</tr>");
            }

            out.println("</table><br>");
            out.println("<input type='submit' value='Facturar'>");
            out.println("</form>");
            out.println("<br><a href='" + request.getContextPath() + "/TerminarSesion'>Salir</a>");
            out.println("</body></html>");
        }
    }
    }
