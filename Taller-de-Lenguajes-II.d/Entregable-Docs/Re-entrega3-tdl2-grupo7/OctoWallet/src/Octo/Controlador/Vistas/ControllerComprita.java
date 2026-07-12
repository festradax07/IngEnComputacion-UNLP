package Octo.Controlador.Vistas;

import Octo.Controlador.Sesion;
import Octo.Servicios.AppServices.FiatConsumo;
import Octo.Exceptions.OctoElemNotFoundException;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.JDBC.DaoTransaccionImpl;
import Octo.Vista.gui3.vistas;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DecimalFormat;
import java.util.Optional;

import Octo.Modelo.JDBC.FactoryDao;


public class ControllerComprita {

    private JPanel mainPanel;
    private JPanel contentPane;
    private DaoTransaccionImpl daoTransaccion;
    private JTextField textField;
    private JComboBox<String> comboBox;
    private JLabel stockLabel;
    private JLabel priceLabel;
    private vistas views;
    
    public ControllerComprita(JPanel mainPanel, JPanel contentPane, vistas views) {
    	
        this.mainPanel = mainPanel;
        this.contentPane = contentPane;
        this.views = views;
    }

    public ActionListener getCancelarActionListener() {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                //CardLayout cl = (CardLayout)mainPanel.getLayout();
                //cl.show(mainPanel, "cotizacion");
                showPanel("cotizacion");
            }
        };
    }

    public ActionListener getComprarActionListener() {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String fiat = (String) comboBox.getSelectedItem();

                double cantidad = Double.parseDouble(textField.getText());

                long criptoId = Sesion.getInstance().getIdCriptotByNom(Sesion.getInstance().getCriptoCompra());
                assert fiat != null;
                long fiatId = FiatConsumo.getFiatId(fiat);

                try {
                    FactoryDao.getTransaccion().comprarCriptoMonedas(criptoId,fiatId ,cantidad);
                    JOptionPane.showMessageDialog(mainPanel, "Compra realizada con éxito.");
                   //CardLayout cl = (CardLayout)mainPanel.getLayout();
                   //cl.show(mainPanel, "cotizacion");
                   showPanel("cotizacion");
                } catch (OctoElemNotFoundException o) {
                    JOptionPane.showMessageDialog(mainPanel, "La compra no se pudo realizar. No tienes saldo suficiente");
                }
            }
        };
    }

    public ActionListener getConvertir(JLabel label1) {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (textField.getText().isEmpty()) {
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese una cantidad antes de convertir.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    return;
                }

                try {
                    String cripto = Sesion.getInstance().getCriptoCompra();
                    double cantidad = Double.parseDouble(textField.getText())*FiatConsumo.getFiat(comboBox.getSelectedItem().toString()).getCotizacion();
                    Optional<Moneda> monedaEncontrada = Sesion.getInstance().getMonedasDisponibles().stream()
                            .filter(moneda -> moneda.getNomenclatura().equals(cripto)).findFirst();

                    if (monedaEncontrada.isPresent()) {
                        Moneda moneda = monedaEncontrada.get();
                        double cotizacion = moneda.getCotizacion();
                        double total = cantidad / cotizacion;
                        System.out.println("Total a pagar: " + total);
                        DecimalFormat formato = new DecimalFormat("#,##0.00");
                        label1.setText(formato.format(total)+ "USD" );
                    } else {
                        JOptionPane.showMessageDialog(null, "Error, no se tienen datos de esa moneda.", "Error", JOptionPane.ERROR_MESSAGE);
                    }
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(null, "Por favor, ingrese un número válido.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        };
    }

    public void updateStockAndPrice(String cripto) {
        try {
            double stock = Sesion.getInstance().getStockByNom(cripto);
            double price = Sesion.getInstance().getCotizacionByNom(cripto);
            System.out.println("stock;"+ stock);
            stockLabel.setText(String.format("%.2f", stock)); // Mostrar con 2 decimales
            priceLabel.setText(String.format("%.2f", price));
        } catch (Exception e) {
            stockLabel.setText("N/A");
            priceLabel.setText("N/A");
            JOptionPane.showMessageDialog(null,"Error al conseguir stock y precio, intente más tarde");
        }
    }


    public void setStockLabel(JLabel stockLabel) {
        this.stockLabel = stockLabel;
    }

    public void setPriceLabel(JLabel priceLabel) {
        this.priceLabel = priceLabel;
    }

    public void setComboBox(JComboBox<String> comboBox) {
        this.comboBox = comboBox;
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
