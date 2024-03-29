CREATE DATABASE locadoraDeCarros;
USE locadoraDeCarros;

CREATE TABLE cidade (
  codigo int(11) NOT NULL AUTO_INCREMENT,
  nome varchar(50) DEFAULT NULL,
  populacao int(11) DEFAULT NULL,
  anoFundacao int(11) DEFAULT NULL,
  uf char(2) DEFAULT NULL,
  PRIMARY KEY (codigo)
);
INSERT INTO cidade VALUES (1,'João Pessoa',720954,1595,'PB'),(2,'Recife',1555456,1537,'PE'),(3,'Timbaúba',50956,1873,'PE'),(4,'Senhor do Bonfim',78588,1799,'BA'),(5,'Natal',803739,1599,'RN');

CREATE TABLE cliente (
  codigo int(11) NOT NULL,
  nome varchar(100) DEFAULT NULL,
  rua varchar(100) DEFAULT NULL,
  bairro varchar(50) DEFAULT NULL,
  cidade varchar(50) DEFAULT NULL,
  CEP char(8) DEFAULT NULL,
  uf char(2) DEFAULT NULL,
  CPF char(11) DEFAULT NULL,
  CNPJ varchar(100) DEFAULT NULL,
  PRIMARY KEY (codigo)
);
INSERT INTO cliente VALUES (1,'Radegondes','Rua A','Bairro 1','João Pessoa','5895392','PB','11111111111',NULL),(2,'Xilderico','Rua A','Bairro 1','João Pessoa','5895392','PB','22222222222',NULL),(3,'Atanagildetina','Rua B','Bairro 1','Recife','54878777','PE','33333333333',NULL),(4,'Filomena','Rua A','Bairro 2','Natal','4785225','RN','44444444444',NULL),(5,'EMPRESA A','Rua X','Bairro 5','João Pessoa','5895392','PB',NULL,'11111111111'),(6,'José','Rua A','Bairro 1','Timbaúba','55870000','PE','55555555555',NULL),(7,'EMPRESA B','Rua A','Bairro 3','Recife','58742878','PE',NULL,'22222222222'),(8,'EMPRESA C','Rua B','Bairro 2','João Pessoa','5895392','PB',NULL,'3354678455'),(9,'Lara','Rua A','Bairro 1','Senhor do Bonfim','8785222','PB','77777777777',NULL),(10,'Bruna','Rua A','Bairro 1','Timbaúba','55870000','PE','88888888888',NULL);

CREATE TABLE contrato (
  numero int(11) DEFAULT NULL,
  idVeiculo int(11) NOT NULL,
  codigoCliente int(11) NOT NULL,
  dataSaida date NOT NULL,
  dataRetorno date DEFAULT NULL,
  dataDevolucao date DEFAULT NULL,
  valorReserva decimal(10,2) DEFAULT NULL,
  multa decimal(10,2) DEFAULT NULL,
  valorPago decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (idVeiculo,codigoCliente,dataSaida),
  UNIQUE KEY numero (numero),
  KEY fk_contrato_cliente (codigoCliente),
  CONSTRAINT fk_contrato_cliente FOREIGN KEY (codigoCliente) REFERENCES cliente (codigo),
  KEY fk_contrato_veiculo (idVeiculo), -- LINHA ADICIONADA POR VG PARA POSSIVEL CORREÇÃO DE CODIGO
  CONSTRAINT fk_contrato_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculo (id)
);
INSERT INTO contrato VALUES (8,1,2,'2018-09-30','2018-10-04','2018-10-06',723.00,25.00,748.00),(19,1,4,'2018-11-11','2018-11-14','2018-11-14',375.00,0.00,375.00),(24,1,5,'2018-11-23','2018-11-24','2018-11-26',361.50,25.00,386.50),(3,1,6,'2018-09-24','2018-09-25','2018-09-25',120.50,0.00,120.50),(1,2,1,'2018-09-20','2018-09-22','2018-09-22',280.00,0.00,280.00),(13,2,1,'2018-10-09','2018-10-18','2018-10-18',1260.00,0.00,1260.00),(22,2,8,'2018-11-20','2018-11-22','2018-11-23',420.00,14.00,434.00),(20,3,5,'2018-11-18','2018-11-25','2018-11-25',490.00,0.00,490.00),(10,3,6,'2018-10-03','2018-10-22','2018-10-23',1400.00,7.00,1407.00),(14,3,6,'2018-10-14','2018-10-25','2018-10-25',770.00,0.00,770.00),(5,3,7,'2018-09-26','2018-09-29','2018-09-29',210.00,0.00,210.00),(23,4,1,'2018-11-20','2018-11-24','2018-11-25',391.50,13.50,405.00),(4,4,3,'2018-09-24','2018-09-28','2018-09-30',391.50,27.00,418.50),(2,4,4,'2018-09-20','2018-09-25','2018-09-27',913.50,27.00,940.50),(9,4,4,'2018-10-02','2018-10-05','2018-10-05',391.50,13.50,405.00),(11,5,4,'2018-10-04','2018-10-12','2018-10-12',800.00,0.00,800.00),(15,5,5,'2018-10-25','2018-10-28','2018-10-28',300.00,0.00,300.00),(6,6,3,'2018-09-28','2018-10-01','2018-10-04',630.00,31.50,661.50),(21,6,7,'2018-11-20','2018-11-22','2018-11-22',210.00,0.00,210.00),(16,7,2,'2018-10-26','2018-10-29','2018-10-29',375.00,0.00,375.00),(25,7,3,'2018-11-24','2018-11-25','2018-11-25',125.00,0.00,125.00),(18,8,1,'2018-11-09','2018-11-14','2018-11-15',600.00,10.00,610.00),(12,8,3,'2018-10-09','2018-10-15','2018-10-16',700.00,10.00,710.00),(7,9,5,'2018-09-29','2018-10-02','2018-10-04',325.00,13.00,338.00),(17,9,9,'2018-11-02','2018-11-05','2018-11-09',455.00,26.00,481.00);
DROP TABLE contrato;

CREATE TABLE filial (
  codigo int(11) NOT NULL,
  telefone char(11) DEFAULT NULL,
  rua varchar(100) DEFAULT NULL,
  bairro varchar(50) DEFAULT NULL,
  cidade varchar(50) DEFAULT NULL,
  CEP char(8) DEFAULT NULL,
  idCidade int(11) DEFAULT NULL,
  uf char(2) DEFAULT NULL,
  PRIMARY KEY (codigo),
  KEY fk_filial_cidade (idCidade),
  CONSTRAINT fk_filial_cidade FOREIGN KEY (idCidade) REFERENCES cidade (codigo)
);
INSERT INTO filial VALUES (1,'32575888','Rua A','Bairro A','Timbaúba','55870000',3,'PE'),(2,'35877896','Rua A','Bairro A','João Pessoa','58052170',1,'PB'),(3,'33335848','Rua B','Bairro B','Timbaúba','55870000',3,'PE'),(4,'30301588','Rua A','Bairro A','Recife','55870258',2,'PE'),(5,'23658844','Rua B','Bairro B','Senhor do Bonfim','58744000',4,'BA'),(6,'35478522','Rua B','Bairro B','João Pessoa','58055040',1,'PE');

CREATE TABLE telefone (
  codigoCliente int(11) NOT NULL,
  numero char(11) NOT NULL,
  PRIMARY KEY (codigoCliente,numero)
);
INSERT INTO telefone VALUES (1,'97777-0099'),(1,'98888-8888'),(1,'99999-0099'),(2,'98888-7777'),(2,'99999-7777'),(3,'9854-2547'),(3,'98547-0259'),(4,'99855-0258'),(6,'98858-8787'),(9,'98585-0099'),(9,'99985-0259');

CREATE TABLE veiculo (
  id int(11) NOT NULL AUTO_INCREMENT,
  placa char(7) DEFAULT NULL,
  modelo varchar(20) DEFAULT NULL,
  numPortas int(11) DEFAULT NULL,
  arCondicionado char(1) DEFAULT NULL,
  vencimentoSeguro date DEFAULT NULL,
  codFilial int(11) DEFAULT NULL,
  marca varchar(20) DEFAULT NULL,
  ano int(11) DEFAULT NULL,
  valorDiaria decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_veiculo_filial (codFilial),
  CONSTRAINT fk_veiculo_filial FOREIGN KEY (codFilial) REFERENCES filial (codigo)
);
INSERT INTO veiculo VALUES (1,'MNH0002','HB20S',4,'S','2019-04-30',4,'HYUNDAI',2017,120.50),(2,'KMN8872','Corolla',4,'S','2019-08-20',4,'TOYOTA',2018,140.00),(3,'QFC2010','Gol',2,'N','2019-10-03',3,'VOLKSWAGEN',2014,70.00),(4,'MAB0002','Honda Civic',4,'S','2019-10-05',2,'HONDA',2015,130.50),(5,'KKJ8888','Touro',4,'S','2019-01-31',2,'FIAT',2015,100.00),(6,'JNH1022','Kicks',4,'S','2018-12-31',1,'NISSAN',2018,105.00),(7,'KKK0002','HB20S',4,'S','2019-04-30',4,'HYNUDAI',2018,125.00),(8,'KFJ8223','Corolla',4,'S','2019-08-20',4,'TOYOTA',2015,100.00),(9,'QFT0202','Uno',2,'N','2019-10-03',3,'FIAT',2015,65.00),(10,'MMM0211','HB20',4,'S','2019-10-05',1,'HYUNDAI',2017,120.00),(11,'KDJ9999','Uno',2,'F','2019-01-31',2,'FIAT',2017,90.99),(12,'JNL0558','March',2,'S','2018-12-31',1,'NISSAN',2015,80.99);

-- QUESTÃO 1: Recuperar o nome e telefone dos clientes, o número de contrato de locação de veículo, além do modelo e placa do veículo. Ordene os contratos pela data de saída mais recente.
SELECT c.nome, t.numero, a.numero, a.dataSaida, v.placa, v.modelo
FROM cliente AS c INNER JOIN telefone AS t INNER JOIN contrato AS a INNER JOIN veiculo AS v
ON c.codigo=t.codigoCliente AND c.codigo=a.codigoCliente AND a.idVeiculo=v.id
ORDER BY a.dataSaida DESC
;
-- QUESTÃO 2: Mostrar a cidade de cada filial, seu ano de fundação e o “Total de veículos” de cada filial específica.
SELECT f.cidade, c.anofundacao, count(*) TOTAL
FROM filial f INNER JOIN veiculo v INNER JOIN cidade c
ON v.codFilial=f.codigo AND f.idCidade=c.codigo
GROUP BY f.cidade ORDER BY cidade ASC;
-- QUESTÃO 3: Mostrar todos os contratos firmados pelo cliente “Filomena” sobre o veículo de placa “'MAB0002'”. Mostrar o “Nome do cliente”, “Número do contrato”, “Placa do veículo”, “Modelo do veículo”, “Data saída” e “Data devolução”
SELECT c.nome AS "Nome do cliente", a.numero AS "Número do contrato", v.placa AS "Placa do veículo", v.modelo AS "Modelo do veículo", a.dataSaida AS "Data saída", a.dataDevolucao AS "Data devolução"
FROM cliente AS c INNER JOIN telefone AS t INNER JOIN contrato AS a INNER JOIN veiculo AS v
ON c.codigo=t.codigoCliente AND c.codigo=a.codigoCliente AND a.idVeiculo=v.id
WHERE c.nome="Filomena" AND v.placa="MAB0002"
;
-- QUESTÃO 4: Exibir a placa e o modelo de todos os veículos de 4 portas das filiais cuja população seja inferior a cem mil habitantes. Exibir também os nomes das cidades das filiais e as Ruas.
SELECT f.cidade, f.rua, v.placa, v.modelo, v.numPortas
FROM veiculo AS v INNER JOIN filial AS f INNER JOIN cidade AS c
ON v.codFilial=f.codigo AND f.idCidade=c.codigo
WHERE v.numPortas="4" AND c.populacao<=100000
;
-- QUESTÃO 5: Mostrar a quantidade de veículos com diárias maiores que 100 reais e registrados em filiais com população maior que 500 mil habitantes. Mostre o modelo do veículo e a quantidade.
SELECT v.modelo, count(*)
FROM veiculo AS v INNER JOIN filial AS f INNER JOIN cidade AS c
ON v.codFilial=f.codigo AND f.idCidade=c.codigo
WHERE v.valorDiaria>100 AND c.populacao>500000
GROUP BY v.modelo
;
-- QUESTÃO 6: Mostrar a média do valor recebido por alocações feitas em cada veículo. Ordene estes valores em ordem decrescente.
SELECT v.placa, v.modelo, CAST(AVG(c.valorPago) AS DECIMAL(15,2)) AS "Média do valor"
FROM veiculo AS v INNER JOIN contrato AS c
ON v.id=c.idVeiculo
GROUP BY v.placa ORDER BY c.valorPago DESC
;
-- QUESTÃO 7: Exibir a placa, o modelo e o valor da diária do(s) veículo(s) que tiveram o maior valor de multa aplicada numa locação.
SELECT v.placa, v.modelo, v.valorDiaria
FROM veiculo AS v INNER JOIN contrato AS c
ON v.id=c.idVeiculo
WHERE c.multa = (SELECT max(multa) FROM contrato)
;
-- QUESTÃO 8: Exiba o modelo e a placa dos veículos que ainda não foram locados na empresa.
SELECT modelo, placa FROM veiculo
WHERE id NOT IN (
SELECT idVeiculo FROM contrato);