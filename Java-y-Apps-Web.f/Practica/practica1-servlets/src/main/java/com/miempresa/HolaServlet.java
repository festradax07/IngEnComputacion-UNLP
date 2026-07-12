package com.miempresa;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class HolaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Leer el parámetro "nombre" de la URL
        String nombre = request.getParameter("nombre");

        // Si no hay parámetro, usar un valor por defecto
        if (nombre == null || nombre.isBlank()) {
            nombre = "visitante";
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1>¡Hola desde Jakarta Servlet 6.0!</h1>");
    }
}
