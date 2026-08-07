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

create or replace view vw_saldo_usuario as select 
 	u.nome as usuario,
	SUM(
		case
			when c.tipo = 'RECEITA' then m.valor
			else 0
		end
	) as total_receita,
	SUM (
		case
			when c.tipo = 'DESPESA' then m.valor
			else 0
		end
	) as total_despesa,
		SUM(
		case
			when c.tipo = 'RECEITA' then m.valor
			else 0
		end
	)
	-
		SUM (
		case
			when c.tipo = 'DESPESA' then m.valor
			else 0
		end
	) as saldo
	from categorias c 
	join movimentacoes m 
		on m.categoria_id = c.id
	join usuarios u
	 on m.usuario_id = u.id
	group by u.id, u.nome
 
 
 
