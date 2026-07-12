public class ej4b{
    public static void main (String[]args){
     int num, factorial; 
        for (int i=1; i<=9;i+=2){
        num = i;
        factorial = 1;
        System.out.println("factorial de " + num + ":  ");
        while( num != 0 ){
            factorial *= num;
            num--;
        }
        System.out.println(factorial);
    }        
}   
}