package Octo.Vista;

import Octo.Modelo.Entidad.Transaccion;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class PanelOperaciones extends JPanel{
    private JTable tabla;
    private DefaultTableModel modeloTabla;
    public PanelOperaciones() {
        setLayout(new BorderLayout());

        // Header del panel
        JLabel titulo = new JLabel("Historial de Transacciones");
        titulo.setFont(new Font("Arial", Font.BOLD, 18));
        titulo.setHorizontalAlignment(SwingConstants.CENTER);
        add(titulo, BorderLayout.NORTH);

        // TABLA SETEADA
        String[] columnas = {"Fecha", "Descripción"};
        modeloTabla = new DefaultTableModel(columnas, 10);
        tabla = new JTable(modeloTabla);

        // para scrollear
        JScrollPane scrollPane = new JScrollPane(tabla);
        add(scrollPane, BorderLayout.CENTER);
    }
    public void cargarTransacciones(List<Transaccion> transacciones) {
        modeloTabla.setRowCount(0); // Limpiar datos previos
        for (Transaccion t : transacciones) {
            modeloTabla.addRow(new Object[]{t.getFechaHora(),t.getResumen()});
        }
    }

 }



