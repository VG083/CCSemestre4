import java.util.Scanner;

public class Principal{
    public static void main(String args[]){
        try (Scanner teclado = new Scanner(System.in)) {
        	System.out.println("Inicializando a arvore");
			ArvoreAVL arvore = new ArvoreAVL(new Elemento(teclado.nextInt()));
			arvore.calcularBalanceamento();
			arvore = arvore.verificaBalanceamento();
			System.out.println(arvore.printArvore(0));
			while(true){
			    arvore = arvore.inserir(new Elemento(teclado.nextInt()));
				arvore.calcularBalanceamento();
			    arvore = arvore.verificaBalanceamento();
			    System.out.println(arvore.printArvore(0));
			}
		}
    }
}
