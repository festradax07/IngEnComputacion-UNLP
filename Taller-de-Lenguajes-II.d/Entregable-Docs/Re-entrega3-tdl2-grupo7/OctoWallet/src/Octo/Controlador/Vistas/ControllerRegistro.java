package Octo.Controlador.Vistas;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import Octo.Vista.gui3.vistas;
import Octo.Modelo.Entidad.User;
import Octo.Modelo.JDBC.FactoryDao;

public class ControllerRegistro {
    private JTextField textField;
    private JTextField passwordField;
    private JPanel mainPanel;
    private JPanel contentPane;
    private JCheckBox chckbxNewCheckBox;
    private JTextField ApellidoField;
    private JTextField NombreField;
    private JPasswordField passR;
    private vistas views;
    
    
    public ControllerRegistro(JPanel mainPanel, JPanel contentPane, vistas views) {
        this.mainPanel = mainPanel;
        this.contentPane = contentPane;
        this.views = views;
    }
    
    public ActionListener getVolverActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //CardLayout cl = (CardLayout)mainPanel.getLayout();
                //cl.show(mainPanel, "login");
                showPanel("login");
            }
        };
    }

    public ActionListener getRegistrarActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                 String email = textField.getText();
                 String password = passwordField.getText();
                 String passr = new String(passR.getPassword());
                 
                  if (email.isEmpty()) {
                    JOptionPane.showMessageDialog(mainPanel, "El mail no puede estar vacio.");
                    return;
                  }

                  if (password.isEmpty()) {
                    JOptionPane.showMessageDialog(mainPanel, "la contrasena no puede estar vacia.");
                     return;
                  }
                  
                  if (passr.isEmpty()) {
      	            JOptionPane.showMessageDialog(mainPanel, "Debe confirmar su contraseña.");
      	            return;
      	        }

      	        // Validar que las contraseñas coincidan
      	        if (!password.equals(passr)) {
      	            JOptionPane.showMessageDialog(mainPanel, "Las contraseñas no coinciden.");
      	            return;
      	        }
                  
                  if (FactoryDao.getUsuario().verificarMail(email)&& (chckbxNewCheckBox.isSelected())) {
                      FactoryDao.getUsuario().crear(new User(NombreField.getText(), email, password, ApellidoField.getText(), true, -1));
                      textField.setText("");
                      passwordField.setText("");
                      ApellidoField.setText("");
                      NombreField.setText("");
                      passR.setText("");
                      //CardLayout cl = (CardLayout)mainPanel.getLayout();
                      //cl.show(mainPanel, "login");
                      showPanel("login");
                      chckbxNewCheckBox.setSelected(false);
                 } else {
                    JOptionPane.showMessageDialog(mainPanel, "la verificacion del mail fallo.");
                }
            };
        };
   }
    public void setTextField(JTextField textField) {
        this.textField = textField;
    }
    public void setApellido(JTextField AtextField) {
        this.ApellidoField = AtextField;
    }
    public void setNombre(JTextField NtextField) {
        this.NombreField = NtextField;
    }
    public void setPasswordField(JTextField passwordField) {
        this.passwordField = passwordField;
    }
    public void setChckbxNewCheckBox(JCheckBox chckbxNewCheckBox) {
        this.chckbxNewCheckBox = chckbxNewCheckBox;
    }
    
    public void setPassworldFieldR(JPasswordField passR) {
    	this.passR = passR;
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
