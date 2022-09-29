show databases;
/*Aula dia 11/08/22*/
/* Criação do banco de dados*/
create database if not exists empresa;
use empresa;

/* Criação de tabelas do banco de dados empresa*/
create table clientes(
	nome varchar(30),
	idade int,
	sexo char (1),
	peso float,
	bairro varchar(20),
	celular char(9)
);
create table produtos (
	nome varchar(30),
	unidades_estoque int,
	preco float(6,2)
);
create table funcionarios(
	nome varchar(30),
	idade int,
	sexo char(1),
	endereco varchar(100),
	celular char(9)
);
describe clientes;
desc funcionarios;

/*Adicionando registros na tabela funcionarios*/
insert into funcionarios
	values
		('Victor',28,'M','Itajuba, 644, Portão, Curitiba','997111854');
insert into funcionarios (nome, idade, sexo, endereco, celular)
	values
		('Carolina', 38, 'F', 'Luiz Carlos, 342, Cachoeira, Araucária', NULL);
desc funcionarios;

/*Adicionando registros na tabela funcionarios*/
insert into funcionarios (nome, idade, sexo, endereco, celular)
	value
		('Joao', 27, 'M', 'Rua Brigadeiro Franco, 522, Bairro Mercês, Curitiba','123456789'),
		('Maria', 20, 'F', 'Rua Justimiano Alves de Souza, 19, Roça Grande, Colombo', '040028922'),
		('Alves de Souza', '25', 'M', 'Praça Osório, 512, Centro, Curitiba', '987654321'),
		('Vitoria Junk', '19', 'F', 'Vicente machado, 1478, Batel, Curitiba', '789456123');
        
/* Assim como em outras linguagens de programação MySQL aceita comentários tendo que usar barra e asterisco e fechando esse comando.*/

/* Vendo registros na table fucionarios */
select * from funcionarios;

/*Adicionando registros na tabela clientes*/
insert into clientes (nome, idade, sexo, peso, bairro, celular)
	value
		('Alberto', 18, 'M', '86', 'Tatuquara', '990089781'),
		('Edimilson', 29, 'M', '102', 'Xaxim', '991231234'),
		('Amanda Bredja', 19, 'F', '55', 'Batel', '998827489');
        
/* Vendo registros na table clientes */
select * from clientes;

/*Adicionando registros na tabela produtos*/
insert into produtos (nome, unidades_estoque, preco)
	value
		('Joao Antonio', 100, '2.6'),
		('Arthur Lira', 124, '5.1'),
		('Silvio Augusto', 1244, '5.4');
select * from produtos;

/*Aula dia 18/08/22*/
/* Criando tabela contatos com novos tipos de valores tinyint*/
create table contatos(
	nome varchar(40),
	genero char (1),
	idade tinyint,
	cidade varchar(20),
	uf char(2),
	renda float
);
/* Mostra table contatos */
describe contatos;

/* Inserindo valores na tabela contatos, nota-se que para o valor tinyint aceita somente até o número 127*/
insert into contatos (nome, genero, idade, cidade, uf, renda)
	values ('Victor', 'M', 126, 'Curitiba', 'PR', 1500);
    
/* Vendo registros de table contato */
select * from contatos;

/*Criando tabela cliente2 usando outros parâmetros, como AUTO_INCREMENTE, not NULL, DEFAULT*/
create table clientes2 (
	id int not NULL AUTO_INCREMENT,
	nome varchar (40) NOT NULL,
	sexo enum ('M', 'F'),
	nascimento date,
	cidade varchar (20) DEFAULT 'Curitiba',
	uf char (2) DEFAULT 'PR',
PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4;

/*No final de tabelas definir o PRIMARY KEY, que nada mais é do que o identificador único de cada um dos nossos registros, pode-se ser id,
CPF, qualquer tipo de identificador único.*/
/* No caso não precisa declarar id nos valores, o auto_increment já gera valores automaticamente*/

/* Inserindo conteúdo na table clientes2 */
insert into clientes2 (nome, sexo, nascimento, cidade, uf)
	values ('Joao', 'M', '1994-08-01', 'Curitiba', 'PR');
    
/* Vendo conteúdo na table cliente2 */
select * from clientes2;

/*Deletando registro de tabela, escolhe qual com from, e aonde com where identificando com a PRIMARY KEY*/
delete from clientes2 where id=1;

/*Inserindo dados usando os valores DEFAULT definidos na criação de tabela do clientes2 JEITO BURRO DE FAZER*/
insert into clientes2 (nome, sexo, nascimento, cidade, uf)
	values ('Maria', 'F', '1992-07-11', DEFAULT, 'PR');
insert into clientes2 (nome, sexo, nascimento, cidade, uf)
	values ('Tinny', 'F', '1999-01-22', DEFAULT, DEFAULT);
insert into clientes2 (nome, sexo, nascimento, cidade, uf)
	values ('Cleber', 'M', '2004-11-15', 'Santo Andre', 'SP');
    
/* Vendo conteúdo dentro da tabela cliente2 */
select * from clientes2;

/* Apagando tabelas */
drop table contatos;
drop table clientes2;
drop table funcionarios;
drop table produtos;
drop database sys;

/* Exercício 01 */
/*Criando tabelas propostas pelo exercício*/
create table clientes(
	id int NOT NULL AUTO_INCREMENT,
	nome varchar (40) NOT NULL,
	idade tinyint NOT NULL,
	sexo enum ('M', 'F'),
	peso float,
	bairro varchar (30),
	celular char (9) NOT NULL,
PRIMARY KEY (id)
);
create table produtos(
	id int NOT NULL AUTO_INCREMENT,
	nome varchar (25) NOT NULL,
	estoque smallint NOT NULL,
	preco float NOT NULL,
	funcionario varchar (50) NOT NULL,
	observacao varchar (200),
PRIMARY KEY (id)
);

/*Vendo tabelas*/
describe clientes;
describe produtos;

/*Vendo conteúdo da tabela e registros*/
select * from clientes;
select * from produtos;

/*Inserindo registros na tabela clientes*/
insert into clientes (nome, idade, sexo, peso, bairro, celular)
	values
		('Marcelo', 52, 'M', 90, 'Novo Mundo', '911111111'),
		('João Pedro', 21, 'M', 77.5, 'Água Verde', '992222222'),
		('Angélica', 29, 'F', 68, 'Rebouças', '993333333');
        
/*Inserindo registros na tabela produtos*/
insert into produtos (nome, estoque, preco, funcionario, observacao)
	values
		('Sabão em pó', 100, 9, 'Alcir Jr.', NULL),
		('Sabão em barra', 277, 4.5, 'Maria Rita Amorim', 'Algumas barras estão avariadas.'),
		('Vanish em pó 1KG', 70, 45, 'Alcir Jr.', NULL);
        
/*Comando que apaga todos os registros da tabela, usar com cuidado*/
truncate clientes;
truncate produtos;

/* Aula dia 25/08*/

/*Mudando coluna de bairro para email*/
ALTER TABLE clientes CHANGE COLUMN  bairro email VARCHAR(50);

/*Dando update na coluna email, indicando em qual eu quero dar update com WHERE ID*/
UPDATE clientes SET email = 'email@email.com.br' WHERE ID = 1;
UPDATE clientes SET email = 'email2@email.com.br' WHERE ID = 2;
UPDATE clientes SET email = 'email3@email.com.br' WHERE ID = 3;

/* Vendo conteúdo de clientes*/
select * from clientes;

/* Criando nova coluna na tabela produdos*/
ALTER TABLE produtos ADD setor varchar(30);

/*Vendo colunas dentro da tabela produtos*/
describe produtos;

/*Fazendo update de dadps na coluna setor da tabela produtos.*/
UPDATE produtos SET setor = 'limpeza' WHERE ID = 1;
UPDATE produtos SET setor = 'limpeza' WHERE ID = 2;
UPDATE produtos SET setor = 'limpeza' WHERE ID = 3;

/*Vendo registros dentro da tabela produtos*/
select * from produtos;

drop database empresa;








