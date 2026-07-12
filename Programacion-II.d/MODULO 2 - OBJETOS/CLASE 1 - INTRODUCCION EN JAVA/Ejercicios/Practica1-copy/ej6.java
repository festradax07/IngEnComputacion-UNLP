import java.util.Scanner;
public class ej6{
    public static void main (String[]args){
     Scanner in = new Scanner (System.in);
     int matriz[][]= new int [10][10]; int i, j,nums=0, suma=0;
     for (i=0;i<=9; i++){
         for (j=0; j<=9;j++){
             matriz[i][j]= nums;
             nums+=2;
         }
     }
     for (i=2;i<=9; i++){
         for (j=0; j<=3;j++){
             suma+= matriz[i][j];
         }
     }
     System.out.println("Suma del contenido" + suma);
     //parte B
     int [] vector= new int[10]; int total;
     for (i=0;i<=9; i++){
         total=0;
         for (j=0; j<=9;j++){
             total+= matriz[i][j];
         }
         vector[i] = total;
     }
     //parte c
     int dato = in.nextInt();
     boolean encontre= false; i=0;j=0;
     while (!(encontre) && (i<=9)) {
         while (!(encontre) &&(j<=9)){
             if (dato == matriz[i][j]){
                 encontre = true;
                System.out.println( "Se encontró el dato en  la  fila  " + i + " columna " + j); 
         }
         j++;
     }
     i++;
    }
}
}