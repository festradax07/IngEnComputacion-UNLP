package Octo.Controlador.Vistas;


import Octo.Controlador.Sesion;
import Octo.Modelo.JDBC.DaoTransaccionImpl;
import Octo.Modelo.Entidad.Transaccion;
import Octo.Vista.gui3.operaciones;
import Octo.Vista.gui3.vistas;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class ControllerOperaciones {
    private JPanel mainPanel;
    private JPanel textArea;
    private DaoTransaccionImpl daoTransaccion;
    private int cantTransacciones;
    private vistas views;
    private JPanel ContentPane;
    
    public ControllerOperaciones(JPanel mainPanel,JPanel ContentPane, vistas views) {
        this.mainPanel = mainPanel;
        this.ContentPane = ContentPane;
        this.views = views;
        this.daoTransaccion = new DaoTransaccionImpl();
    }
    
    public ActionListener getVolverActionListener() {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
               // CardLayout cl = (CardLayout)mainPanel.getLayout();
               // cl.show(mainPanel, "misActivos");
                showPanel("misActivos");
            }
        };
    }

    public void actualizarTransacciones(operaciones mainPanel1) {
            List<Transaccion> transacciones = daoTransaccion.listarPorId(Sesion.getInstance().getUser().getUserId());
            if ((transacciones!= null) && (transacciones.size() > cantTransacciones)){
                for (int i = cantTransacciones; i<transacciones.size(); i++) {
                    String[] partes = transacciones.get(i).getResumen().split(",");
                    String tipo = "Transacción: " + partes[0];
                    String monto = partes[1];
                    mainPanel1.agregarTransaccion(tipo,monto,transacciones.get(i).getFechaHora().toString());
                }
                cantTransacciones= transacciones.size();
            }
    }
    public void showPanel(String name) {
        CardLayout cardLayout = (CardLayout) mainPanel.getLayout();
        cardLayout.show(mainPanel, name);
        for (Component comp : mainPanel.getComponents()) {
            if (comp.isVisible()) {
                Dimension preferredSize = comp.getPreferredSize();
                mainPanel.setPreferredSize(preferredSize);
                views.getContentPane().setPreferredSize(preferredSize);
                views.pack();
                views.setLocationRelativeTo(null);
                break;
            }
        }
    }
}

