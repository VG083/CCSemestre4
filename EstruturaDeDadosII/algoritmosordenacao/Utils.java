package e2.projeto;

import java.util.Random;



public class Utils {

  private Utils() {

  }
  
  public static void imprimirVetor(int[] vetor) {
	
	System.out.print( "\n Vetor = {" );

	  
    for(int i = 0; i < vetor.length; i++) {
    	
      System.out.print( vetor[i] );
      
      if( i < ( vetor.length - 1 ) ) {
    	  
        System.out.print( ", " );
    	  
      }
      
    }
    
    System.out.print( "}\n" );
    
  }

  public static int[] gerarVetor(int tamanhoVetor, int limiteSuperior) {
	
	Random random = new Random();
	
	int[] vetor = new int[tamanhoVetor];
	
    for(int i = 0; i < tamanhoVetor; i++) {
	    	
	  int numero = random.nextInt( limiteSuperior );
	 
	  vetor[i] = numero;
	  
    } // FOR VETOR
	    
    return vetor;
    
  }
  

}

