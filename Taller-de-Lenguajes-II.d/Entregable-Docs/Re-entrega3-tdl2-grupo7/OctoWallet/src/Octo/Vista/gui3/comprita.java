package Octo.Vista.gui3;

import Octo.Controlador.Sesion;
import Octo.Controlador.Vistas.ControllerComprita;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JSeparator;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JTextField;
import javax.swing.JList;
import javax.swing.JComboBox;
import javax.swing.JButton;

import java.awt.*;
import javax.swing.DefaultComboBoxModel;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

public class comprita extends JPanel {

	private static final long serialVersionUID = 1L;
	private JTextField textField;
	private JPanel mainPanel;

	/**
	 * Create the panel.
	 */
	public comprita(JPanel mainPanel, ControllerComprita controller) {
		setBackground(new Color(255, 255, 255));
		
		this.mainPanel=mainPanel;
		
		JLabel lblNewLabel = new JLabel("OctoWallet - Compra");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNewLabel.setForeground(new Color(128, 128, 128));
		
		JSeparator separator = new JSeparator();
		
		JLabel lblNewLabel_5 = new JLabel("Quiero comprar con");
		lblNewLabel_5.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		textField = new JTextField();
		textField.setColumns(10);
		controller.setTextField(textField);

		JButton btnNewButton = new JButton("Convertir\r\n");

		btnNewButton.setForeground(new Color(255, 255, 255));
		btnNewButton.setBackground(new Color(165, 199, 183));
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		JLabel lblNewLabel_6 = new JLabel("Equivale a....");
		lblNewLabel_6.setFont(new Font("Tahoma", Font.BOLD, 14));
		
		JLabel lblNewLabel_7 = new JLabel("?\r\n");
		lblNewLabel_7.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_7.setPreferredSize(new Dimension(300, 50));
		btnNewButton.addActionListener(controller.getConvertir(lblNewLabel_7));
		JComboBox comboBox = new JComboBox();
		comboBox.setModel(new DefaultComboBoxModel(new String[] {"ARS", "USD"}));
		controller.setComboBox(comboBox);

		JButton btnNewButton_1 = new JButton("Realizar Compra");
		btnNewButton_1.setForeground(new Color(255, 255, 255));
		btnNewButton_1.setBackground(new Color(151, 177, 249));
		btnNewButton_1.addActionListener(controller.getComprarActionListener());
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		JButton btnNewButton_2 = new JButton("Cancelar");
		btnNewButton_2.setForeground(new Color(255, 255, 255));
		btnNewButton_2.setBackground(new Color(151, 177, 249));
		btnNewButton_2.addActionListener(controller.getCancelarActionListener());
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		JLabel lblNewLabel_1 = new JLabel("Stock disponible:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 14));
		
		JLabel lblNewLabel_2 = new JLabel("Precio de Compra:\r\n");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 14));

		JLabel lblNewLabel_3 = new JLabel("muestra");
		controller.setStockLabel(lblNewLabel_3);

		JLabel lblNewLabel_4 = new JLabel("New label");
		controller.setPriceLabel(lblNewLabel_4);
		this.addComponentListener(new ComponentAdapter() {
									  @Override
									  public void componentShown(ComponentEvent e) {
										  try {
											  if (Sesion.getInstance() != null && Sesion.getInstance().getCriptoCompra() != null) {
												  controller.updateStockAndPrice(Sesion.getInstance().getCriptoCompra());
											  } else {
												  System.err.println("CriptoCompra no está disponible o Sesion no inicializada.");
												  // Opcional: Mostrar mensaje en un JLabel para el usuario.
											  }
										  } catch (Exception ex) {
											  ex.printStackTrace();
											  System.err.println("Error al actualizar stock y precio: " + ex.getMessage());
										  }
									  }
								  });

		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
						.addComponent(separator, GroupLayout.DEFAULT_SIZE, 912, Short.MAX_VALUE)
						.addGroup(groupLayout.createSequentialGroup()
							.addContainerGap()
							.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(lblNewLabel_5)
									.addGap(6))
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(lblNewLabel_6, GroupLayout.PREFERRED_SIZE, 97, GroupLayout.PREFERRED_SIZE)
									.addGap(29)))
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(textField, GroupLayout.PREFERRED_SIZE, 67, GroupLayout.PREFERRED_SIZE)
									.addGap(18)
									.addComponent(comboBox, GroupLayout.PREFERRED_SIZE, 67, GroupLayout.PREFERRED_SIZE)
									.addGap(26)
									.addComponent(btnNewButton))
								.addComponent(lblNewLabel_7, 0, 0, Short.MAX_VALUE))
							.addGap(509)))
					.addGap(0))
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(79)
					.addComponent(btnNewButton_1)
					.addGap(87)
					.addComponent(btnNewButton_2)
					.addContainerGap(530, Short.MAX_VALUE))
				.addGroup(groupLayout.createSequentialGroup()
					.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 135, GroupLayout.PREFERRED_SIZE)
					.addContainerGap())
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
						.addComponent(lblNewLabel_2, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(lblNewLabel_1, GroupLayout.DEFAULT_SIZE, 133, Short.MAX_VALUE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
						.addComponent(lblNewLabel_4, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(lblNewLabel_3, GroupLayout.DEFAULT_SIZE, 95, Short.MAX_VALUE))
					.addContainerGap(668, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(separator, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addGap(36)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_1)
						.addComponent(lblNewLabel_3))
					.addGap(26)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_2)
						.addComponent(lblNewLabel_4))
					.addPreferredGap(ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(textField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(lblNewLabel_5)
						.addComponent(comboBox, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(btnNewButton, GroupLayout.PREFERRED_SIZE, 23, GroupLayout.PREFERRED_SIZE))
					.addGap(30)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_6)
						.addComponent(lblNewLabel_7, GroupLayout.PREFERRED_SIZE, 17, GroupLayout.PREFERRED_SIZE))
					.addGap(38)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnNewButton_1)
						.addComponent(btnNewButton_2))
					.addGap(34))
		);
		setLayout(groupLayout);

	}
}
