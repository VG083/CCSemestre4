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
