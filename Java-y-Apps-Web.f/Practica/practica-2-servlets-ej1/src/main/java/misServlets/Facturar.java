package misServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;

public class Facturar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect("login.html");
            return;
        }

        Map<String, Integer> precios = (Map<String, Integer>) getServletContext().getAttribute("precios");
        Map<String, Integer> cantidades = new LinkedHashMap<>();

        Enumeration<String> params = request.getParameterNames();
        double totalGeneral = 0;

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html><body>");
        out.println("<h2>Factura de compra:</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>Producto</th><th>Cantidad</th><th>Total</th></tr>");

        while (params.hasMoreElements()) {
            String param = params.nextElement();

            if (!param.startsWith("cantidad_")) continue;

            String producto = param.substring("cantidad_".length());
            String cantStr = request.getParameter(param);
            int cantidad = 0;
            try {
                cantidad = Integer.parseInt(cantStr);
            } catch (NumberFormatException ignored) {}

            int precio = precios.getOrDefault(producto, 0);
            double total = precio * cantidad;

            if (cantidad > 0) {
                cantidades.put(producto, cantidad);
                out.println("<tr><td>" + producto + "</td><td>" + cantidad + "</td><td>" + total + "</td></tr>");
                totalGeneral += total;
            }
        }

        sesion.setAttribute("cantidades", cantidades); // guardar para volver a Productos

        out.println("</table>");
        out.println("<h3>Total general: $" + totalGeneral + "</h3>");
        out.println("<br><a href='Productos'>Seguir comprando</a> | <a href='TerminarSesion'>Salir</a>");
        out.println("</body></html>");
    }
}
