package Octo.Controlador.Vistas;


import Octo.Controlador.Sesion;
import Octo.Controlador.Utilitario.ExportCSV;
import Octo.Controlador.Utilitario.ExportPDF;
import Octo.Modelo.Entidad.Activo;
import Octo.Modelo.Entidad.Moneda;
import Octo.Modelo.JDBC.FactoryDao;
import Octo.Servicios.AppServices.ActivosService;
import Octo.Vista.gui3.vistas;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class ControllerMisActivos {
    private JPanel mainPanel;
    private List<Activo> activos = new ArrayList<>();
    private JLabel userNameLabel;
    private vistas views;
    private JPanel ContentPane;

    public ControllerMisActivos(JPanel mainPanel,JPanel ContentPane, vistas views) {
    	
        this.mainPanel = mainPanel;
        this.ContentPane = ContentPane;
        this.views = views;
    }

    public ActionListener getCotizacionesActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
              // CardLayout cl = (CardLayout) mainPanel.getLayout();
              // cl.show(mainPanel, "cotizacion");
                showPanel("cotizacion");
            }
        };
    }

    public ActionListener getTransaccionesActionListener() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //CardLayout cl = (CardLayout) mainPanel.getLayout();
                //cl.show(mainPanel, "operaciones");
                showPanel("operaciones");
            }
        };
    }

    public ActionListener getExportarPDFListener(JTable table) {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                ExportPDF.printToPDF(table);
                JOptionPane.showMessageDialog(null, "Archivo PDF exportado con éxito a la carpeta Descargas.");
            }
        };
    }
    public ActionListener getExportarActionListener() {
        return new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    ExportCSV.exportToCSV(activos);
                    JOptionPane.showMessageDialog(null, "Archivo CSV exportado con éxito a la carpeta Descargas.");
                } catch (IOException ex) {
                    JOptionPane.showMessageDialog(null, "Error al exportar el archivo CSV: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        };
    }

    public void setUserNameLabel(JLabel label) {
        this.userNameLabel = label;
    }
    public double obtenerBalance(){
        double pesoDolar = FactoryDao.getMoneda().obtenerPorNomenclatura("ARS").getCotizacion();
        return activos.stream()
                .mapToDouble(act -> "ARS".equals(act.getMoneda().getNomenclatura())
                        ? act.getSaldo()  // Sumar directo si es ARS
                        : act.getSaldo() / pesoDolar // Convertir si es otra moneda
                )
                .sum();
    }
    public void ModificarUserName() {
        String nombre = Sesion.getInstance().getUser().getNombres() + " " + Sesion.getInstance().getUser().getApellidos();
        this.userNameLabel.setText(nombre);
    }

    public ActionListener getCerrarSesion() {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Sesion.getInstance().cerrarSesion();
                //CardLayout cl = (CardLayout) mainPanel.getLayout();
                //cl.show(mainPanel, "login");
                showPanel("login");
            }
        };
    }

    public ActionListener getGenerarDatos(DefaultTableModel table, JLabel label) {
        return new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(activos!=null) {
                    activos.clear();
                    FactoryDao.getCrypto().borrar(Sesion.getInstance().getUser().getUserId());// deberia borrar activos del usuario
                    FactoryDao.getFiat().borrar(Sesion.getInstance().getUser().getUserId());
                }
                List<String> criptosMVP = Arrays.asList("BTC", "ETH","doge");
                List<Moneda> monedas = new ArrayList<>();
                criptosMVP.stream().forEach(cripto -> monedas.add(FactoryDao.getMoneda().obtenerPorNomenclatura(cripto.toLowerCase())));
                activos = ActivosService.crearActivosDefault(monedas);
                cargarDatosEnTabla(table,label);
                ActivosService.darStock(monedas);
                JOptionPane.showMessageDialog(null, "datos de prueba generados correctamente.");

            }
        };
    }
        public void cargarDatosEnTabla(DefaultTableModel table, JLabel label){
           activos = FactoryDao.getCrypto().listarPorId(Sesion.getInstance().getUser().getUserId());
           activos.addAll(FactoryDao.getFiat().listarPorId(Sesion.getInstance().getUser().getUserId()));
           DecimalFormat formato = new DecimalFormat("#,##0.00");
           label.setText("ARS $" + formato.format(obtenerBalance()));
           table.setRowCount(0);
            // Iterar sobre los activos para llenar la tabla
            for (Activo activo : activos) {
                try {
                    // Determinar el icono basado en el tipo de moneda
                    ImageIcon icono;
                        icono = new ImageIcon(
                                new ImageIcon(new URL(activo.getMoneda().getImagen()))
                                        .getImage()
                                        .getScaledInstance(32, 32, Image.SCALE_SMOOTH)
                        );

                    // Agregar una nueva fila a la tabla con los datos del activo
                    table.addRow(new Object[] {
                            icono,
                            activo.getMoneda().getNombre(),
                            formato.format(activo.getSaldo())
                    });
                } catch (MalformedURLException e) {
                    // Manejo de la excepción en caso de URL mal formada
                    throw new RuntimeException("Error al cargar la imagen de la moneda: " + e.getMessage(), e);
                }
            }
        };

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