import os

vermelho = "\033[1;31m"  
ciano = "\033[1;36m"
verde = "\033[0;32m"

class Aluno():
    def __init__(self, matricula, nome, idade):
        self.matricula = matricula
        self.nome = nome 
        self.idade = idade 

def leiaInt(mensagem):
    feito = False
    valor = 0
    while True:
        n = str(input(mensagem))
        if n.isnumeric():
            valor = int(n)
            feito = True
        else:
            print(f'{vermelho}Inválido, digite um número inteiro válido\033[m')
        if feito:
            break
    return valor

def menu():
    print('MENU\n')
    print('1. Inserir novo aluno')
    print('2. Buscar por aluno')
    print('3. Remover aluno')
    print('4. Exibir tabela hash')
    print('5. Encerrar programa\n')

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
                print(f'{vermelho}Digite uma opcao valida\033[m')
        else: 
            print(f'{vermelho}Digite uma opcao valida\033[m')
        if ok:
            break
    return valor

def checarMatriculaRepetida(matricula, lista):
    for registro in lista:
        if registro.matricula == matricula:
            return False
    return True

def checarMatriculaInexistente(matricula, lista):
    for registro in lista:
        if registro.matricula == matricula:
            return True
    return False

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

#grupo_de_hashs = [[], [], [], [], [], [], [], [], [], [], []] 
grupo_de_hashs = [[], [Aluno(1, 'Jose', 19), Aluno(23, 'Oliveira', 21), Aluno(34, 'Netto', 22)], [Aluno(2, 'Danilo', 19)], [Aluno(3, 'Ricardo', 19)], [Aluno(4, 'Everton', 19)], [Aluno(5, 'Pedro', 19)], [Aluno(6, 'Thiago', 19)], [Aluno(7, 'Hermano', 19)], [Aluno(8, 'Celani', 19)], [Aluno(9, 'Alvaro', 19)], [Aluno(10, 'Jadilson', 19)]]

ligarPrograma = True
while ligarPrograma == True:
    os.system('cls')
    menu()
    opcao = lerOpcao('Digite sua opcao: ')
    os.system('cls')
    if opcao == 1:
        print('INSERINDO NOVO ALUNO\n')
        while True:
            matricula = leiaInt('Digite a matricula do aluno: ')
            hash_definida = matricula%11
            if checarMatriculaRepetida(matricula, grupo_de_hashs[hash_definida]):
                break
            print(f'{vermelho}Ja existe aluno com essa matricula, tente novamente\033[m')
        nome = str(input('Digite o nome do aluno: ')).title()
        idade = leiaInt('Digite a idade do aluno: ')
        novo_aluno = Aluno(matricula, nome, idade)
        grupo_hash = grupo_de_hashs[hash_definida]
        nova_lista = []
        novo_grupo_hash = []
        if grupo_hash == []:
            grupo_hash.append(novo_aluno)
        else:
            for registro in grupo_hash:
                if registro.matricula < matricula:
                    novo_grupo_hash.append(registro)
                if registro.matricula > matricula:
                    nova_lista.append(registro)
            novo_grupo_hash.append(novo_aluno)
            if nova_lista != []:
                for registro in nova_lista:
                    novo_grupo_hash.append(registro)

            grupo_de_hashs[hash_definida] = novo_grupo_hash
        print(f'{verde}O aluno foi adicionado com sucesso\033[m')
        aguardar()
        os.system('cls')
    elif opcao == 2:
        print('BUSCANDO POR ALUNO\n')
        while True:
            matricula = leiaInt('Digite a matricula do aluno: ')
            hash_definida = matricula%11
            if checarMatriculaInexistente(matricula, grupo_de_hashs[hash_definida]):
                break
            print(f'{vermelho}Nao existe aluno com essa matricula\033[m')
            break
        hash_definida = matricula%11
        buscar = matricula
        lista_de_busca = grupo_de_hashs[hash_definida]
        for registro in lista_de_busca:
            if registro.matricula == buscar:
                print(f'Nome: {registro.nome}')
                print(f'Idade: {registro.idade}')
        aguardar()
        os.system('cls')
    elif opcao == 3:
        print('REMOVENDO ALUNO\n')
        while True:
            matricula = leiaInt('Digite a matricula do aluno: ')
            hash_definida = matricula%11
            if checarMatriculaInexistente(matricula, grupo_de_hashs[hash_definida]):
                break
            print(f'{vermelho}Nao existe aluno com essa matricula\033[m')
            break
        hash_definida = matricula%11
        indice = 0
        lista_de_busca = grupo_de_hashs[hash_definida]
        for registro in lista_de_busca:
            if registro.matricula == matricula:
                print(f'{verde}O aluno de matricula {matricula} foi deletado\033[m')
                del(lista_de_busca[indice])
            indice += 1
        grupo_de_hashs[hash_definida] = lista_de_busca
        aguardar()
        os.system('cls')
    elif opcao == 4:
        print('EXIBINDO TABELA HASH\n')
        for i in range(11):
            print(f'Hash {i}', end='')
            exibirTabelaHash(grupo_de_hashs[i])
        aguardar()
        os.system('cls')
    elif opcao == 5:
        print('ENCERRANDO PROGRAMA')
        ligarPrograma = False