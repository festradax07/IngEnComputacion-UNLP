package Octo.Vista.gui3;

import Octo.Controlador.Vistas.ControllerRegistro;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JSeparator;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JTextField;
import javax.swing.JCheckBox;
import javax.swing.JButton;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JPasswordField;

public class registro extends JPanel {

	private static final long serialVersionUID = 1L;
	private JTextField txtContra;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
    private JPanel mainPanel;
    private JPasswordField passCR1;
	/**
	 * Create the panel.
	 */
	public registro(JPanel mainPanel, ControllerRegistro controller) {
		setBackground(new Color(255, 255, 255));
		
		this.mainPanel=mainPanel;
		
		JLabel lblNewLabel = new JLabel("OctoWallet - Registro\r\n");
		lblNewLabel.setForeground(new Color(128, 128, 128));
		
		JSeparator separator = new JSeparator();
		
		JLabel contra1 = new JLabel("Contraseña:\r\n");
		contra1.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		txtContra = new JTextField();
		txtContra.setColumns(10);
		controller.setPasswordField(txtContra);

		JLabel lblNewLabel_3 = new JLabel("E-Mail:\r\n");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		textField_2 = new JTextField();
		textField_2.setColumns(10);
		controller.setTextField(textField_2);

		JLabel lblNewLabel_4 = new JLabel("Nombres:");
		lblNewLabel_4.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		textField_3 = new JTextField();
		textField_3.setColumns(10);
		controller.setNombre(textField_3);

		JLabel lblNewLabel_5 = new JLabel("Apellidos:\r\n");
		lblNewLabel_5.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		textField_4 = new JTextField();
		textField_4.setColumns(10);
		controller.setApellido(textField_4);

		JCheckBox chckbxNewCheckBox = new JCheckBox("Acepto los terminos y condiciones?\r\n");
		chckbxNewCheckBox.setBackground(new Color(255, 255, 255));
		chckbxNewCheckBox.setFont(new Font("Tahoma", Font.BOLD, 12));
		controller.setChckbxNewCheckBox(chckbxNewCheckBox);

		JButton btnNewButton = new JButton("Registrar\r\n");
		btnNewButton.setForeground(new Color(255, 255, 255));
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton.setBackground(new Color(151, 177, 249));
		btnNewButton.addActionListener(controller.getRegistrarActionListener());
		
		JButton btnNewButton_1 = new JButton("Volver al inicio\r\n");
		btnNewButton_1.setForeground(new Color(255, 255, 255));
		btnNewButton_1.setBackground(new Color(151, 177, 249));
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton_1.addActionListener(controller.getVolverActionListener());
		
		JLabel contraR1 = new JLabel("Repetir contraseña:");
		contraR1.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		passCR1 = new JPasswordField();
        controller.setPassworldFieldR(passCR1);
        
		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 123, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(197, Short.MAX_VALUE))
				.addGroup(groupLayout.createSequentialGroup()
					.addComponent(separator, GroupLayout.DEFAULT_SIZE, 485, Short.MAX_VALUE)
					.addGap(1))
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(27)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(chckbxNewCheckBox)
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(btnNewButton)
							.addGap(70)
							.addComponent(btnNewButton_1)))
					.addGap(172))
				.addGroup(groupLayout.createSequentialGroup()
					.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
						.addComponent(lblNewLabel_3)
						.addComponent(lblNewLabel_5)
						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
							.addComponent(contraR1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
							.addGroup(groupLayout.createSequentialGroup()
								.addGap(47)
								.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
									.addComponent(lblNewLabel_4)
									.addComponent(contra1)))))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
						.addComponent(txtContra)
						.addComponent(passCR1)
						.addComponent(textField_3)
						.addComponent(textField_4)
						.addComponent(textField_2))
					.addContainerGap(232, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel)
					.addGap(8)
					.addComponent(separator, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addGap(33)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(contra1)
						.addComponent(txtContra, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(19)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(contraR1)
						.addComponent(passCR1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_3)
						.addComponent(textField_2))
					.addGap(19)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_4)
						.addComponent(textField_3, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(12)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblNewLabel_5)
						.addComponent(textField_4, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addComponent(chckbxNewCheckBox)
					.addGap(26)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnNewButton)
						.addComponent(btnNewButton_1))
					.addGap(46))
		);
		setLayout(groupLayout);

	}
}
