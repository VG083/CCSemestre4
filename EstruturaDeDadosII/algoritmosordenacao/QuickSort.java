package e2.projeto;

public class QuickSort {

	  public QuickSort() {

	  }
	  
	  public static void ordenarVetor(int[] vetor) {
		
	    quickSort( vetor, 0, ( vetor.length - 1 ) );
	    
	  }

	  public static void quickSort(int[] vetor, int p, int r) {
		  
	    int q;
		    
	    if( p < r ) {
		    	
	      q = particao( vetor, p, r );
		      
	      quickSort( vetor, p, q );
	      quickSort( vetor, q + 1, r );
		      
	    }
		    
	  }
		  
	  private static int particao(int vetor[], int p, int r) {
			  
	    int pivo, i, j;
		    
	    pivo = vetor[ ( p + r ) / 2 ];
		    
	    i = p - 1;
	    j = r + 1;
		    
	    while( i < j ) {
		    	
	      do {
		    	  
	        j--;
		        
	      } while( vetor[j] > pivo );

	      do {
		    	  
	        i++;
		        
	      } while( vetor[i] < pivo );

	      if( i < j ) {
		    	  
	        troca( vetor, i, j );
		        
	      }
		      
	    } // WHILE
		    
	    return j;
		    
	  }
		  
	  private static void troca(int vetor[], int i, int j) {
			  
	    int aux = vetor[i];
		    
	    vetor[i] = vetor[j];
		    
	    vetor[j] = aux;
		    
	  }

	  @Override
		
	  public String toString() {
		
	    return "QuickSort";
	    
	  }

	}
