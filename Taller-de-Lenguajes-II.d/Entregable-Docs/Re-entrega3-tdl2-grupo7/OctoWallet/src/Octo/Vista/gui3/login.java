package Octo.Vista.gui3;


import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JSeparator;
import javax.swing.LayoutStyle.ComponentPlacement;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JPasswordField;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import Octo.Controlador.Vistas.ControllerLogin;

public class login extends JPanel {

	private static final long serialVersionUID = 1L;
	private JTextField textField;
	private JPasswordField passwordField;
	private JPanel mainPanel;

	public login(JPanel mainPanel, ControllerLogin controller) {
		setBackground(new Color(255, 255, 255));

		this.mainPanel=mainPanel;
		JLabel lblNewLabel = new JLabel("OctoWallet - Bienvenido\r\n");
		lblNewLabel.setForeground(new Color(128, 128, 128));

		JSeparator separator = new JSeparator();

		JLabel lblNewLabel_1 = new JLabel("E-Mail:\r\n");
		lblNewLabel_1.setFont(new Font("Segoe UI", Font.BOLD, 14));

		textField = new JTextField();
		textField.setColumns(10);

		JLabel lblNewLabel_1_1 = new JLabel("Contraseña:\r\n\r\n");
		lblNewLabel_1_1.setFont(new Font("Segoe UI", Font.BOLD, 14));

		JSeparator separator_1 = new JSeparator();

		JSeparator separator_1_1 = new JSeparator();

		JButton btnNewButton = new JButton("Login\r\n");
		btnNewButton.addActionListener(controller.getLoginActionListener());
		btnNewButton.setForeground(new Color(255, 255, 255));
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton.setBackground(new Color(151, 177, 249));

		controller.setTextField(textField);


		JButton btnNewButton_1 = new JButton("Limpiar\r\n");
		btnNewButton_1.addActionListener(controller.getLimpiarActionListener());
		btnNewButton_1.setForeground(new Color(255, 255, 255));
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnNewButton_1.setBackground(new Color(151, 177, 249));

		JLabel lblNewLabel_2 = new JLabel("Aun no se ha registrado?\r\n");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD, 12));

		JButton btnNewButton_2 = new JButton("Registrese");
		btnNewButton_2.setForeground(new Color(255, 255, 255));
		btnNewButton_2.setBackground(new Color(151, 177, 249));
		btnNewButton_2.addActionListener(controller.getRegistreseActionListener());
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 12));

		passwordField = new JPasswordField();
		controller.setPasswordField(passwordField);
		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
				groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(separator, GroupLayout.DEFAULT_SIZE, 450, Short.MAX_VALUE)
						.addGroup(groupLayout.createSequentialGroup()
								.addGap(10)
								.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 136, GroupLayout.PREFERRED_SIZE)
								.addContainerGap())
						.addGroup(groupLayout.createSequentialGroup()
								.addGap(46)
								.addComponent(btnNewButton)
								.addPreferredGap(ComponentPlacement.RELATED, 142, Short.MAX_VALUE)
								.addComponent(btnNewButton_1)
								.addGap(79))
						.addGroup(groupLayout.createSequentialGroup()
								.addGap(18)
								.addComponent(lblNewLabel_2, GroupLayout.PREFERRED_SIZE, 173, GroupLayout.PREFERRED_SIZE)
								.addGap(28)
								.addComponent(btnNewButton_2)
								.addContainerGap(95, Short.MAX_VALUE))
						.addGroup(groupLayout.createSequentialGroup()
								.addGap(47)
								.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
										.addComponent(lblNewLabel_1_1)
										.addComponent(lblNewLabel_1, GroupLayout.PREFERRED_SIZE, 57, GroupLayout.PREFERRED_SIZE))
								.addPreferredGap(ComponentPlacement.UNRELATED)
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
										.addComponent(passwordField)
										.addComponent(textField, GroupLayout.DEFAULT_SIZE, 147, Short.MAX_VALUE))
								.addContainerGap(128, Short.MAX_VALUE))
						.addGroup(Alignment.TRAILING, groupLayout.createSequentialGroup()
								.addContainerGap()
								.addComponent(separator_1, GroupLayout.DEFAULT_SIZE, 450, Short.MAX_VALUE))
						.addGroup(Alignment.TRAILING, groupLayout.createSequentialGroup()
								.addContainerGap()
								.addComponent(separator_1_1, GroupLayout.DEFAULT_SIZE, 450, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
				groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
								.addContainerGap()
								.addComponent(lblNewLabel)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(separator, GroupLayout.PREFERRED_SIZE, 13, GroupLayout.PREFERRED_SIZE)
								.addGap(18)
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(textField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
										.addComponent(lblNewLabel_1, GroupLayout.PREFERRED_SIZE, 28, GroupLayout.PREFERRED_SIZE))
								.addGap(18)
								.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
										.addComponent(lblNewLabel_1_1, GroupLayout.PREFERRED_SIZE, 28, GroupLayout.PREFERRED_SIZE)
										.addComponent(passwordField, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
								.addGap(45)
								.addComponent(separator_1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
								.addGap(36)
								.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
										.addComponent(btnNewButton)
										.addComponent(btnNewButton_1))
								.addGap(30)
								.addComponent(separator_1_1, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
								.addGap(34)
								.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
										.addComponent(lblNewLabel_2)
										.addComponent(btnNewButton_2))
								.addContainerGap())
		);
		setLayout(groupLayout);

	}
}
