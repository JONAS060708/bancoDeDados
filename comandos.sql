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

/*INSERINDO DADOS NA TABELA*/
/*[ DML ] data manipulation langrage --  comandos de manipulação*/
insert into 
pessoas(nome,nascimento,sexo,altura,peso,nacionalidade) /*O ID POR ESTAR EM AUTO INCREMENT NÃO PRECISA SER PASSADO COMO DADO*/
values
('PAULINHO','1957-06-06','M','1.70','74.5','IRLANDA'), /*INSERINDO VARIOS DADOS AO MESMO TEMPO */
('SABRINA','1995-09-26','F','1.55','58.5',default),
('NICOLLE','2016-03-10','F','0.75','35.5',default);

SELECT * FROM cadastro.pessoas; /*SELECIONA TODOS OS DADOS DA TABELA*/
DELETE FROM `cadastro`.`pessoas` WHERE (`id` = '1');