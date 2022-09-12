-- Criando modelo físico do banco de dados

CREATE DATABASE tabelas;
USE tabelas;

CREATE TABLE tabelacliente (
codigo INT NOT NULL,
nome VARCHAR(50),
endereco VARCHAR(100),
cpf char(11) NOT NULL,
telefone char (11),
PRIMARY KEY (codigo)
);

CREATE TABLE tabelavendedor (
codigo INT NOT NULL,
nome VARCHAR(50),
salario DECIMAL(7,2),
PRIMARY KEY (codigo)
);

CREATE TABLE tabelaproduto (
id INT NOT NULL,
unidade CHAR(3),
descricao VARCHAR(50),
valorunitario DECIMAL(7,2),
PRIMARY KEY (id)
);

CREATE TABLE tabelapedido (
numpedido INT NOT NULL,
prazoentrega DATE,
codigocliente INT,
codigovendedor INT,
PRIMARY KEY (numpedido),
FOREIGN KEY (codigocliente) REFERENCES tabelacliente(codigo),
FOREIGN KEY (codigovendedor) REFERENCES tabelavendedor(codigo)
);

CREATE TABLE tabelaitempedido (
numeropedido INT NOT NULL,
idpedido INT NOT NULL,
quantidade INT,
PRIMARY KEY (numeropedido, idpedido),
FOREIGN KEY (numeropedido) REFERENCES tabelapedido (numpedido),
FOREIGN KEY (idpedido) REFERENCES tabelaproduto(id)
);

-- Alterando o diagrama utilizando scripts DDL

ALTER TABLE tabelacliente ADD COLUMN tipo VARCHAR(40);
ALTER TABLE tabelacliente MODIFY nome VARCHAR(100);

ALTER TABLE tabelavendedor CHANGE codigo id INT NOT NULL;
ALTER TABLE tabelavendedor ADD COLUMN telefone char(11);

ALTER TABLE tabelapedido CHANGE numpedido numeropedido INT NOT NULL;
ALTER TABLE tabelapedido DROP COLUMN prazoentrega;
ALTER TABLE tabelapedido ADD COLUMN tipo VARCHAR(40);
ALTER TABLE tabelapedido ADD COLUMN dataembarque date;
ALTER TABLE tabelapedido ADD COLUMN dataentrega date;
ALTER TABLE tabelapedido ADD COLUMN valortotal INT NOT NULL;
ALTER TABLE tabelapedido ADD COLUMN desconto INT;

ALTER TABLE tabelaproduto CHANGE id codigo INT NOT NULL;
ALTER TABLE tabelaproduto DROP COLUMN unidade;
ALTER TABLE tabelaproduto CHANGE descricao nome VARCHAR(100);
ALTER TABLE tabelaproduto CHANGE valorunitario preco DECIMAL(7,2);

CREATE TABLE tabelafabricante (
produto INT NOT NULL UNIQUE,
fabricante VARCHAR(50),
PRIMARY KEY (produto),
FOREIGN KEY (produto) REFERENCES tabelaproduto(codigo)
);
