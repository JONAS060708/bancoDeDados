SELECT * FROM gafanhotos where nome like '%cabral%'; /*SELECIONA TODOS OS DADOS DA TABELA*/
select * from cursos where c_nome like '%a%';
select g_nome, g_id from gafanhotos order by g_nome;
DELETE FROM `cadastro`.`gafanhotos` WHERE nome like 'jonas%';
describe cursos; /*MOSTRA AS COLULAS DA TABELA*/

update gafanhotos set g_nome='jonas o tal' where g_id = '1';
insert into gafanhotos(nome) values('Jonas Pedroso Cabral');


SELECT * FROM tb_funcionarios;
SELECT * FROM tb_funcionarios;
