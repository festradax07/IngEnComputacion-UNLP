package Octo.Vista.gui3;

import Octo.Controlador.Vistas.ControllerOperaciones;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

public class operaciones extends JPanel {

    private static final long serialVersionUID = 1L;
    private JPanel mainPanel;
    private JPanel transacciones;

    public operaciones(JPanel mainPanel, ControllerOperaciones controller) {

        this.mainPanel = mainPanel;
        setBackground(new Color(255, 255, 255));

        JLabel lblTitulo = new JLabel("OctoWallet - Mis Operaciones");
        lblTitulo.setForeground(new Color(96, 96, 96));
        lblTitulo.setFont(new Font("Tahoma", Font.BOLD, 18));

        JSeparator separator = new JSeparator();

        JButton btnVolver = new JButton("Volver");
        btnVolver.setForeground(Color.WHITE);
        btnVolver.setBackground(new Color(100, 149, 237));
        btnVolver.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnVolver.addActionListener(controller.getVolverActionListener());

        // Panel para contener las tarjetas
        JPanel panelTransacciones = new JPanel();
        panelTransacciones.setLayout(new BoxLayout(panelTransacciones, BoxLayout.Y_AXIS));
        panelTransacciones.setBackground(new Color(244, 244, 244));

        // Scroll para las transacciones
        JScrollPane scrollPane = new JScrollPane(panelTransacciones);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        // Layout principal
        GroupLayout groupLayout = new GroupLayout(this);
        groupLayout.setHorizontalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addComponent(separator, GroupLayout.DEFAULT_SIZE, 450, Short.MAX_VALUE)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(lblTitulo)
                                .addContainerGap(300, Short.MAX_VALUE))
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 430, Short.MAX_VALUE)
                                .addContainerGap())
                        .addGroup(groupLayout.createSequentialGroup()
                                .addGap(175)
                                .addComponent(btnVolver, GroupLayout.PREFERRED_SIZE, 100, GroupLayout.PREFERRED_SIZE)
                                .addContainerGap(175, Short.MAX_VALUE))
        );
        groupLayout.setVerticalGroup(
                groupLayout.createParallelGroup(Alignment.LEADING)
                        .addGroup(groupLayout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(lblTitulo)
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(separator, GroupLayout.PREFERRED_SIZE, 2, GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 300, Short.MAX_VALUE)
                                .addPreferredGap(ComponentPlacement.UNRELATED)
                                .addComponent(btnVolver)
                                .addContainerGap())
        );

        setLayout(groupLayout);
        transacciones = panelTransacciones;

        this.addComponentListener(new ComponentAdapter() {
            @Override
            public void componentShown(ComponentEvent e) {
                controller.actualizarTransacciones(operaciones.this);
            }
        });
    }

    public void agregarTransaccion(String transaccion, String monto, String fecha) {
        JPanel nuevaTarjeta = crearTarjetaTransaccion(transaccion, monto, fecha);
        transacciones.add(nuevaTarjeta);
        actualizarPanelTransacciones();
    }

    private void actualizarPanelTransacciones() {
        int alturaTarjeta = 80; // Altura aproximada de cada tarjeta
        int margen = 10; // Margen entre tarjetas
        int totalTarjetas = transacciones.getComponentCount();
        int alturaTotal = totalTarjetas * (alturaTarjeta + margen);

        transacciones.setPreferredSize(new Dimension(transacciones.getWidth(), alturaTotal));
        transacciones.revalidate();
        transacciones.repaint();
    }

    private JPanel crearTarjetaTransaccion(String titulo, String monto, String fecha) {
        JPanel tarjeta = new JPanel();
        tarjeta.setBackground(Color.WHITE);
        tarjeta.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(200, 200, 200), 1),
                BorderFactory.createEmptyBorder(10, 10, 10, 10)
        ));
        tarjeta.setLayout(new BorderLayout(10, 10));

        JLabel lblTitulo = new JLabel(titulo);
        lblTitulo.setFont(new Font("Tahoma", Font.BOLD, 14));

        JLabel lblMonto = new JLabel(monto);
        lblMonto.setFont(new Font("Tahoma", Font.PLAIN, 14));
        lblMonto.setHorizontalAlignment(SwingConstants.RIGHT);

        JLabel lblFecha = new JLabel(fecha);
        lblFecha.setFont(new Font("Tahoma", Font.ITALIC, 12));
        lblFecha.setForeground(new Color(150, 150, 150));

        JPanel contenidoSuperior = new JPanel(new BorderLayout());
        contenidoSuperior.setOpaque(false);
        contenidoSuperior.add(lblTitulo, BorderLayout.WEST);
        contenidoSuperior.add(lblMonto, BorderLayout.EAST);

        tarjeta.add(contenidoSuperior, BorderLayout.NORTH);
        tarjeta.add(lblFecha, BorderLayout.SOUTH);

        return tarjeta;
    }
}
