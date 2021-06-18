create database bancoreserva;
CREATE DATABASE crud1;

create table pessoas(
nome varchar(30),
idade tinyint,
sexo char(1),
altura float,
peso float,
nacionalidade varchar(20)
);
describe pessoas;

drop database cadastros;

create database cadastro default character set utf8 /*codificação de linguagens acentuação, quando não define collate nas informações  o banco de dados não fica com as configurações de caracteres que vamos precisar na linguagem */
default collate utf8_general_ci;

 drop table `pessoas`;/*COLOCAR ENTRE CRASES PERMITE COLOCAR ACENTO NAS PALAVRAS*/
 

alter table pessoas
add column profissao varchar(10) after nome; /*adicionando campos na tabela, apos a column desejada*/
alter table pessoas
drop column profissao;

alter table pessoas
modify column profissao varchar(20) not null default '';/*MODIFICA A COLUNA*/

alter table tb_clientes
modify column codigo_cliente int unique  not null;

/*[ DDL ] data definition langUage --  comandos de definição*/
create table pessoas(
	id_pessoa int not null auto_increment, 			/*CHAVE PRIMARIA NÃO É IGUAL A OUTRO CAMPO, e auto increment*/
	nome varchar(30) not null, 					/*OBRIGATÓRIO COLOCAR DADOS */
	nascimento date, 							/*para colocar a data de nascimento em vez da idade*/
    login varchar(10) not null,
    senha varchar(8) not null,
    tipo enum('A','F','C'), /*ADMINISTRADOR , FUNCIONARIO, CLIENTE*/
	sexo enum('M','F'),							/*OBRIGA SOMENTE OS CARACTERES ESCOLHIDOS*/
	altura decimal(3,2),						/*3 CAMPOS NO TOTAL, E DOIS DEPOIS DA VIRGULA*/
	peso decimal(6,3),
	nacionalidade varchar(20) default 'BRASIL', /*DEFINE O CAMPO PADRÃO SE CASO NADA COLOCADO*/
    primary key (id_pessoa) 							/*DEFINE COMO CHAVE PRIMARIA O CAMPO ESCOLHIDO*/
)DEFAULT charset = utf8;

/*CRIANDO NOVA TABELA*/
create table if not exists cursos(
nome varchar(30) not null unique,/*NÃO DEIXA COLOCAR O MESMO NOME NO CAMPO*/
descricao text,
carga int unsigned,/*SEM SINAL NÃO DEIXA COLAR SINAL NO NÚMERO */
totaulas int,
ano year default '2021'
) default charset 'utf8';



/*COLOCANDO COLUNA NA PRIMEIRA POSIÇÃO */
ALTER TABLE cursos ADD COLUMN idcursos INT FIRST;

/* ALTERANDO TIPO DE CONSTRAINS DA  COLUNA */
alter table cursos
modify column idcursos int(3) auto_increment;/*MODIFICA A COLUNA*/
alter TABLE	cursos ADD primary key(idcursos);
alter table gafanhotos add foreign key(g_id) references assiste(idgafanhoto);
alter table assiste add foreign key(idgafanhoto) references gafanhotos(g_id);/*ADICIONANDO FOREING KEY*/
alter table assiste drop foreign key assiste_ibfk_2;/*REMOVENDO FOREING KEY*/
describe cursos;

/*APAGANDO TABLELA*/
DROP TABLE cursos;

/*RENOMEANDO COLUNA*/
alter table cursos change column idcurso c_id int;
alter table cursos change column nome c_nome varchar(30);
alter table gafanhotos change column id g_id int;
alter table gafanhotos change column nome g_nome varchar(30);
alter table assiste change column id a_id int;

alter table pessoas
change column profissao prof varchar(20);
/*RENOMEANDO TABELA*/
alter table pessoas rename to gafanhotos;
alter table gafanhotos rename to pessoas;