/* Desenvolvimento de Banco de Dados para ONG
/*Criação de um banco de dados de ONG de animais

*/

#Como criar um Banco de Dados
create database ong;

#Como usar o Banco de Dados
use ong;

#Como excluir o Banco de Dados
drop database ong;

#Criação da Abrigo
#Tabelas cadastrais (Dimensão)
create table abrigo(
id_abrigo bigint auto_increment,
nome varchar (100),
endereco varchar (200),
telefone varchar (20),
email varchar (100),
constraint pk_id_abrigo primary key (id_abrigo)
);


#Consulta da tabela abrigo
select*from abrigo;

create table adotante(
id_ad  bigint not null auto_increment,
nome_ad varchar(200) not null,
telefone_ad varchar (20),
email_ad varchar (100),
endereco varchar(200),
constraint pk_id_ad primary key (id_ad)
);

select * from adotante;

create table animal(
id_animal bigint auto_increment,
especie varchar(50),
raca varchar (50),
cor varchar (50),
kg numeric (10,2),
idade int,
sexo varchar (20),
porte varchar (20),
id_abrigo bigint,
id_ad bigint,
constraint pk_id_animal primary key (id_animal),
constraint fk_id_abrigo foreign key (id_abrigo) references abrigo(id_abrigo),
constraint fk_id_ad foreign key (id_ad) references adotante(id_ad)
);

select * from animal;

create table funcionario( 
id_func bigint auto_increment,
nome varchar (100),
tel varchar (20),
cpf varchar(20),
id_abrigo_func bigint,
constraint pk_id_func primary key (id_func),
constraint fk_id_abrigo_func foreign key (id_abrigo_func) references abrigo(id_abrigo)
);

 select * from funcionario;
 
 #Tabela de Histórico (Fato)
 create table possui (
 num_adocao bigint unique,
 dt_adc date,
 id_animal_ong bigint ,
 id_abrigo_ong bigint,
 id_adotante_ong bigint,
 constraint pk_num_adocao primary key(num_adocao),
 constraint fk_id_animal_ong foreign key (id_animal_ong) references animal(id_animal),
 constraint fk_id_abrigo_ong foreign key(id_abrigo_ong) references abrigo(id_abrigo),
 constraint fk_id_adotante_ong foreign key (id_adotante_ong) references adotante(id_ad)
 );

select * from possui;
 
create table alimento(
id_racao int not null,
nome varchar(50),
dt_validade date,
estoque int,
id_abrigo_abg bigint,
constraint pk_id_racao primary key (id_racao),
constraint fk_id_abg foreign key (id_abrigo_abg) references abrigo (id_abrigo)
);

select * from alimento;
 
create table consumo (
id_consumo int auto_increment,
data_consumo date,
valor_consumo numeric (6,2),
id_abrigo_consumo bigint,
constraint pk_id_consumo primary key(id_consumo),
constraint fk_id_abrigo_consumo foreign key (id_abrigo_consumo) references abrigo(id_abrigo)
);
 
select * from consumo;
 
#Como fazer alterações nas tabelas
/*alter table animal add column id_ad bigint;
alter table animal add constraint fk_id_ad foreign key (id_ad) references  adotante(id_ad);
alter table animal change column kg kg varchar(20);
alter table animal change column idade idade varchar (20);

alter table abrigo drop column endereco;
alter table abrigo add column endereco varchar (200);
alter table abrigo add column funcionarios varchar(100);

alter table adotante drop column endereco_ad;

alter table funcionario modify nome varchar (150) not null;*/

#Inserindo valores nas Tabelas

#---TABELA ABRIGO---
insert into abrigo (nome,endereco,telefone,email) values ('Gatópoles' , 'Rua dos Gatos - 456','11950422058','gatopoles@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Cãolândia' , 'Rua dos Cães - 999','11950422098','caolandia@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Focinhos Felizes' , 'Rua dos Focinhos - 333','1195042358','focinhos.felizes@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Projeto Acolher' , 'Rua das Violetas - 11','15780422058','projetoacolhers@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Pata Voluntária' , 'Rua dos Lírios - 22','21780422098','patavoluntaria@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Anjos de Rua' , 'Travessa das Rosas - 33','1695042358','anjosderua@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Proteção Animal' , 'Rua dos Patos - 44','15950422067','protecaoanimal@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Anjo Pet' , 'Avenida dos Cães - 55','44956722098','anjopet@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('SOS Melhor Amigo' , 'Rua das Margaridas - 66','2295982358','sos.melhoramigos@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Patinhas Unidas' , 'Avenida Esmeralda - 77','12967422058','patinhasunidas@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Clube dos PetFriends' , 'Travessa dos Girassois - 88','23967422098','clubedospetfriends@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Cantinho Pet' , 'Rua dos Cristais - 456','1195042358','cantinhopet@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Amor Miau' , 'Rua Rubi - 99','15440422058','amormiau@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Clube Totó' , 'Rua Safira - 00','21790422098','clubetoto@ong.com');
insert into abrigo (nome,endereco,telefone,email) values ('Amor Auau' , 'Rua Ouro Feliz - 123','1395642358','amor.auau@ong.com');

#---TABELA ADOTANTE---
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Samara','119504025','samara@teste.com','Rua 1');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Gabriel','119503025','gabriel@teste.com','Rua 2');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Luana','119504038','luana@teste.com','Rua 3');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Francisca Oliveira','159504025','francisca@teste.com','Rua 1');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Fernanda Melo','319503025','fernanda@teste.com','Rua 2');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Jonathan Augusto','449504038','jonathan@teste.com','Rua 3');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Felipe dos Santos','129504025','felipe@teste.com','Rua 1');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Sara Ribeiro','218803025','sara@teste.com','Rua 2');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Giovanni Souza','679504038','giovanni@teste.com','Rua 3');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Sofia Sousa','139504025','sofia@teste.com','Rua 1');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Gabriela Almeida','169503025','gabriela@teste.com','Rua 2');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Luan Albuquerque','177704038','luan@teste.com','Rua 3');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Heitor de Oliveira','129504025','heitor@teste.com','Rua 1');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Pedro Henrique','215603025','pedro@teste.com','Rua 2');
insert into adotante (nome_ad, telefone_ad, email_ad, endereco) values ('Enzo Felipe','449504038','enzo@teste.com','Rua 3');

#---TABELA ANIMAL---
insert into animal (id_animal,especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
(1,'Gato','SRD','Preto','10kg','2 meses','F','Pequeno',1,1);
insert into animal (id_animal,especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
(2,'Cachorro','Labrador','branco','20kg','2 meses','F','Grande',1,2);
insert into animal (id_animal,especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
(3,'Gato','Belga','Cinza','5kg','1 Ano','M','Medio',1,3);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Cachorro','Pastor Alemão','Preto e Bege','20kg','2 anos','F','Grande',1,1);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Cachorro','Buldog','Tigrado','5kg','3 meses','M','Médio',1,2);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Cachorro','Husky','Preto e Branco','18kg','1 Ano','F','Grande',1,3);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Cachorro','Golden Retriever','Dourado','20kg','3 anos','F','Grande',1,1);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Cachorro','Chow-chow','Marrom','2kg','4 meses','F','Pequeno',1,2);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Cachorro','Maltês','Branco','5kg','1 Ano','M','Pequeno',1,3);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Gato','Siâmes','Marrom e Preto','5kg','3 anos','F','Médio',1,1);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Gato','Maine Coon','Cinza','4kg','1 ano','F','Grande',1,2);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Gato','Pelo Curto','Tigrado','7kg','4 Ano','M','Grandre',1,3);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Gato','Siberano','Tigrado','8kg','5 anos','F','Grande',1,1);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Gato','Angorá','Branco','6kg','2 anos','M','Médio',1,2);
insert into animal (especie,raca,cor,kg,idade,sexo,porte,id_abrigo,id_ad) values 
('Gato','Singapura','Bege','4kg','1 Ano','F','Pequeno',1,3);

#---TABELA FUNCIONARIO---
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Kenny',11950422065,458655988-84,1);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Kaio',11950422068,458656788-02,2);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Flavio',11950422065,458655759-78,3);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Gabriel',11950422065,458655759-78,3);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Luna de Souza',126750422065,128655988-84,1);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Nino Ribeiro',13880422068,348656788-02,3);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Nara Justino',14990422065,458655759-78,2);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Crystal Gomes',15950422069,678655759-78,4);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Mel Gomes',13670422065,988655988-84,5);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Apólo Gomes',12880422068,878656788-02,6);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Hércules da Silva',11890422065,238655759-78,7);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Atena Oliveira',12900422065,438655759-78,8);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Artemis Gomes',12880422065,448655988-84,9);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Zeus da Silva',11950422068,758656788-02,10);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Hera Pereira',12880422065,958655759-78,11);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Poseidon Sousa',14000422065,058655759-78,12);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Afrodite Albuquerque',12880422065,238655988-84,13);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Ares Ferreira',14880422068,328656788-02,14);
insert into funcionario (nome,tel,cpf,id_abrigo_func) values ('Evelyn Melo',23950422065,788655759-78,15);

#---TABELA POSSUI---
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(1,'2022-09-25',1,1,1);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(2,'2022-10-14',2,2,2);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(3,'2022-10-17',3,3,3);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(4,'2022-11-5',4,4,4);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(5,'2022-11-09',5,5,5);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(6,'2022-12-19',6,6,6);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(7,'2023-01-25',7,7,7);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(8,'2023-01-28',8,8,8);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(9,'2023-03-04',9,9,9);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(10,'2023-03-13',10,10,10);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(11,'2023-04-07',11,11,11);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(12,'2023-04-16',12,12,12);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(13,'2023-05-01',13,13,13);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(14,'2023-05-15',14,14,14);
insert into possui (num_adocao, dt_adc, id_animal_ong, id_abrigo_ong, id_adotante_ong ) values(15,'2023-05-31',15,15,15);

#---TABELA ALIMENTO---
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (1, 'Pro Plan', '2023-10-04', 456, 1);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (2, 'Royal Canin', '2023-11-25', 651, 2);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (3, 'Golden', '2023-09-14', 258, 3);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (4, 'Dog Chow', '2023-08-17', 753, 4);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (5, 'Equilíbrio', '2023-07-17', 951, 5);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (6, 'Max', '2023-12-03', 852, 6);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (7, 'Pedigree', '2023-11-26', 511, 7);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (8, 'Royal Canin Cat', '2023-12-08', 693, 8);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (9, 'Biofresh', '2023-10-04', 968, 9);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (10, 'Nutrilus ', '2023-11-09', 742, 10);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (11, 'Guabi', '2023-07-13', 321, 11);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (12, 'Herói', '2023-08-17', 365, 12);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (13, 'Magnus', '2023-12-08', 854, 13);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (14, 'Champ', '2023-12-02', 654, 14);
insert into alimento (id_racao, nome, dt_validade, estoque, id_abrigo_abg) values (15, 'Premier', '2023-09-07', 257, 15);

#---TABELA CONSUMO---
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (1, '2023-06-02', '10kg', 1);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (2, '2023-05-30', '90kg', 2);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (3, '2023-05-31', '47kg', 3);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (4, '2023-04-02', '80kg', 4);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (5, '2023-02-07', '55kg', 5);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (6, '2023-03-06', '63kg', 6);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (7, '2023-09-08', '67kg', 7);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (8, '2023-08-09', '89kg', 8);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (9, '2023-04-12', '79kg', 9);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (10, '2023-03-14', '91kg', 10);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (11, '2023-04-28', '98kg', 11);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (12, '2023-08-19', '68kg', 12);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (13, '2023-04-20', '61kg', 13);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (14, '2023-07-14', '81kg', 14);
insert into consumo (id_consumo, data_consumo, valor_consumo, id_abrigo_consumo) values (15, '2023-05-17', '72kg', 15);

#update(atualização) na tabela animal
/*update animal set id_ad = 1 where id_animal = 1;
update animal set id_ad = 2 where id_animal = 2;
update animal set id_ad = 3 where id_animal = 3;
update animal set id_abrigo = 2 where id_ad =2; 
update animal set id_abrigo = 3 where id_ad =3;*/

#update(atualização) na tabela possui
/*update possui set dt_adc= '2020-01-05 02:15:07'  where id_animal_ong=1; 
update possui set dt_adc= '2021-02-04 06:20:15'  where id_animal_ong=2; 
update possui set dt_adc= '2022-03-06 10:20:35'  where id_animal_ong=3;*/

#Select Específico 
/*select * from animal where especie = 'gato' and cor = 'cinza';
select * from adotante where nome = 'Samara' and telefone_ad = '119504025';
select * from abrigo where nome = 'Gatópoles' and endereco = 'Rua dos Gatos - 666';*/

#Select para consultar campos que estão em mais de uma tabela (junção de tabelas)
select a.nome_ad as nome_adotante, ab.nome as nome_abrigo
	from adotante as a, abrigo as ab, possui as p
		where a.id_ad = p.id_adotante_ong 
		 and  ab.id_abrigo = p.id_abrigo_ong 
		 and month(p.dt_adc) = '11'
order by nome_adotante;

#Select para consultar campos que estão em mais de uma tabela (junção de tabelas)
select an.especie as especie_animal, ab.nome as nome_abrigo
from animal as an, abrigo as ab, possui as p
where ab.id_abrigo = p.id_animal_ong
  and an.id_animal = p.id_abrigo_ong 
  and an.especie = (especie);

#Select para consultar campos que estão em mais de uma tabela (junção de tabelas),mas usando o INNER JOIN
SELECT a.nome AS abrigo, ad.nome_ad AS adotante , animal.id_animal AS animal
	FROM possui AS p 
		INNER JOIN abrigo AS a ON a.id_abrigo = p.id_abrigo_ong
		INNER JOIN adotante AS ad ON ad.id_ad = p.id_adotante_ong
		INNER JOIN animal as animal on animal.id_animal = p.id_animal_ong;

#Select para consultar campos que estão em mais de uma tabela (junção de tabelas),mas usando o INNER JOIN
SELECT a.nome AS nome_abrigo, an.especie AS especie_animal
	FROM possui AS p 
		INNER JOIN abrigo AS a ON a.id_abrigo = p.id_abrigo_ong
		INNER JOIN animal as an on an.id_animal = p.id_animal_ong;

#Criando views abrangendo dados das tabelas com filtragem
create view  RelacaoAbrigoAdotante as
SELECT a.nome AS abrigo, ad.nome_ad AS adotante , animal.id_animal AS animal
	FROM possui AS p 
		INNER JOIN abrigo AS a ON a.id_abrigo = p.id_abrigo_ong
		INNER JOIN adotante AS ad ON ad.id_ad = p.id_adotante_ong
		INNER JOIN animal as animal on animal.id_animal = p.id_animal_ong;

select * from RelacaoAbrigoAdotante;

#Criando views abrangendo dados das tabelas com filtragem
create view RelacaoAbrigoAnimal as 
SELECT a.nome AS nome_abrigo, an.especie AS especie_animal
	FROM possui AS p 
		INNER JOIN abrigo AS a ON a.id_abrigo = p.id_abrigo_ong
		INNER JOIN animal as an on an.id_animal = p.id_animal_ong;

select * from RelacaoAbrigoAnimal;

#Criando procedimento com passagem de parâmetros
DELIMITER //
CREATE PROCEDURE ConsultaTotalAnimal(in NomeEspecie varchar(50), out Total int)
BEGIN
	select count(*) into Total from animal 
    where especie like concat ("%", NomeEspecie, "%");
END//

call ConsultaTotalAnimal ("Ca", @Total);
select @Total;

drop procedure ConsultaTotalAnimal;

DELIMITER //
CREATE function fConsultaTotalAnimal(parte_nome varchar(50)) returns int
BEGIN
declare total int;
	select count(*) into total from animal 
    where especie like concat ("%", parte_nome, "%");
    return total;
END; //

select  fConsultaTotalAnimal ("Ga");

DELIMITER //
CREATE FUNCTION  fConsultaAnimais(nome_especie varchar(50)) returns int
BEGIN
 declare total int;
 select count(*) into total from animal 
 where especie like concat("%",nome_especie, "%");
 return total;
 
 END; //

DELIMITER //
CREATE FUNCTION  fConsultaAbrigos(nome_abrigo varchar(100)) returns int
BEGIN
 declare total int;
 select count(*) into total from abrigo
 where nome like concat("%",nome_abrigo, "%");
 return total;
 
 END; //

#Criando procedimento sem passagem de parâmetros
DELIMITER //
CREATE FUNCTION  fConsultaAb( ) returns int
BEGIN
 declare total int;
 select count(*) into total from abrigo;
 return total;
 END; //
 
select fConsultaAb();

# Criando um procedimento para inserção de dados usando estrutura condicional  para executar o Commit e o Rollback
DELIMITER //
CREATE PROCEDURE CadastroAnimais()
    BEGIN
         DECLARE erro TINYINT DEFAULT FALSE;
         DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = true;
         INSERT INTO animal(especie, raca, cor, kg, idade, sexo, porte,id_abrigo,id_ad) VALUES      
  ("cachoro","Jack Russell Terrier", "Caramelo", "10kg", "2" , "M" ,"Pequeno",1,1),
  ("Gato","Sphynx","Sem Pelagem","5kg", "5", "F" ,"Pequeno",2,2),
  ('Gato','SRD','Preto','2kg','1 mes','F','Pequeno',3,3);

        IF erro = FALSE THEN
             COMMIT;
             SELECT "Transação efetivada com sucesso" AS  ResultadoTransacao;
         ELSE
             ROLLBACK;
             SELECT "Erro na realização da transação" AS ResultadoTransacao;
         END IF;
         
 END//
 
call CadastroAnimais();

#Criando Índices
CREATE INDEX idx_adotantes ON adotante (id_ad);
CREATE INDEX idx_animais ON animal (id_animal);
CREATE INDEX idx_abrigo ON abrigo (id_abrigo);
CREATE INDEX idx_alimento ON alimento (dt_validade);

show indexes from abrigo;

#Criando um select que usa um subselect
Select abrigo.nome, (Select count(*) from adotante) as total_adotante 
from abrigo,adotante,possui 
where possui.id_adotante_ong = adotante.id_ad 
and possui.id_abrigo_ong =abrigo.id_abrigo;

/*call fConsultaAb;
select distinct*/

/*DROP TABLE abrigo;
DROP TABLE animal;
DROP TABLE adotante;
DROP TABLE possui;
DROP TABLE alimento;
DROP TABLE consumo;
DROP DATABASE ong;
*/


#Como criar o backup nas Tabelas
create table abrigobackup(
id_abrigo bigint auto_increment,
nome varchar (100),
endereco varchar (200),
telefone varchar (20),
email varchar (100),
constraint pk_id_abrigo_backup primary key (id_abrigo)
);

insert into abrigobackup (select * from abrigo);
select * from abrigobackup;

create table adotantebackup(
id_ad  bigint not null auto_increment,
nome_ad varchar(200) not null,
telefone_ad varchar (20),
email_ad varchar (100),
endereco varchar(200),
constraint pk_id_ad_backup primary key (id_ad)
);

insert into adotantebackup (select * from adotante);
select * from adotantebackup;

create table animalbackup(
id_animal bigint auto_increment,
especie varchar(50),
raca varchar (50),
cor varchar (50),
kg numeric (10,2),
idade int,
sexo varchar (20),
porte varchar (20),
id_abrigo bigint,
id_ad bigint,
constraint pk_id_animal_backup primary key (id_animal),
constraint fk_id_abrigo_backup foreign key (id_abrigo) references abrigo(id_abrigo),
constraint fk_id_ad_backup foreign key (id_ad) references adotante(id_ad)
);

insert into animalbackup (select * from animal);
select * from animalbackup;


create table funcionariobackup( 
id_func bigint auto_increment,
nome varchar (100),
tel varchar (20),
cpf varchar(20),
id_abrigo_func bigint,
constraint pk_id_func_backup primary key (id_func),
constraint fk_id_abrigo_func_backup foreign key (id_abrigo_func) references abrigo(id_abrigo)
);

insert into funcionariobackup (select * from funcionario);
select * from funcionariobackup;

create table possuibackup (
 num_adocao bigint unique,
 dt_adc date,
 id_animal_ong bigint ,
 id_abrigo_ong bigint,
 id_adotante_ong bigint,
 constraint pk_num_adocao_backup primary key(num_adocao),
 constraint fk_id_animal_ong_backup foreign key (id_animal_ong) references animal(id_animal),
 constraint fk_id_abrigo_ong_backup foreign key(id_abrigo_ong) references abrigo(id_abrigo),
 constraint fk_id_adotante_ong_backup foreign key (id_adotante_ong) references adotante(id_ad)
 );

insert into possuibackup (select * from possui);
select * from possuibackup;

create table alimentobackup(
id_racao int not null,
nome varchar(50),
dt_validade date,
estoque int,
id_abrigo_abg bigint,
constraint pk_id_racao_backup primary key (id_racao),
constraint fk_id_abg_backup foreign key (id_abrigo_abg) references abrigo (id_abrigo)
);

insert into alimentobackup (select * from alimento);
select * from alimentobackup;

create table consumobackup (
id_consumo int auto_increment,
data_consumo date,
valor_consumo numeric (6,2),
id_abrigo_consumo bigint,
constraint pk_id_consum_backup primary key(id_consumo),
constraint fk_id_abrigo_consumo_backup foreign key (id_abrigo_consumo) references abrigo(id_abrigo)
);

insert into consumobackup (select * from consumo);
select * from consumobackup;