class Aluno():
    #Construtor da classe
    def __init__(self, matricula, nome, idade):
        self.matricula = matricula
        self.nome = nome 
        self.idade = idade 

def buscarNaLista(lista):
    for registro in lista:
        print(f'Matricula: {registro.matricula}')
        print(f'Nome: {registro.nome}')
        print(f'Idade: {registro.idade}')

#Cria lista de hash
grupo_de_hashs = [
    [], [Aluno(1,"Jose",19), Aluno(12,"Nilton",19), Aluno(23,"Oliveira",19)], [Aluno(2,"Ricardo",20)], [Aluno(3,"Danilo",22)], [Aluno(4,"Everton",20)], [Aluno(5,"Everton",20)], [Aluno(6,"Thiago",20)], [Aluno(7,"Pedro",20)], [Aluno(8,"Hermano",20)], [Aluno(9,"Alvaro",20)], [Aluno(10,"Jadilson",20)]
]

modulo = 1
lista = grupo_de_hashs[modulo]
buscarNaLista(lista)

#Fazendo inserção na lista
matricula = int(input('Digite a matricula do aluno: '))
hash_definida = matricula%11
nome = str(input('Digite o nome do aluno: '))
idade = int(input('Digite a idade do aluno: '))
novo_aluno = Aluno(matricula, nome, idade)
grupo_hash = grupo_de_hashs[hash_definida]
grupo_hash.append(novo_aluno)
hash_ordenado = sorted(grupo_hash, key=lambda x: x.matricula,reverse=False)
grupo_de_hashs[hash_definida] = hash_ordenado

#Buscando na lista
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

#Deletando na lista
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

#Exibir tabela hash
print(grupo_de_hashs)
