/* Verifica se autocommit está ativo ou não (1 para ativo, 0 para inativo. */
SELECT @@autocommit;
/* Força o MySQL a executar o commit automaticamente. */
SET autocommit = 1;
/* Verifica se autocommit está ativo ou não (1 para ativo, 0 para inativo. */
SELECT @@autocommit;
/* Força o MySQL a executar o commit automaticamente. */
SET autocommit = 1;
/* Cria o banco de dados "teste", caso o mesmo não exista. */
create database if not exists teste;
/* Seleciona o banco de dados para uso. */
use teste;
/* Cria a tabela de clientes. */
create table clientes(
	id int not null auto_increment,
    nome varchar(40),
    cidade varchar(30),
    primary key(id)
);
/* Mostra a estrutura da tabela de clientes. */
describe clientes;
/* Inclui 5 registros na tabela de clientes. */
insert into clientes (nome, cidade)
values
('Ana', 'Curitiba'),
('Beatriz', 'Maringá'),
('Carolina', 'Londrina'),
('Denise', 'Umuarama'),
('Elaine', 'São José dos Pinhais');
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Exclui o registro de id = 1 da tabela de clientes. Não será possível a recuperação do registro. */
delete from clientes where id = 1;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Inicia uma transação. Esse comando desabilita temporariamente o método "commit". */
start transaction;
/* Exclui o registro de id = 2 da tabela de clientes. */
delete from clientes where id = 2;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Recupera o registro de id = 2 da tabela de clientes. */
rollback;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Inicia uma transação. */
start transaction;
/* Altera a cidade do registro de id = 2 da tabela de clientes. */
update clientes
set cidade = 'Campo Largo' where id = 2;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Restaura o registro de id = 2 da tabela de clientes. */
rollback;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Inicia uma transação. */
start transaction;
/* Exclui o registro de id = 2 da tabela de clientes. */
delete from clientes where id = 2;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Confirma a transação. Após a execução do comando não há possilidade de restauração. */
commit;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Inicia uma transação. */
start transaction;
/* Exclui o registro de id = 3 da tabela de clientes. */
delete from clientes where id = 3;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Confirma a transação. Após a execução do comando não há possilidade de restauração. */
commit;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Inicia uma transação. */
start transaction;
/* Atribui um ponto de restauração da transação. */
savepoint ponto_restauracao;
/* Exclui o registro de id = 4 da tabela de clientes. */
delete from clientes where id = 4;
/* Exclui o registro de id = 5 da tabela de clientes. */
delete from clientes where id = 5;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Desfaz as transações até o ponto de restauração. */
rollback to ponto_restauracao;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/*Adiciona alguns registros*/
insert into clientes (nome, cidade)
values
('Carolina', 'Londrina'),
('Denise', 'Umuarama'),
('Elaine', 'São José dos Pinhais');

/* Inicia uma transação. */
start transaction;
/* Exclui o registro de id = 4 da tabela de clientes. */
delete from clientes where id = 4;
/* Exclui o registro de id = 5 da tabela de clientes. */
delete from clientes where id = 5;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
rollback;

start transaction;
/* Exclui o registro de id = 6 da tabela de clientes. */
delete from clientes where id = 6;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Atribui um ponto de restauração da transação. */
savepoint ponto_restauracao;
/* Exclui o registro de id = 7 da tabela de clientes. */
delete from clientes where id = 7;
/* Exclui o registro de id = 8 da tabela de clientes. */
delete from clientes where id = 8;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Desfaz as transações até o ponto de restauração. */
rollback to ponto_restauracao;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
rollback;


start transaction;
/* Exclui o registro de id = 6 da tabela de clientes. */
delete from clientes where id = 6;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Atribui um ponto de restauração da transação. */
savepoint ponto_restauracao;
/* Exclui o registro de id = 7 da tabela de clientes. */
delete from clientes where id = 7;
/* Exclui o registro de id = 8 da tabela de clientes. */
delete from clientes where id = 8;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Desfaz as transações até o ponto de restauração. */
rollback to ponto_restauracao;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
commit;

start transaction;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Atribui um ponto de restauração da transação. */
savepoint ponto_restauracao;
/* Exclui o conteúdo da tabela clientes. */
Truncate table clientes;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Desfaz as transações até o ponto de restauração. */
rollback to ponto_restauracao;
/* Mostra os registros da tabela de clientes. */
select * from clientes;
/* Transação não retorna os dados do comando truncate*/
/* Exclui a tabela de clientes. */

/* Inicia uma transação. */
start transaction;
truncate clientes;
select * from clientes;
rollback;
/* Transação não retorna os dados do comando truncate*/
/* Exclui a tabela de clientes. */
start transaction;
drop table clientes;
/* Exclui o banco de dados. */
drop database teste;
rollback;
use teste;
