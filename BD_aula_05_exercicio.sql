/* Exercício 05 01/09*/

/* Criando banco de dados*/
/*Letra A*/
CREATE DATABASE if not EXISTS BD_empresa;
use BD_empresa;

/*Letra B*/
create table clientes(
	cpf varchar (14),
	nome varchar (40),
    telefone char (11),
    email varchar(30),
    endereco varchar(40),
    bairro varchar (40),
    cidade varchar(20),
    uf char(2)
);

describe clientes;

INSERT INTO clientes 
	values 
		('345.567.890-00', 'Maria da Silva', '41987658456', 'msilva@gmail.com', 'Rua das Margaridas, 33', 'Pilarzinho', 'Curitiba', 'PR'),
        ('123;654;987-11', 'Ana do Santos', '41989901234', 'anasantos@gmail.com', 'Rua Alegria, 234', 'Santo Inácio', 'Curitiba', 'PR'),
        ('321.543.654-22', 'Ana dos Santos', '41984235446', 'ana_dos_santos@gmail.com', 'Rua 21 de Abril, 1430, 33', 'Alto da VX', 'Curitiba', 'PR');
        
select * from clientes;

/*Letra C*/
create table procedimentos(
	CodProcedimento int NOT NULL AUTO_INCREMENT,
	procedimento varchar (40) NOT NULL,
	preco float,
    PRIMARY KEY(CodProcedimento)
);

describe procedimentos;

INSERT INTO procedimentos (procedimento, preco) 
	values 
		('Laser facial', 3500.00),
        ('Laser mãos', 2500.00),
        ('Peeling químico', 1200.00),
        ('Peeling químico mãos', 800.00);

select * from procedimentos;
        
/*Letra D*/
alter table clientes add CodPaciente INT NOT NULL PRIMARY KEY auto_increment;

/*Letra E*/
UPDATE clientes SET telefone = '41987658455' WHERE CodPaciente = 1;

/*Letra F*/
UPDATE clientes SET endereco = 'Rua 21 de Abril, 4130' WHERE CodPaciente = 3;

/*Letra G*/
UPDATE clientes SET nome = 'Ana Maria Barbosa dos Santos' WHERE CodPaciente = 2;

/*Letra H*/
UPDATE procedimentos SET preco = '900.00' WHERE CodProcedimento = 4;

drop database BD_empresa;


