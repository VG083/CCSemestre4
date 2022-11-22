DELIMITER $$
CREATE PROCEDURE consultar_livros()
SELECT * FROM livro;
$$

CALL consultar_livros;

DELIMITER $$
CREATE PROCEDURE recuperar_msg()
BEGIN
SELECT 'ESTA É UMA AULA DE BANCO DE DADOS' AS Mensagem;
END
$$

CALL recuperar_msg;

DELIMITER $$
CREATE PROCEDURE insereAssunto(IN p_sigla varchar(2), IN p_nome varchar(40))
BEGIN
INSERT INTO assunto(sigla, nome) VALUES (p_sigla, p_nome);
END
$$

CALL insereAssunto('ED','Estrutura de Dados');

DELIMITER $$
CREATE PROCEDURE sp_consulta()
BEGIN
SELECT l.codigo, l.titulo, l.valor, l.ano FROM livro l, editora e
WHERE e.codigo = l.editora AND e.nome = 'Pearson';
END
$$

CALL sp_consulta;

DELIMITER $$
CREATE PROCEDURE sp_consultalivro(IN nomeproduto varchar(30))
BEGIN
SELECT l.titulo, l.valor, l.ano FROM livro l
WHERE l.titulo = nomeproduto;
END
$$

CALL sp_consultalivro('Java')

DELIMITER $$
CREATE PROCEDURE sp_consulta2(nomeEditora varchar(20))
BEGIN
SELECT e.nome, a.nome, l.titulo, l.valor, l.ano
FROM editora e, assunto a, livro l
WHERE e.codigo=l.editora AND a.sigla=l.assunto AND e.nome=nomeEditora;
END
$$

CALL sp_consulta2('Saraiva')
