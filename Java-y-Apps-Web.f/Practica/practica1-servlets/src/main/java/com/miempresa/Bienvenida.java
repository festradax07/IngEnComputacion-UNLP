package com.miempresa;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Bienvenida extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head><title>Saludo</title></head>");
        out.println("<body>");
        out.println("<h1>Bienvenido " + nombre + "</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}
