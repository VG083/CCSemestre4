package e2.projeto;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		  Scanner entrada = new Scanner(System.in);
		  int escolha = 0; 
		  int tamanhoVetor;
		  System.out.println("Escolha o tamanho do vetor");
		  tamanhoVetor = entrada.nextInt();
		  int[] vetor = Utils.gerarVetor(tamanhoVetor, 100);
		  Utils.imprimirVetor(vetor);
		  
		  System.out.println("\n\nAlgoritmo de Ordenacao");
		    
	   
	      System.out.println("1. BubbleSort");
	      System.out.println("2. InsertionSort");
	      System.out.println("3. MargeSort");
	      System.out.println("4. QuickSort");
	      System.out.println("5. SelectionSort");
	      
	  
	      System.out.println("\n Escolha uma opcao?");
	     	escolha = entrada.nextInt();
	      
	  
	    	switch(escolha) {
	      
	          case 1:
	        	  BubbleSort.ordenarVetor(vetor);
	        	  Utils.imprimirVetor(vetor);
	        	  
	              break;
	 
	          case 2: 
	        	  InsertionSort.ordenarVetor(vetor);
	        	  Utils.imprimirVetor(vetor);
	        	  break;
	    
	          case 3:
	        	  MergeSort.ordenarVetor(vetor);
	        	  Utils.imprimirVetor(vetor);
	              
	          	break;
	          case 4:
	        	  QuickSort.ordenarVetor(vetor);
	        	  Utils.imprimirVetor(vetor);
	              break;
	              
	          case 5:
	        	  SelectionSort.ordenarVetor(vetor);
	        	  Utils.imprimirVetor(vetor);
	        	  break;
	          default:
	        	System.out.println("Caracter invalido!! Tente Novamente");
	        
	          	break;
	          }
	    	

	}

}
