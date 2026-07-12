package Octo.Vista.gui3;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

import Octo.Controlador.Control;
import Octo.Controlador.Vistas.*;

public class vistas extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JPanel mainPanel;
	private CardLayout cardLayout;
	private vistas log = this;

	public vistas() {
		setBackground(new Color(255, 255, 255));

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 617, 560);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 255, 255));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);

		mainPanel = new JPanel();
		mainPanel.setBackground(new Color(255, 255, 255));
		cardLayout = new CardLayout();
		mainPanel.setLayout(cardLayout);
		contentPane.setLayout(new BorderLayout());
		contentPane.add(mainPanel, BorderLayout.CENTER);

		ControllerLogin conLogin = new ControllerLogin(mainPanel,contentPane,log);
		ControllerRegistro conRegistro = new ControllerRegistro(mainPanel,contentPane,log);
		ControllerOperaciones conOperaciones = new ControllerOperaciones(mainPanel,contentPane,log);
		ControllerMisActivos conMisActivos = new ControllerMisActivos(mainPanel,contentPane,log);
		ControllerComprita conComprita = new ControllerComprita(mainPanel,contentPane,log);
		ControllerIntercambio conIntercambio = new ControllerIntercambio(mainPanel,contentPane,log);
		ControllerCotizacion conCotizacion = new ControllerCotizacion(mainPanel,contentPane,log);

		login card1 = new login(mainPanel, conLogin);
		card1.setPreferredSize(new Dimension(320, 405));
		registro card2 = new registro(mainPanel, conRegistro);
		card2.setPreferredSize(new Dimension(367, 380));
		misActivos card3 = new misActivos(mainPanel, conMisActivos);
		card3.setPreferredSize(new Dimension(480, 502));
		operaciones card4 = new operaciones(mainPanel, conOperaciones);
		card4.setPreferredSize(new Dimension(470, 300));
		cotizacion card5 = new cotizacion(mainPanel, conCotizacion);
		card5.setPreferredSize(new Dimension(470, 470));
		comprita card6 = new comprita(mainPanel, conComprita);
		card6.setPreferredSize(new Dimension(450, 300));
		intercambio card7 = new intercambio(mainPanel, conIntercambio);
		card7.setPreferredSize(new Dimension(478, 291));

		mainPanel.add(card1, "login");
		mainPanel.add(card2, "registro");
		mainPanel.add(card3, "misActivos");
		mainPanel.add(card4, "operaciones");
		mainPanel.add(card5, "cotizacion");
		mainPanel.add(card6, "comprita");
		mainPanel.add(card7, "intercambio");


	}
}