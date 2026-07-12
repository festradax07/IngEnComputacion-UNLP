package Octo.Vista;

import Octo.Controlador.Control;
import Octo.Vista.gui3.*;

import javax.swing.*;

public class Principal {

    public static void main(String[] args) {
    	
    	LookAndFeelUtil.setNimbusLookAndFeel();
        Control control = new Control();
        vistas log = control.getprinc();
        log.setTitle("OctoWallet - Billetera Virtual");
        java.net.URL iconoUrl = Principal.class.getResource("/imagenes/pulpito.png");
        if (iconoUrl != null) {
            log.setIconImage(new ImageIcon(iconoUrl).getImage());
        } else {
            System.err.println("No se pudo encontrar la imagen: /imagenes/pulpito.png");
        }
        log.setVisible(true);

    }
}

