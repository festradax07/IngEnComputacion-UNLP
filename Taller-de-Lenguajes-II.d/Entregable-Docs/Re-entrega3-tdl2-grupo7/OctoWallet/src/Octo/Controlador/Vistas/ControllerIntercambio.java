package Octo.Controlador.Vistas;

import Octo.Controlador.Sesion;
import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.JDBC.FactoryDao;
import Octo.Vista.gui3.vistas;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ControllerIntercambio {

    private JPanel mainPanel;
    private JPanel contentPane;
    private JLabel selectedCripto;
    private JComboBox<String> comboBox_1;
    private JTextField textField;
    private JLabel userNameLabel;
    private vistas views;
    public ControllerIntercambio(JPanel mainPanel, JPanel contentPane, vistas views) {
    	
        this.mainPanel = mainPanel;
        this.contentPane = contentPane;
        this.views = views;
    }

    public ActionListener getVolverActionListener() {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
               // CardLayout cl = (CardLayout)mainPanel.getLayout();
               // cl.show(mainPanel, "cotizacion");
                showPanel("cotizacion");
            }
        };
    }

    public ActionListener getCerrarSesion(){
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Sesion.getInstance().cerrarSesion();
               // CardLayout cl = (CardLayout)mainPanel.getLayout();
                //cl.show(mainPanel, "login");
                showPanel("login");
            }
        };
    }

    public ActionListener getRealizarSwap() {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (textField.getText().isEmpty()) {
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese una cantidad antes de convertir.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    return;
                }
                String criptoACambiar = selectedCripto.getText().toString();
                String criptoEsperadaStr = comboBox_1.getSelectedItem().toString().toLowerCase();
                if(criptoEsperadaStr.equals(criptoACambiar)){
                    JOptionPane.showMessageDialog(null,"error! no se puede intercambiar con la misma moneda!");
                    return;
                }
                double cantidad = Double.parseDouble(textField.getText());

                long criptoOriginal = Sesion.getInstance().getIdCriptotByNom(criptoACambiar);
                long criptoEsperada = Sesion.getInstance().getIdCriptotByNom(criptoEsperadaStr);

               try{
                   FactoryDao.getTransaccion().swap(criptoOriginal, cantidad, criptoEsperada);
                   JOptionPane.showMessageDialog(mainPanel, "Swap realizado con éxito.");
                   //CardLayout cl = (CardLayout)mainPanel.getLayout();
                   //cl.show(mainPanel, "misActivos");
               }catch (OctoElemNotFoundException o) {
                   JOptionPane.showMessageDialog(null, o.getMessage());
               }
            }
        };
    }

    public void setUserNameLabel(JLabel label) {
        this.userNameLabel = label;
    }

    public void ModificarUserName() {
        String nombre = Sesion.getInstance().getUser().getNombres() + " " + Sesion.getInstance().getUser().getApellidos();
        this.userNameLabel.setText(nombre);
    }
    public void getCripto(){
        selectedCripto.setText(Sesion.getInstance().getCriptoCompra());
    }

    public void setLabel(JLabel j) {
        this.selectedCripto= j;
    }

    public void setComboBox_1(JComboBox<String> comboBox_1) {
        this.comboBox_1 = comboBox_1;
    }

    public void setTextField(JTextField textField) {
        this.textField = textField;
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