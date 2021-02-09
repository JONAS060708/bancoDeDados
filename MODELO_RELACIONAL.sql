/*DIAGRAMA ENTIDADE RELACIONAMENTO DER*/
/*
ENTIDADES - ATRIBUTOS--
RELACIONAMENTO -- ternários?
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
create table assiste(
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key(id),
foreign key (idgafanhoto) references gafanhotos(id),
foreign key(idcurso) references cursos(idcurso) 
)default charset = utf8;

describe assiste;
select * from assiste;
insert into assiste
values
(default,'2014-06-01','7','10'),
(default,'2014-07-01','8','11'),
(default,'2014-08-01','9','12'),
(default,'2014-09-01','10','13'),
(default,'2014-10-01','11','14');

/*VISUALIZAR DADOS DE MULTIPLAS JANELAS*/

select g.nome ,g.id, a.idgafanhoto, c.idcurso,a.idcurso, c.nome from gafanhotos as g
inner join assiste as a on g.id = a.idgafanhoto
inner join cursos as c on c.idcurso = a.idcurso
order by g.nome;
