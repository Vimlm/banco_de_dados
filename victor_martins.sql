-- Criando e usando Banco de Dados
create database if not exists locadora;
use locadora;

-- Criando tabela 
create table filmes(
	id INT NOT NULL AUTO_INCREMENT,
    nome varchar(40),
    primary key (id)
);

-- Olhando colunas da tabela filmes
describe filmes;

-- Adicionando registros na tabela filmes
INSERT INTO filmes (nome)
	VALUES 
		('A Hora do Pesadelo'),
		('Bem-Hur'),
        ('Como Eu Era antes de Você'),
        ('Estrada sem Lei'),
        ('Forrest Gump – O Contador de Histórias'),
        ('Harry Potter e a Ordem da Fênix'),
		('Intocáveis'),
        ('It – A Coisa'),
        ('Minha Mãe É uma Peça'),
        ('O Iluminado'),
        ('O Resgate do Soldado Ryan'),
        ('Os Infiltrados'),
        ('Vingadores'),
        ('Pantera Negra'),
        ('Para Todos os Garotos que Já Amei');

-- Olhando registros da tabela filmes
SELECT * FROM filmes;

-- Alterando nome da tabela "filmes" para "acervo"
ALTER TABLE filmes RENAME TO acervo;

-- Mudando nome da coluna "nome" para "titulo"
ALTER TABLE acervo CHANGE COLUMN nome titulo varchar (40);

-- Criando duas novas colunas na tabela acervo "genero" e "ano" /  É possível adicionar mais de uma informação juntas, > ALTER TABLE acervo ADD genero varchar(10), ADD ano year;
ALTER TABLE acervo ADD genero ENUM('Ação', 'Aventura', 'Comédia', 'Drama', 'Policial', 'Romance', 'Terror'), ADD ano year;

-- Olhando registros da tabela acervo
select * from acervo;

-- Fazendo inclusão de registro nas colunas "genero" e "ano"
UPDATE acervo SET genero = 'Terror', ano = '1986' WHERE id = '1';
UPDATE acervo SET genero = 'Aventura', ano = '1960' WHERE id = '2';
UPDATE acervo SET genero = 'Romance', ano = '2016' WHERE id = '3';
UPDATE acervo SET genero = 'Comédia', ano = '2014' WHERE id = '4';
UPDATE acervo SET genero = 'Comédia', ano = '1994' WHERE id = '5';
UPDATE acervo SET genero = 'Aventura', ano = '2007' WHERE id = '6';
UPDATE acervo SET genero = 'Drama', ano = '2012' WHERE id = '7';
UPDATE acervo SET genero = 'Terror', ano = '2017' WHERE id = '8';
UPDATE acervo SET genero = 'Comédia', ano = '2013' WHERE id = '9';
UPDATE acervo SET genero = 'Terror', ano = '1980' WHERE id = '10';
UPDATE acervo SET genero = 'Drama', ano = '1998' WHERE id = '11';
UPDATE acervo SET genero = 'Policial', ano = '2006' WHERE id = '12';
UPDATE acervo SET genero = 'Ação', ano = '2012' WHERE id = '13';
UPDATE acervo SET genero = 'Ação', ano = '2018' WHERE id = '14';
UPDATE acervo SET genero = 'Romance', ano = '2018' WHERE id = '15';

-- Trocando gênero do registro "Estrada Sem Lei" para "Policial"
UPDATE acervo SET genero = 'Policial' WHERE id = '4';

-- Trocando nome do registro "Vingadores" para "Os Vingadores – The Avengers"
UPDATE acervo SET titulo = 'Os Vingadores – The Avengers' WHERE id = '13';

-- Adicionando mais um registro a tabela "acervo"
INSERT INTO acervo (titulo, genero, ano)
	VALUES
		('Leprechaun', 'Comédia', '1993');
        
-- Deletando registro "Os Infiltrados" da tabela "acervo"
DELETE FROM acervo WHERE id = '12';

-- Deletando todos os registros da tabela acervo
TRUNCATE TABLE acervo;

-- Deletando tabela acervo do banco de dados locadora
drop table acervo;

-- Deletando banco de dados
drop database locadora;
