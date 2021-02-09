/*DIAGRAMA ENTIDADE RELACIONAMENTO DER*/
/*
ENTIDADES - ATRIBUTOS--
RELACIONAMENTO -- 
CARDINALIDADE -- 

chave primaria , chave estrangeira é a chave primaria de outra tabela
*/
/* INER JOIN E OUTER JOIN */
/*RELACIONAMENTO DE UM PARA UM (MARIDO ESPOSA)*/

/*RELACIONAMENTO UM PARA MUITOS GAFANHOTOS CURSOS*/
describe gafanhotos;
alter table gafanhotos add column cursopreferido int;
alter table gafanhotos add foreign key (cursopreferido) references cursos(idcurso); /*adicionando chave estrangeira*/
update gafanhotos set cursopreferido ='6' where id ='1';/*adicionando vinculo curso preferido*/
delete from cursos where idcurso='6';/*ao tentar deletar um curso usado com outra tabela da erro pois precisa estar desvinculado para tal*/

/*MOSTRANDO DADOS DE DUAS TABELAS COM JOIN (on) usado pra estabelecer e mostrar apenas os relacionamentos entre as tabelas*/
/*pode-se usar apelidos com o comando (as) diminuindo o tamanho da query*/
select g.nome, g.cursopreferido, c.nome,c.ano 
from gafanhotos as g 
/*left colocando a direção o outer join pega a tabela selecionada*/ 
right outer join cursos as c
/*inner join cursos as c /*iner join pega apenas as relações OUTER JOIN pega as todas as linhas da tabela (lado) selecionado*/
on  g.cursopreferido = c.idcurso
order by g.cursopreferido;

select nome,cursopreferido from gafanhotos where cursopreferido != 'null' order by cursopreferido;
select nome,ano from cursos;
/*RELACIONAMENTO MUITOS PARA MUITOS CLIENTE PRODUTO*/