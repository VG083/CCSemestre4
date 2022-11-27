USE bd_livraria;

-- Exercício 01: Criar um procedimento armazenado atualizar os valores de todos os livros em 10% 
-- Toda vez que o procedimento for chamado. Em seguida realize o teste do procedimento armazenado.
DELIMITER $$
CREATE PROCEDURE atualizar10()
BEGIN
SET sql_safe_updates=0;
UPDATE livro SET valor=valor*1.1;
END
$$

CALL atualizar10;

-- Exercício 02: Criar um procedimento armazenado atualizar os valores de todos dos livros em 5% 
-- Para a editora Unipê toda vez que o procedimento for chamado. Em seguida realize o teste do procedimento armazenado.
DELIMITER $$
CREATE PROCEDURE atualizar5()
BEGIN
SET sql_safe_updates=0;
UPDATE livro SET valor=valor*1.05
WHERE livro.editora = 4;
END
$$

CALL atualizar5;

-- Exercício 03: Criar um procedimento armazenado consultar o título do livro, ano, nome da editora e o nome do assunto 
-- toda vez que realizar o chamado do procedimento. Utilize o Join. Em seguida realize o teste do procedimento armazenado.
DELIMITER $$
CREATE PROCEDURE consultar()
BEGIN
SELECT l.titulo, l.ano, e.nome AS "editora", a.nome as "assunto"
FROM livro AS l INNER JOIN editora AS e INNER JOIN assunto AS a
ON l.editora=e.codigo AND l.assunto=a.sigla;
END
$$

CALL consultar;