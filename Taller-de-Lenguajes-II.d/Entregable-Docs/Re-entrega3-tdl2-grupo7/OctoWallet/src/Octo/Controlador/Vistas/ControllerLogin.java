package Octo.Controlador.Vistas;

import Octo.Controlador.Control;
import Octo.Controlador.Sesion;
import Octo.Modelo.Entidad.User;
import Octo.Modelo.JDBC.FactoryDao;
import Octo.Servicios.AppServices.CacheCryptoService;
import Octo.Vista.gui3.vistas;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ControllerLogin {
    private JTextField textField;
    private JPasswordField passwordField;
    private JPanel mainPanel;
    private JPanel contentPane;
    private vistas views;

    public ControllerLogin(JPanel mainPanel, JPanel contentPane, vistas views) {
        this.mainPanel = mainPanel;
        this.contentPane = contentPane;
        this.views = views;
    }

    public void setTextField(JTextField textField) {
        this.textField = textField;
    }

    public void setPasswordField(JPasswordField passwordField) {
        this.passwordField = passwordField;
    }

    public ActionListener getLimpiarActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                textField.setText("");
                passwordField.setText("");
            }
        };
    }
    public ActionListener getRegistreseActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
               // CardLayout cl = (CardLayout)mainPanel.getLayout();
               // cl.show(mainPanel, "registro");
                showPanel("registro");
            }
        };
    }
    public ActionListener getLoginActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if((!textField.getText().isEmpty()) && (!passwordField.getText().isEmpty())){
                    User a = FactoryDao.getUsuario().obtenerPorMail(textField.getText(), passwordField.getText());
                    if (a != null) {
                        Sesion.getInstance().setUser(a);
                        Sesion.getInstance().setMonedasDisponibles(CacheCryptoService.getInstancia().getCacheMonedas());
                        //CardLayout cl = (CardLayout)mainPanel.getLayout();
                        //cl.show(mainPanel, "misActivos");
                        showPanel("misActivos");

                        JOptionPane.showMessageDialog(null, "Bienvenido/a " + a.getNombres());
                    } else {
                        JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrectos");
                    }
                } else { JOptionPane.showMessageDialog(null, "Por favor complete los campos"); }
            }
        };
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
