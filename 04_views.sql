create view vw_movimentacoes as select 
	u.nome as usuario,
	c.nome as categoria,
	c.tipo,
	m.descricao,
	m.valor,
	m.data_transacao
from movimentacoes m
join usuarios u
	on m.usuario_id = u.id
join categorias c
	on m.categoria_id = c.id;

create view vw_despesas as select 
	u.nome as usuarios,
	c.nome as categorias,
	m.descricao,
	m.valor,
	m.data_transacao
from movimentacoes m
join usuarios u
	on m.usuario_id = u.id
join categorias c
 on m.categoria_id = c.id
 where c.tipo = 'DESPESA'
 
 create view vw_receita as select 
	u.nome as usuarios,
	c.nome as categorias,
	m.descricao,
	m.valor,
	m.data_transacao
from movimentacoes m
join usuarios u
	on m.usuario_id = u.id
join categorias c
 on m.categoria_id = c.id
 where c.tipo = 'RECEITA'
 
 