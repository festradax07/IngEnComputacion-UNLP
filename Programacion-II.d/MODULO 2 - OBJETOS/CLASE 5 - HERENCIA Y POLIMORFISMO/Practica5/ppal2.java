import java.util.Scanner;
public class ppal2{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        System.out.println("¿ cual es tu nombre?");
        String nombre = in.nextLine();
        System.out.println("¿cual es tu titulo?");
        String titulo= in.nextLine();
        System.out.println("¿cual es la cantidad de figuras que quieres crear?");
        int cantFig = in.nextInt();
        System.out.println ("OKAY. COMENCEMOS!");
        Dibujo draw = new Dibujo(nombre,titulo,cantFig);
        int opcion; int x,y; String colorR, colorL;double radio,lado,lado1,lado2,lado3;
        while(draw.validarFiguras()){
            System.out.println("color de relleno");
            colorR= in.next();
            in.nextLine();
            System.out.println("color de linea");
            colorL= in.next();
            System.out.println ("puntos coordenados");
            x=in.nextInt();
            y= in.nextInt();
            Punto punto = new Punto(x,y);
            System.out.println("¿que figura quieres dibujar? (1- triangulo 2- cuadrado 3- circulo");
            opcion= in.nextInt();
            switch(opcion){
                case 1: System.out.println("lado1:");
                        lado1= in.nextDouble();
                        System.out.println("lado2:");
                        lado2= in.nextDouble();
                        System.out.println("lado3:");
                        lado3= in.nextDouble();
                        draw.agregarFig( new Triangulo(lado1,lado2,lado3,colorR,colorL,punto));
                        break;
                case 2: System.out.println("lado (una vez pero serán los 4 lados):");
                        lado= in.nextDouble();
                        draw.agregarFig(new Cuadrado(colorR,colorL, punto, lado));
                        break;
                case 3: System.out.println("radio:");
                        radio= in.nextDouble();
                        draw.agregarFig(new Circulo(radio,colorR,colorL,punto));
                        break;
                default: System.out.println("FIGURA NO VALIDA. INTENTELO OTRA VEZ");
                        continue;
            }
        }
        draw.Dibujado();
        System.out.println("--FIN DEL PROGRAMA--");
        in.close();
    }
}