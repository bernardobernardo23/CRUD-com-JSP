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

Desenvolvido com a playlist do professor evandro teruel https://www.youtube.com/watch?v=whSimU8GfhY&list=PLmhTO6CBiifNKl7EUfJbpnqLD3ydLCoAg

