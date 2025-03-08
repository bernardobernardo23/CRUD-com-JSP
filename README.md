CRUD com JSP, nao funciona no github pages por conta do servidor

codigo MYSQL
create schema banco;
use banco;
create table produto(
	codigo int not null primary key,
    nome varchar(50) not null,
    marca varchar(50) null,
    preco double
 );
