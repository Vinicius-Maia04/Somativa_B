create database Somativa_Maia;
use Somativa_Maia;

alter table usuarios add column foto_perfil varchar(250);
alter table usuarios add column num_celular varchar(14);

create table status_tarefas(
id bigint not null auto_increment primary key,
status varchar(250) not null
);

insert into status_tarefas (status) values
('Aberta'),
('Em andamento'),
('Concluída'),
('Encerrada');

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

insert into tarefas (titulo, descricao, solicitanteFK, ambienteFK, prazo, imagens, statusFK) values
('Computador com Defeito', 'O Host27 da sala de Informática 01 está com travamentos constantes', 2, 5, '2023-06-15', 'imagem.jpg', 1),
('Microfones no auditório', 'Os novos microfones acabaram de chegar, preciso que alguem vá ao auditório e configure-os corretamente', 1, 2, '2023-06-08', 'imagem.jpg', 1),
('Equipamento com Defeito', 'Um dos multímetros do Laboratório de Eletrônica não está ligando', 3, 1, '2023-06-25', 'imagem.jpg', 1),
('Ferramentas Faltando', 'Algumas ferramentas do Laboratório de Mecânica não estavam na caixa quando fui abrí-la hoje de manhã, preciso que alguem encontre e coloque elas de volta no lugar', 6, 4, '2023-06-20', 'imagem.jpg', 1);

create table responsaveis_das_tarefas (
id bigint not null auto_increment primary key,
responsavelFK bigint not null,
tarefaFK bigint not null,
foreign key (responsavelFK) references usuarios (id),
foreign key (tarefaFK) references tarefas (id)
);

insert into responsaveis_das_tarefas (responsavelFK, tarefaFK) values
(2,2),
(3,2),
(1,3),
(3,4),
(5,1);

create table historico (
	id bigint not null auto_increment primary key,
    tarefaFK bigint not null,
	statusFK bigint not null,
    data_hora datetime not null default now(),
    foreign key(tarefaFK) references tarefas(id),
    foreign key(statusFK) references status_tarefas(id)
);

insert into historico (tarefaFK, statusFK, data_hora) values
(1,2,'2023-06-10'), (2,3,'2023-06-05'), (3,1,'2023-06-07'), (4,4,'2023-06-18');

/* CONSULTAS */

/* 1 */
select * from tarefas t
join responsaveis_das_tarefas rt on rt.tarefaFK = t.id;

/* 2 */
select l.*, count(*) from locais l 
join tarefas t on l.id = t.ambienteFK group by t.ambienteFK having count(l.id)>2;

/* 3 */
select u.*,count(*) from tarefas t 
join responsaveis_das_tarefas rt on t.id = rt.responsavelFK
join usuarios u on rt.responsavelFK = u.id group by u.id having count(u.id)>=2;

/* 4 */
select e.*,t.* from tarefas t 
join locais l on t.ambienteFK = l.id 
join eventos e on l.id = e.localFk 
join historico h on t.id = h.tarefaFK
where e.inicio > now() and h.statusFK != '4' group by e.id,t.id;

/* 5 */
select l.*, count(*) from locais l 
join tarefas t on l.id = t.ambienteFK group by l.id;

/* 6 */
select l.*, count(*) from locais l 
join tarefas t on l.id = t.ambienteFK 
join historico h on t.id = h.tarefaFK
where h.statusFK = 4 group by l.id;

/* 7 */
select u.*,count(*) from usuarios u 
join responsaveis_das_tarefas rt on u.id = rt.responsavelFK group by u.id;

/* 8 */
select u.*,count(*) from usuarios u 
join responsaveis_das_tarefas rt on u.id = rt.responsavelFK 
join tarefas t on rt.responsavelFK = t.id 
join historico h on t.id = h.tarefaFK
where h.statusFK < '4' group by u.id;

/* 9 */
select *, AVG(m.qnt) from locais l 
join (select ambienteFK, month(prazo)as mes,count(*) as qnt from tarefas 
group by mes,ambienteFK) m on l.id = m.ambienteFK group by m.mes,l.id;