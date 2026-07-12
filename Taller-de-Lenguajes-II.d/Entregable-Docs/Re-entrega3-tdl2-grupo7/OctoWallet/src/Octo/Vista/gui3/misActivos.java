package Octo.Vista.gui3;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JSeparator;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;
import javax.swing.ImageIcon;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.awt.event.ActionEvent;

import Octo.Controlador.Utilitario.*;
import Octo.Controlador.*;
import Octo.Controlador.Vistas.ControllerMisActivos;
import Octo.Modelo.Entidad.Activo;
import Octo.Modelo.Entidad.Moneda;

public class misActivos extends JPanel {

	private static final long serialVersionUID = 1L;
	private JPanel mainPanel;
	private JTable table;


	public misActivos(JPanel mainPanel, ControllerMisActivos controller) {
		setBackground(new Color(255, 255, 255));

		this.mainPanel=mainPanel;
		JLabel lblNewLabel = new JLabel("OctoWallet - Mis Activos\r\n");
		lblNewLabel.setBackground(new Color(128, 128, 128));
		lblNewLabel.setForeground(new Color(128, 128, 128));

		JSeparator separator = new JSeparator();
		separator.setBackground(new Color(128, 128, 128));

		JLabel lblNewLabel_1 = new JLabel("userName");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		controller.setUserNameLabel(lblNewLabel_1);

		JButton btnNewButton = new JButton("Cerrar Sesion\r\n");
		btnNewButton.addActionListener(controller.getCerrarSesion());
		btnNewButton.setForeground(new Color(255, 255, 255));
		btnNewButton.setBackground(new Color(151, 177, 249));
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 12));

		JButton btnNewButton_1 = new JButton("Generar Datos de Prueba\r\n");


		JLabel lblNewLabel_2 = new JLabel("Balance:");
		lblNewLabel_2.setIcon(new ImageIcon(misActivos.class.getResource("/imagenes/360_F_577821527_5sZgkA6qrLkwitzLc1ZroVoYkPvdUPlG.png")));
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 18));

		JLabel lblNewLabel_3 = new JLabel("ARS 0.00");
		lblNewLabel_3.setFont(new Font("Roboto", Font.BOLD, 18));


		JButton btnNewButton_2 = new JButton("Exportar como CSV");
		btnNewButton_2.addActionListener(controller.getExportarActionListener());

		btnNewButton_2.setForeground(new Color(255, 255, 255));
		btnNewButton_2.setBackground(new Color(151, 177, 249));
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 12));

		JButton btnNewButton_PDF = new JButton("Exportar como PDF");

		btnNewButton_PDF.setForeground(new Color(255, 255, 255));
		btnNewButton_PDF.setBackground(new Color(151, 177, 249));
		btnNewButton_PDF.setFont(new Font("Tahoma", Font.BOLD, 12));

		JButton btnNewButton_3 = new JButton("Transacciones");
		btnNewButton_3.setForeground(new Color(255, 255, 255));
		btnNewButton_3.setBackground(new Color(165, 215, 252));
		btnNewButton_3.addActionListener(controller.getTransaccionesActionListener());
		btnNewButton_3.setFont(new Font("Tahoma", Font.BOLD, 12));

		JButton btnNewButton_4 = new JButton("Cotizaciones\r\n");
		btnNewButton_4.addActionListener(controller.getCotizacionesActionListener());
		btnNewButton_4.setForeground(new Color(255, 255, 255));
		btnNewButton_4.setBackground(new Color(165, 215, 252));
		btnNewButton_4.setFont(new Font("Tahoma", Font.BOLD, 12));

		JLabel lblNewLabel_4 = new JLabel("");
		lblNewLabel_4.setIcon(new ImageIcon(misActivos.class.getResource("/imagenes/pulpito.png")));

		JScrollPane scrollPane = new JScrollPane(table);
		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.TRAILING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 151, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED, 70, Short.MAX_VALUE)
					.addComponent(lblNewLabel_4)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblNewLabel_1)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(btnNewButton)
					.addContainerGap())
				.addComponent(separator, GroupLayout.DEFAULT_SIZE, 460, Short.MAX_VALUE)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap(254, Short.MAX_VALUE)
					.addComponent(btnNewButton_1, GroupLayout.PREFERRED_SIZE, 196, GroupLayout.PREFERRED_SIZE)
					.addContainerGap())
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(48)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(lblNewLabel_2, GroupLayout.PREFERRED_SIZE, 129, GroupLayout.PREFERRED_SIZE)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addComponent(lblNewLabel_3, GroupLayout.PREFERRED_SIZE, 172, GroupLayout.PREFERRED_SIZE))
						.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
							.addComponent(scrollPane, Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 351, GroupLayout.PREFERRED_SIZE)
							.addGroup(groupLayout.createSequentialGroup()
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
									.addComponent(btnNewButton_2, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
									.addComponent(btnNewButton_3, GroupLayout.DEFAULT_SIZE, 164, Short.MAX_VALUE))
								.addPreferredGap(ComponentPlacement.RELATED, 40, Short.MAX_VALUE)
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
									.addComponent(btnNewButton_4, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
									.addComponent(btnNewButton_PDF, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))))
					.addGap(61))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addContainerGap()
							.addComponent(lblNewLabel))
						.addComponent(lblNewLabel_4)
						.addGroup(groupLayout.createSequentialGroup()
							.addContainerGap()
							.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
								.addComponent(lblNewLabel_1)
								.addComponent(btnNewButton))))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(separator, GroupLayout.PREFERRED_SIZE, 6, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(btnNewButton_1)
					.addGap(41)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_2)
						.addComponent(lblNewLabel_3))
					.addGap(30)
					.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 147, GroupLayout.PREFERRED_SIZE)
					.addGap(30)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnNewButton_2)
						.addComponent(btnNewButton_PDF, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
					.addGap(18)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(btnNewButton_4, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(btnNewButton_3, GroupLayout.PREFERRED_SIZE, 35, GroupLayout.PREFERRED_SIZE))
					.addContainerGap(36, Short.MAX_VALUE))
		);

		DefaultTableModel model = new DefaultTableModel(
				new Object[][] {
						{new ImageIcon(misActivos.class.getResource("/imagenes/bitcoin.png")), "Bitcoin", 0.0},
						{new ImageIcon(misActivos.class.getResource("/imagenes/USDC.png")), "USDC", 0.0},
						{new ImageIcon(misActivos.class.getResource("/imagenes/ethereum.png")), "Ethereum", 0.0},
				},
				new String[] {
						"Icono", "Cripto", "Monto"
				}
		) {
			Class<?>[] columnTypes = new Class[] {
					ImageIcon.class, String.class, Double.class
			};

			@Override
			public boolean isCellEditable(int row, int column) {
				return false; // Todas las celdas son no editables
			}

			@Override
			public Class<?> getColumnClass(int columnIndex) {
				return columnTypes[columnIndex];
			}
		};
		this.addComponentListener(new ComponentAdapter() {
			@Override
			public void componentShown(ComponentEvent e) {
				controller.cargarDatosEnTabla(model,lblNewLabel_3);
			}
		});

		btnNewButton_1.addActionListener(controller.getGenerarDatos(model,lblNewLabel_3));
		btnNewButton_1.setForeground(new Color(255, 255, 255));
		btnNewButton_1.setBackground(new Color(128, 0, 0));
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 12));

		this.table = new JTable(model);
		table.setFont(new Font("Tahoma", Font.PLAIN, 12));
		table.setRowHeight(100); // Ajustar altura para los iconos
		table.setEnabled(false); // Tabla no editable

		// Ordenación interactiva
		TableRowSorter<DefaultTableModel> sorter = new TableRowSorter<>(model);
		table.setRowSorter(sorter);


		DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
		centerRenderer.setHorizontalAlignment(SwingConstants.CENTER);

		// Aplicar el renderizador solo a las columnas de Nombre y Precio
		table.getColumnModel().getColumn(0).setCellRenderer(new imageRenderer());//columna "imagen"
		table.getColumnModel().getColumn(1).setCellRenderer(centerRenderer); // Columna "Nombre"
		table.getColumnModel().getColumn(2).setCellRenderer(centerRenderer); // Columna "Precio"

		// Ajustar ancho de las columnas
		table.getColumnModel().getColumn(0).setPreferredWidth(20); // Imagen
		table.getColumnModel().getColumn(1).setPreferredWidth(150); // Nombre
		table.getColumnModel().getColumn(2).setPreferredWidth(80);  // Precio


		table.setFillsViewportHeight(true);
		table.setColumnSelectionAllowed(false);
		table.setCellSelectionEnabled(false);
		scrollPane.setViewportView(table);
		setLayout(groupLayout);
		btnNewButton_PDF.addActionListener(controller.getExportarPDFListener(table));
		this.addComponentListener(new ComponentAdapter() {
			@Override
			public void componentShown(ComponentEvent e) {
				controller.ModificarUserName();
			}
		});
	}
}