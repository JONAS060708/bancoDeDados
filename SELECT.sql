select * FROM cursos order by nome desc;/*order by organiza na ordem que quer da coluna ASC - ASCENDENTE , DESC -DECRESCENTE*/
select  ano,nome, carga, ano FROM cursos order by ano,nome asc;/*chama quantas vezes quiser e ordena as colunas conforme a ordem escrita*/
select ano, nome,carga from cursos where ano <= '2016' and carga <= '40' order by ano,nome;/*WHERE FILTRA POR LINHA*/
select nome,ano from cursos where ano between 2014 and 2016 order by ano desc, nome;/* between pega entre dados se quiser ordenar diferente coloca a condição que quer antes da virgula*/
select nome, descricao,ano , carga from cursos  where ano in (2014,2016,2020) order by ano;/*seleciona linhas especificas*/
select nome, carga, totaulas from cursos where carga > '35' and totaulas < '30' order by totaulas ;
select * from cursos where nome like '%a%';/*like mais o % antes ou depois puxa os dados requeridos começando ou terminando pela palavra selecionada*/
select * from cursos where nome not like '%a%';
select * from cursos where nome like 'ph%p_';/*o underline no final exige que tenha algum caracter após a palavra escrita*/
select * from gafanhotos where nome like '%silva%';

/*FUNÇÕES DE AGREGAÇÃO NO SQL DISTINÇÃO PEGA APENAS UM VALOR DE CADA LINHA*/

select  distinct nacionalidade from gafanhotos order by nacionalidade; /*DISTINCT MOSTRA OS DADOS SEM REPETIÇÃO CASO TENHA*/
select count(*) from cursos where carga > 40; /*FAZ A CONTAGEN DE LINHAS DA COLUNA SELECIONADA OU DE TUDO*/
select max(carga) from cursos where carga < 30; /* verifica qual é o maior valor da coluna*/
select max(totaulas) from cursos where ano ='2016';
select nome,min(totaulas) from cursos where ano ='2016';
select sum(totaulas) from cursos where ano ='2016';
select avg(totaulas) from cursos; /*MEDIA DO TOTAL DE AULAS*/

/*SELECT AULA 3 AGRUPAMENTO */
select totaulas, count(*) from cursos group by totaulas;/*AGRUPA OS CAMPOS E CONTA QUANTAS UNIDADES TEM CADA GRUPO*/
select ano, count(*) FROM cursos 
group by ano /*agrupa*/
having count(ano) >= 5 /* só funciona com o campo agrupado , quem tem seleciona apenas os maior igual a contagem 5*/ 
order by count(*); /*ordena*/

/*COLOCANDO SELECT DENTRO DE SELECT*/
select avg(carga) from cursos; /*media*/
select carga,count(*) from cursos/*seleciona*/
where ano > 2015 /*filtra*/
group by carga /*agrupa*/
having carga > (select avg(carga) from cursos); /**/


/*EXERCÍCIOS*/
select * from gafanhotos where sexo='F';
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31' order by nascimento;
select * from gafanhotos where sexo ='M' and profissao like '%programador%' order by nome;
select * from gafanhotos where sexo ='F' and nacionalidade ='Brasil' and nome like 'J%';
select * from gafanhotos where sexo ='M' and nacionalidade != 'Brasil' and peso < '100' and nome like '%silva%';
select nome,max(altura) from gafanhotos where sexo='M' and nacionalidade ='Brasil';
select avg(peso) from gafanhotos;
select nome,nascimento,min(peso) from gafanhotos where sexo ='F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';
select * from gafanhotos where sexo='F' and altura > '1.90';

/*EXERCÍCIOS SELECT 3*/
select profissao,count(*)  from gafanhotos group by profissao order by count(profissao);
select sexo,count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo ;
select nacionalidade,count(*) from gafanhotos where nacionalidade = 'portugal';
select nacionalidade, count(*) from gafanhotos where nacionalidade != 'brasil' group by nacionalidade having count(nacionalidade) > 3;
select avg(altura) from gafanhotos;
select altura,count(*),peso from gafanhotos where peso > '100' group by altura having altura > (select avg(altura) from gafanhotos) order by count(*);

