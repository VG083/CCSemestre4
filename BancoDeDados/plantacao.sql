-- Criando Base de Dados
CREATE DATABASE plantacao;
USE plantacao;

-- Criando Tabelas
CREATE TABLE canteiro (
canteiroID INT NOT NULL AUTO_INCREMENT,
nome CHAR(20) DEFAULT NULL,
luzdiaria DECIMAL(4,3) DEFAULT NULL,
aguadiaria DECIMAL(4,3) DEFAULT NULL,
PRIMARY KEY (canteiroID),
UNIQUE KEY (canteiroID)
);

CREATE TABLE funcionario (
funcID INT NOT NULL AUTO_INCREMENT,
nome CHAR(80) NOT NULL,
idade INT NOT NULL,
PRIMARY KEY (funcID),
UNIQUE KEY (funcID)
);

CREATE TABLE planta (
plantaID INT NOT NULL AUTO_INCREMENT,
nome CHAR(20) NOT NULL DEFAULT '',
luzdiaria DECIMAL(4,3) DEFAULT NULL,
agua DECIMAL(4,3) DEFAULT NULL,
peso DECIMAL(4,3) DEFAULT NULL,
PRIMARY KEY (plantaID),
UNIQUE KEY (plantaID)
);

CREATE TABLE plantio (
plantioID INT NOT NULL AUTO_INCREMENT,
plantaID INT NOT NULL,
funcID INT NOT NULL,
canteiroID INT NOT NULL,
dataplantio DATE,
sementes INT DEFAULT 0 NOT NULL,
PRIMARY KEY (plantioID),
UNIQUE KEY (plantioID),
FOREIGN KEY (plantaID) REFERENCES planta(plantaID),
FOREIGN KEY (funcID) REFERENCES funcionario(funcID),
FOREIGN KEY (canteiroID) REFERENCES canteiro(canteiroid)
);

CREATE TABLE colhido (
colhidoID INT NOT NULL AUTO_INCREMENT,
plantaID INT NOT NULL,
funcID INT NOT NULL ,
canteiroID INT NOT NULL,
datacolheita DATE,
quantidade INT DEFAULT 1 NOT NULL,
peso DECIMAL(4,3) NOT NULL,
PRIMARY KEY (colhidoID),
UNIQUE KEY ID (colhidoID),
fOREIGN KEY(plantaID) REFERENCES planta(plantaID),
FOREIGN KEY(funcID) REFERENCES funcionario(funcID),
FOREIGN KEY(plantaID) REFERENCES canteiro(canteiroID)
);

-- Inserindo Dados nas Tabelas dos Banco de Dados
INSERT INTO canteiro(canteiroID, nome, luzdiaria, aguadiaria) VALUES (1, 'Morango', 5.5, 9.8);
INSERT INTO canteiro(canteiroID, nome, luzdiaria, aguadiaria) VALUES (2, 'Coentro', 5.5, 9.8);
INSERT INTO canteiro(canteiroID, nome, luzdiaria, aguadiaria) VALUES (3, 'Tomate', 5.5, 9.8);

INSERT INTO funcionario(funcID, nome, idade) VALUES (1, 'Jose Nilton', 19);
INSERT INTO funcionario(funcID, nome, idade) VALUES (2, 'Danilo Oliveira', 20);
INSERT INTO funcionario(funcID, nome, idade) VALUES (3, 'Ricardo Oliveira', 17);

INSERT INTO planta(plantaID, nome, luzdiaria, agua, peso) VALUES (1, 'Morango', 5.5, 9.8, 1.5);
INSERT INTO planta(plantaID, nome, luzdiaria, agua, peso) VALUES (2, 'Coentro', 5.5, 9.8, 1.5);
INSERT INTO planta(plantaID, nome, luzdiaria, agua, peso) VALUES (3, 'Tomate', 5.5, 9.8, 1.5);

INSERT INTO plantio(plantioID, plantaID, funcID, canteiroID, dataplantio, sementes) VALUES (1, 1, 1, 1 , '22-10-27', 5);
INSERT INTO plantio(plantioID, plantaID, funcID, canteiroID, dataplantio, sementes) VALUES (2, 2, 2, 2 , '22-10-27', 5);
INSERT INTO plantio(plantioID, plantaID, funcID, canteiroID, dataplantio, sementes) VALUES (3, 3, 3, 3 , '22-10-27', 5);

INSERT INTO colhido(colhidoID, plantaID, funcID, canteiroID, datacolheita, quantidade, peso) VALUES (1, 1, 1, 1, '22-12-27', 15, 1.8);
INSERT INTO colhido(colhidoID, plantaID, funcID, canteiroID, datacolheita, quantidade, peso) VALUES (2, 2, 2, 2, '22-12-27', 10, 1.8);
INSERT INTO colhido(colhidoID, plantaID, funcID, canteiroID, datacolheita, quantidade, peso) VALUES (3, 3, 3, 3, '22-12-27', 9, 1.8);

SELECT * FROM canteiro;
SELECT * FROM funcionario;
SELECT * FROM planta;
SELECT * FROM plantio;
SELECT * FROM colhido;
