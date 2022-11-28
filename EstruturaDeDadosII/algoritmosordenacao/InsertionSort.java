package e2.projeto;

public class InsertionSort {

	  public static void ordenarVetor(int[] vetor) {

	    for(int i = 1; i < vetor.length; i++) {

	       int aux = vetor[i];
			     
	       int indiceJ = i - 1;
			       
	       while ( indiceJ >= 0 && aux < vetor[indiceJ] ) {
			            
	         vetor[indiceJ + 1] = vetor[indiceJ];
			         
	         indiceJ = indiceJ - 1;
			               
	       }
			          
	       vetor[ indiceJ + 1 ] = aux;

	     } // FOR ELEMENTOS
				     
	  }

	  @Override
		
	  public String toString() {
		
	    return "InsertionSort";
	    
	  }

	}
