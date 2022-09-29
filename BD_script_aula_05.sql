/* Criação do banco de dados*/
create database if not exists empresa;
use empresa;

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
	id smallint unsigned NOT NULL AUTO_INCREMENT,
	nome varchar (25) NOT NULL,
	estoque smallint unsigned NOT NULL,
	preco float NOT NULL,
	funcionario varchar (50) NOT NULL,
	observacao varchar (200),
PRIMARY KEY (id)
);

/*Vendo tabelas*/
describe clientes;
describe produtos;

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
        
/*Vendo conteúdo da tabela e registros*/
select * from clientes;
select * from produtos;
        
/*Comando que apaga todos os registros da tabela, usar com cuidado*/
truncate clientes;
truncate produtos;

/* Aula dia 25/08*/

/*Mudando coluna de bairro para email*/
ALTER TABLE clientes CHANGE COLUMN  bairro email VARCHAR(40);

/*Dando update na de dados no atributo email, indicando em qual eu quero dar update com WHERE ID*/
UPDATE clientes SET email = 'email@email.com.br' WHERE ID = 1;
UPDATE clientes SET email = 'email2@email.com.br' WHERE ID = 2;
UPDATE clientes SET email = 'email3@email.com.br' WHERE ID = 3;

/*Mudando coluna de sexo para gênero*/
ALTER TABLE clientes CHANGE COLUMN  sexo genero enum ('M', 'F');

/* Vendo conteúdo de clientes*/
select * from clientes;

/* Criando nova coluna na tabela produdos*/
ALTER TABLE produtos ADD setor varchar(30);

/*Vendo colunas dentro da tabela produtos*/
describe clientes;


/*Fazendo update de dados na coluna setor da tabela produtos.*/
UPDATE produtos SET setor = 'limpeza' WHERE ID = 1;
UPDATE produtos SET setor = 'limpeza' WHERE ID = 2;
UPDATE produtos SET setor = 'limpeza' WHERE ID = 3;

/*Vendo registros dentro da tabela produtos e clientes*/
select * from produtos;
select * from clientes;

drop database empresa;


/*Aula dia 01/09/22*/

/* Dando update no registro de ID 1, mudando múltiplos dados*/
UPDATE clientes SET Email= 'MaceloRossi@gmail.com', nome= 'Marcelo Rossi' where id=1;

/* Dupla seleção*/
SELECT nome, email FROM clientes;

/* Fazendo busca com múltiplos filtros e indicando gênero M para essa busca*/
SELECT nome, email, celular FROM clientes WHERE genero = 'M';

/* Fazendo busca de registros com operadores, da pra se usar <, >, >=, <= entre outros.*/
SELECT * FROM clientes WHERE peso < 75;

/* Fazendo busca em registro usando dois parâmetros com o operador and*/
SELECT * FROM produtos WHERE estoque >= 100 and preco >=5;

/* Colocando novo produto na tabela produtos*/
insert into produtos (nome, estoque, preco, funcionario, observacao)
	values
		('Creme dental', '123', '1.2', 'Jorge Hélio', ' ');
        
/* Selecionando campos aonde o observação está com espaço vazio*/
SELECT * FROM produtos WHERE observacao = ' ';

/*Nota: Valores vazio ' ' e Null apresentam-se de forma diferente, aonde o vazio/espaço está ocupando espaço mesmo não tendo nada.*/

/* Pegando informações de registro aonde busca todos os campos em observação que é NULL*/
SELECT * FROM produtos WHERE observacao is NULL;

/* Dando update no campo observação para NULL ao invés ' '*/
UPDATE produtos SET observacao = null WHERE id=4;

/* Listar todos os dados aonde o produtos != NULL usando o operador is not*/
SELECT * FROM produtos WHERE observacao is not NULL;

/* Outra sintaxe, mostra o que é diferente de vazio*/
SELECT * FROM produtos WHERE observacao <> '';

/* Filtra registros cujo nome NÃO SEJA Marcelo Rossi*/
SELECT * FROM clientes WHERE nome != 'Marcelo Rossi';

/* Filtra registros cujo nome NÃO SEJA Marcelo Rossi e Angélica, usando and para fazer pequisa dupla*/
SELECT * FROM clientes WHERE nome != 'Marcelo Rossi' and nome != 'Angélica';

















