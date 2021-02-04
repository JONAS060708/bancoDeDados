create database cadastros;

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

create database cadastro
default character set utf8 /*codificação de linguagens acentuação, quando não define collate nas informações  o banco de dados não fica com as configurações de caracteres que vamos precisar na linguagem */
default collate utf8_general_ci;

 drop table `pessoas`;/*COLOCAR ENTRE CRASES PERMITE COLOCAR ACENTO NAS PALAVRAS*/
/*[ DDL ] data definition langrage --  comandos de manipulação*/
create table pessoas(
	id int not null auto_increment, 			/*CHAVE PRIMARIA NÃO É IGUAL A OUTRO CAMPO, e auto increment*/
	nome varchar(30) not null, 					/*OBRIGATÓRIO COLOCAR DADOS */
	nascimento date, 							/*para colocar a data de nascimento em vez da idade*/
	sexo enum('M','F'),							/*OBRIGA SOMENTE OS CARACTERES ESCOLHIDOS*/
	altura decimal(3,2),						/*3 CAMPOS NO TOTAL, E DOIS DEPOIS DA VIRGULA*/
	peso decimal(6,3),
	nacionalidade varchar(20) default 'BRASIL', /*DEFINE O CAMPO PADRÃO SE CASO NADA COLOCADO*/
    primary key (id) 							/*DEFINE COMO CHAVE PRIMARIA O CAMPO ESCOLHIDO*/
)DEFAULT charset = utf8;

/*CRIANDO NOVA TABELA*/
create table if not exists cursos(
nome varchar(30) not null unique,/*NÃO DEIXA COLOCAR O MESMO NOME NO CAMPO*/
descricao text,
carga int unsigned,/*SEM SINAL NÃO DEIXA COLAR SINAL NO NÚMERO */
totaulas int,
ano year default '2021'
) default charset 'utf8';

/*ADICIONANDO DADOS NA TABELA*/
insert into cursos(nome,descricao,carga,totaulas,ano) value
('PROGRAMAÇÃO','basico de programação com jonas','40','15','2021'),
('PHP','basico de  programação PHP com jonas','40','32','2022');

/*MOSTRANDO DADOS DA TABELA*/
select * FROM cursos;

/*COLOCANDO COLUNA NA PRIMEIRA POSIÇÃO */
ALTER TABLE cursos ADD COLUMN idcursos INT FIRST;

/* ALTERANDO TIPO DE CONSTRAINS DA  COLUNA */
alter table cursos
modify column idcursos int(3) auto_increment;/*MODIFICA A COLUNA*/
alter TABLE	cursos ADD primary key(idcursos);
describe cursos;

/*APAGANDO TABLELA*/
DROP TABLE cursos;

/*INSERINDO DADOS NA TABELA*/
/*[ DML ] data manipulation langrage --  comandos de manipulação*/
insert into 
pessoas(nome,nascimento,sexo,altura,peso,nacionalidade) /*O ID POR ESTAR EM AUTO INCREMENT NÃO PRECISA SER PASSADO COMO DADO*/
values
('PAULINHO','1957-06-06','M','1.70','74.5','IRLANDA'), /*INSERINDO VARIOS DADOS AO MESMO TEMPO */
('SABRINA','1995-09-26','F','1.55','58.5',default),
('NICOLLE','2016-03-10','F','0.75','35.5',default);

SELECT * FROM cadastro.pessoas; /*SELECIONA TODOS OS DADOS DA TABELA*/

alter table pessoas
add column profissao varchar(10) after nome; /*adicionando campos na tabela, apos a column desejada*/


alter table pessoas
drop column profissao;

alter table pessoas
modify column profissao varchar(20) not null default '';/*MODIFICA A COLUNA*/
describe pessoas;
/*RENOMEANDO COLUNA*/
alter table pessoas
change column profissao prof varchar(20);
/*RENOMEANDO TABELA*/
alter table pessoas rename to gafanhotos;
alter table gafanhotos rename to pessoas;

DELETE FROM `cadastro`.`pessoas` WHERE (`id` = '1');