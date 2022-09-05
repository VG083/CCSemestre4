import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
        Elemento elem = new Elemento(0);
        Arvore arvore = new Arvore(new Elemento(20));
        arvore.inserir(new Elemento(10));
        arvore.inserir(new Elemento(5));
        arvore.inserir(new Elemento(2));
        arvore.inserir(new Elemento(8));
        arvore.inserir(new Elemento(15));
        arvore.inserir(new Elemento(12));
        arvore.inserir(new Elemento(18));
        arvore.inserir(new Elemento(30));
        arvore.inserir(new Elemento(25));
        arvore.inserir(new Elemento(22));
        arvore.inserir(new Elemento(28));
        arvore.inserir(new Elemento(35));
        arvore.inserir(new Elemento(32));
        arvore.inserir(new Elemento(38));
        arvore.imprimirInOrdem();
        System.out.println("");
        
        elem.setValor(38);
            
        arvore = arvore.remover(elem);
        
        System.out.println("Nova arvore....");
        arvore.imprimirInOrdem();
        System.out.println("");
        
        elem.setValor(35);
        
        arvore = arvore.remover(elem);
        
        System.out.println("Nova arvore....");
        arvore.imprimirInOrdem();
        System.out.println("");
        
        elem.setValor(20);
        
        arvore = arvore.remover(elem);
        
        System.out.println("Nova arvore....");
        arvore.imprimirInOrdem();
        System.out.println(""); 
        while(true) {
	        System.out.println("Digite uma opcao: ");
	        System.out.println("1. Inserir");
	        System.out.println("2. Remover");
	        System.out.println("3. Mostrar");
			Scanner entrada = new Scanner(System.in);
			int opcao = entrada.nextInt();
			
			switch(opcao) {
			case 1:
				System.out.println("Digite um valor: ");
				int valorin = entrada.nextInt();
				arvore.inserir(new Elemento(valorin));
				break;
			case 2:
				System.out.println("Digite um valor: ");
				int valorre = entrada.nextInt();
				elem.setValor(valorre);
				arvore = arvore.remover(elem);
				break;
			case 3:
				arvore.imprimirInOrdem();
				break;
			default:
				System.out.println("Opção inválida");
			}
		
			entrada.close();
		}
    }
}
