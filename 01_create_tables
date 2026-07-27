create table usuarios (
	id integer generated always as identity primary key,
	nome varchar(100) not null,
	email varchar(100) unique not null,
	senha varchar(255) not null,
	ativo boolean default true,
	data_cadastro timestamp default current_timestamp,
	data_exclusao timestamp
)

create table categorias (
	id integer generated always as identity primary key,
	usuario_id integer not null,
	nome varchar (100) not null,
	tipo varchar (20) not null,
	
	constraint uq_categorias_usuario 
	unique (usuario_id, nome),
	
	constraint fk_categorias_usuario 
	foreign key (usuario_id) references usuarios(id),
	
	constraint chk_categorias_tipo
	check(tipo in ('RECEITA', 'DESPESA'))
)

create table movimentacoes (
	id integer generated always as identity primary key,
	usuario_id integer not null,
	categoria_id integer not null,
	descricao varchar (100) not null,
	valor numeric (10, 2) not null,
	data_transacao timestamp default current_timestamp,
	
	constraint fk_movimentacoes_usuario
	foreign key (usuario_id) references usuarios(id) on delete cascade,
	
	constraint fk_movimentacoes_categoria
	foreign key (categoria_id) references categorias(id) on delete cascade,
	
	constraint chk_movimentacoes_valor 
	check (valor > 0)
	
)
