use formativaHogwarts;

create table status_tarefas(
id bigint not null auto_increment primary key,
status varchar(250) not null
);

create table tarefas (
id bigint not null auto_increment primary key,
titulo varchar(250) not null,
descricao varchar(2500) not null,
solicitanteFK bigint not null,
ambienteFK bigint not null,
data_de_criacao datetime not null default(now()),
prazo datetime not null default(now()),
imagens varchar(5000),
statusFK bigint not null,
foreign key (statusFK) references status_tarefas (id),
foreign key (solicitanteFK) references usuarios (id),
foreign key (ambienteFK) references locais (id)
);

create table responsaveis_das_tarefas (
id bigint not null auto_increment primary key,
responsavelFK bigint not null,
tarefaFK bigint not null,
foreign key (responsavelFK) references usuarios (id),
foreign key (tarefaFK) references tarefas (id)
);

create table historico (

);