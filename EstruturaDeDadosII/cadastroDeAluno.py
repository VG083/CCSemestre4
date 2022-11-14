vermelho = "\033[1;31m"  
ciano = "\033[1;36m"
verde = "\033[0;32m"

class Aluno():
    #Construtor da classe
    def __init__(self, matricula, nome, idade):
        self.matricula = matricula
        self.nome = nome 
        self.idade = idade 

def menu():
    print('MENU')
    print('1. Inserir novo aluno')
    print('2. Buscar por aluno')
    print('3. Remover aluno')
    print('4. Exibir tabela hash')
    print('5. Encerrar programa')

def aguardar():
    input(f'{ciano}Pressione qualquer tecla para continuar\033[m')

def lerOpcao(msg):
    ok = False
    valor = 0
    while True:
        n = str(input(msg))
        if n.isnumeric():
            valor = int(n)
            if valor in (1,2,3,4,5):
                ok = True
            else:
                print(f'{vermelho}Digite um valor valido\033[m')
        else: 
            print(f'{vermelho}Digite um valor valido\033[m')
        if ok:
            break
    return valor

def checarMatriculaRepetida(msg, lista):
    ok = False
    valor = 0
    while True:
        n = str(input(msg))
        if n.isnumeric():
            valor = int(n)
            if valor in (1,2,3,4,5):
                ok = True
            else:
                print(f'{vermelho}Digite um valor valido\33[m')
        else: 
            print(f'{vermelho}Digite um valor valido\33[m')
        if ok:
            break
    return valor

def buscarNaLista(lista):
    for registro in lista:
        print(f'Matricula: {registro.matricula}')
        print(f'Nome: {registro.nome}')
        print(f'Idade: {registro.idade}')

def exibirTabelaHash(lista):
    for registro in lista:
        print(' -> ', end='')
        print(f'Matricula: {registro.matricula}', end='')
    print('')

#Cria a tabela de hashs
# grupo_de_hashs = [[], [Aluno(1,"Jose",19), Aluno(12,"Nilton",19), Aluno(23,"Oliveira",19)], [Aluno(2,"Ricardo",20)], [Aluno(3,"Danilo",22)], [Aluno(4,"Everton",20)], [Aluno(5,"Everton",20)], [Aluno(6,"Thiago",20)], [Aluno(7,"Pedro",20)], [Aluno(8,"Hermano",20)], [Aluno(9,"Alvaro",20)], [Aluno(10,"Jadilson",20)]]
grupo_de_hashs = [[], [], [], [], [], [], [], [], [], [], []]

ligarPrograma = True
while ligarPrograma == True:
    menu()
    opcao = lerOpcao('Digite sua opcao: ')
    if opcao == 1:
        print('INSERINDO NOVO ALUNO')
        matricula = int(input('Digite a matricula do aluno: '))
        hash_definida = matricula%11
        nome = str(input('Digite o nome do aluno: '))
        idade = int(input('Digite a idade do aluno: '))
        novo_aluno = Aluno(matricula, nome, idade)
        grupo_hash = grupo_de_hashs[hash_definida]
        grupo_hash.append(novo_aluno)
        hash_ordenado = sorted(grupo_hash, key=lambda x: x.matricula,reverse=False)
        grupo_de_hashs[hash_definida] = hash_ordenado
    elif opcao == 2:
        print('BUSCANDO POR ALUNO')
        matricula = int(input('Digite a matricula do aluno: '))
        hash_definida = matricula%11
        buscar = matricula
        lista_de_busca = grupo_de_hashs[hash_definida]
        for registro in lista_de_busca:
            if registro.matricula == buscar:
                print('achei')
                print(registro.matricula)
                print(registro.nome)
                print(registro.idade)
    elif opcao == 3:
        print('REMOVENDO ALUNO')
        matricula = int(input('Digite a matricula do aluno: '))
        hash_definida = matricula%11
        deletar = matricula
        indice = 0
        lista_de_busca = grupo_de_hashs[hash_definida]
        for registro in lista_de_busca:
            if registro.matricula == deletar:
                print('apaguei')
                del(lista_de_busca[indice])
            indice += 1
        grupo_de_hashs[hash_definida] = lista_de_busca
    elif opcao == 4:
        print('EXIBINDO TABELA HASH')
        for i in range(11):
            print(f'Hash {i}', end='')
            exibirTabelaHash(grupo_de_hashs[i])
    elif opcao == 5:
        print('Encerrando programa')
        ligarPrograma = False
    else:
        print('Opcao invalida, tente novamente')