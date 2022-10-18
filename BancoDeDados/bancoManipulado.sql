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

SELECT * FROM tb_produto;
SELECT nome, preco, 'Promocional' as valor
FROM tb_produto WHERE preco<500;
SELECT nome AS descricao, preco, 'Promocional' as valor
FROM tb_produto WHERE preco<500;

SELECT * FROM tb_fabricante;

SELECT * FROM tb_pedido;
SELECT codigoVendedor FROM tb_pedido;
SELECT DISTINCT codigoVendedor FROM tb_pedido;

SELECT * FROM tb_vendedor;
SELECT nome, salario, salario*1.15 as salarioComAumentoDe15PorCento FROM tb_vendedor;
SELECT nome, salario, salario*1.15 as salarioComAumentoDe15PorCento FROM tb_vendedor WHERE salario<=4000;
SELECT nome, salario, salario*1.15 as novoSalario FROM tb_vendedor WHERE salario<=4000 order by nome ASC;
SELECT nome, salario, salario*1.15 as novoSalario FROM tb_vendedor WHERE salario<=4000 order by nome DESC;

SELECT * FROM tb_produto;
SELECT preco FROM tb_produto WHERE nome in ('TV', 'Laptop');
