import java.util.Scanner;
public class ej8{
    public static void main (String[]args){
        int[][]entrevistas= new int[5][4]; // 5 pesonas califican 4 servicios
        double[]promedio= new double[4];
        
        Scanner in = new Scanner(System.in);int i, j;
        for (i=0;i<=4;i++){
            System.out.println( "entrevista a persona " + (i+1));
            for (j=0;j<=3;j++){
                System.out.println( "persona " + (i+1) + "¿ Que opina del servicio?" + j + "( del 1 al 10)" );
                entrevistas[i][j]= in.nextInt();
            }
        }
        for (j=0;j<=3;j++){
                promedio[j]=0;    
            }
        for (i=0;i<=4;i++){
            for (j=0;j<=3;j++){
                promedio[j]+= entrevistas[i][j];    
            }
        }
        for (j=0;j<=3;j++){
                promedio[j]= (double)(promedio[j])/4; 
                System.out.println(" por el servicio " + j + "se recibió un promedio de" + promedio[j]);
            }
            
    }
}