SELECT nome, cpf, telefone FROM tb_cliente;
SELECT nome, codigo, tipo FROM tb_cliente;

SELECT tb_cliente.cpf, tb_cliente.endereco FROM tb_cliente;
SELECT c.cpf, c.endereco FROM tb_cliente c;
SELECT cli.cpf, cli.endereco FROM tb_cliente cli;

SELECT nome, telefone FROM tb_cliente;
SELECT nome AS full_name, telefone AS phone FROM tb_cliente;
SELECT nome full_name2, telefone phone2 FROM tb_cliente;

SELECT codigo,nome,endereco,cpf,telefone,tipo FROM tb_cliente;
SELECT * FROM tb_cliente;

SELECT telefone FROM tb_cliente
WHERE nome='Ana Maria';
SELECT cpf, telefone FROM tb_cliente WHERE tipo='VIP';
SELECT cpf, telefone FROM tb_cliente 
WHERE tipo='VIP' AND codigo=124;

SELECT * FROM tb_produto;
SELECT * FROM tb_produto WHERE preco>100;
SELECT * FROM tb_produto WHERE preco<100;
SELECT * FROM tb_produto WHERE preco>=295.50;
SELECT * FROM tb_produto WHERE preco>295.50;
SELECT * FROM tb_produto WHERE preco>=200 AND preco<=1000;
SELECT * FROM tb_produto WHERE preco IS NULL;
SELECT * FROM tb_produto WHERE preco IS NOT NULL;
