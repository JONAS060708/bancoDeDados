/*INSERINDO DADOS NA TABELA*/
/*[ DML ] data manipulation langrage --  comandos de manipulação*/
insert into 
pessoas(nome,nascimento,sexo,altura,peso,nacionalidade) /*O ID POR ESTAR EM AUTO INCREMENT NÃO PRECISA SER PASSADO COMO DADO*/
values
('PAULINHO','1957-06-06','M','1.70','74.5','IRLANDA'), /*INSERINDO VARIOS DADOS AO MESMO TEMPO */
('SABRINA','1995-09-26','F','1.55','58.5',default),
('NICOLLE','2016-03-10','F','0.75','35.5',default);

DELETE FROM `cadastro`.`pessoas` WHERE (`id` = '1');

insert into cursos(nome,descricao,carga,totaulas,ano) value
('PHOTOSHOP','','10','8','2014'),
('PGP','','40','20','2010'),
('JARVA','','10','29','2000'),
('MYSQL','','30','15','2016'),
('WORD','','40','30','2016'),
('SAPATEADO','','30','8','2018'),
('COZINHA ÁRABE','','40','30','2018'),
('YOUTUBER','','5','2','2018');

/*ADICIONANDO DADOS NA TABELA*/
insert into cursos(nome,descricao,carga,totaulas,ano) value
('PROGRAMAÇÃO','basico de programação com jonas','40','15','2021'),
('PHP','basico de  programação PHP com jonas','40','32','2022');

/*MOSTRANDO DADOS DA TABELA*/
select * FROM cursos;

/*USANDO COMANDOS DE MANIPULAÇÃO DE DADOS*/
SELECT * FROM cadastro.cursos;

update cursos SET nome='HTM5' where idcursos = '1';/*ATUALIZANDO REGISTRO DE APENAS UMA COLUNA*/

update cursos set nome='PHP',ano='2015' where idcursos='4'; /* ATUALIZANDO REGISTRO DE MAIS DE UMA COLUNA USANDO APENAS VIRGULA*/

update cursos set nome='JAVA',carga='40',ano='2015'where idcurso='5' limit 1; /*LIMITANDO ALTERAÇÃO PARA APENAS 1*/

update cursos set ano='2018',carga='0' where ano='2050';/*MUDANDO DADOS DE VARIAS LINHAS COM WHERE NA COLUNA DADOS IGUAIS*/

update cursos SET ano='2018',carga='0'where ano='2050' limit 1;/*alterando apenas 1 linha*/

/*REMOVENDO LINHAS*/
delete FROM cursos where idcursos='8';
delete FROM cursos where ano='2050';

/*REMOVENDO TUDO DE UMA TABELA*/
truncate cursos;