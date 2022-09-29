/* Aula dia 25/08*/
/* Criando database */
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

/* Criando tabela pessoas*/
CREATE TABLE pessoas (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sexo ENUM ('M', 'F'),
    cidade VARCHAR (25),
    limite_credito DECIMAL(7,2),
    PRIMARY KEY (id)
);

/*Inserindo registros na tabela pessoas*/
INSERT INTO pessoas (nome, sexo, cidade, limite_credito) 
	VALUES
		('Pedro Augusto da Rocha', 'M', 'Novo Hamburgo', '700'),
		('Antonio Carlos Mamel', 'M', 'Belo Horizonte', '3500.5'),
		('Luiza Augusta Mhor', 'F', 'Niterói', '3900'),
		('Jane Ester', 'F', 'Florianópolis', '800'),
		('Marcos Antônio dos Santos', 'M', 'Porto Alegre', '4250.25'),
		('Giovanna Goncalves Oliveira', 'F', 'Canoas', '1500'),
		('Kauã Azevedo Ribeiro', 'M', 'Uberlândia', '799'),
		('Rebeca Barbosa Santos', 'F', 'Santo André', '1750'),
		('Sarah Carvalho Correia', 'F', 'Juiz de Fora', '499.9'),
		('Antonio Almeida Lima', 'M', 'Paranaguá', '2600');
	
/* Olhando registros da tabela pessoas*/
SELECT * FROM pessoas;
    
/* Renomeando tabela pessoas para clientes*/
ALTER TABLE pessoas RENAME TO clientes;
    
/* Olhando registros da tabela clientes*/
SELECT * FROM clientes;
    
/* Alterar a quantidade de VARCHAR para 40 ao invés de 30*/
ALTER TABLE clientes MODIFY COLUMN nome VARCHAR(40);
    
/*Colocando novo registro com mais de 30 caracteres no campo name após dar o modify nessa constrains.*/
INSERT INTO clientes (nome, sexo, cidade, limite_credito)
	VALUES
		('João Vitor Mateo Albiquerque de Lima', 'M', 'Volta redonda', '550.7');

/* Vendo conteúdo na tabela clientes*/
SELECT * FROM clientes;

/* Vendo conteúdo da tabela clientes*/
DESCRIBE clientes;

/* Criando nova coluna uf na tabela clientes, criando dessa forma ele obedece o índice e cria a nova coluna no final dela, vamos fazer diferente*/
ALTER TABLE clientes ADD uf varchar(30);

/* Apagando coluna uf da tabela clientes*/
ALTER TABLE clientes DROP COLUMN uf;

/*Criando nova coluna na posição que queremos usando o after*/
ALTER TABLE clientes ADD uf varchar(2) after cidade;

/* Mudando nome de colua de sexo para gênero*/
ALTER TABLE clientes CHANGE COLUMN sexo genero enum ('M', 'F');

/* Dando update nos registros*/
UPDATE clientes  SET uf = 'RS' WHERE id = '1';

/* Aqui usamos o update com mais de uma informação sendo mudada ao mesmo tempo (cidade e uf) nota-se que temos que passar tais parametros para o SET de forma cronologica com o indice de colunas que forá criado*/
UPDATE clientes SET cidade = 'Londrina', uf = 'PR' WHERE id = '5';

/* Mudar o limite de credito de todos os nossos registros não passando o parâmetro WHERE, nota-se que temos que desativar o SAFE MODE (edit > preferences > MySql Editor > safe update)*/
UPDATE clientes SET limite_credito = '1000';

/*Esclui registros cujo uf = 'RS'*/
DELETE FROM clientes WHERE uf = 'RS';










