--creation de la base de donnée
create database gesCom2019;

-- ouverture de la base de données
use gesCom2019;

--syntaxe générale de creation de table
/*
create table NomTable(
champ type options ,
champ type options ,
champ type options ,
...
);
*/
--creation de la table client

create table client
(
idclient int identity(1,1),
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30)
);




--modifier une table pour ajouter un champ

alter table client add adresse varchar(100) not null;

--modifier une table pour modifier un champ
alter table client alter column adresse varchar(150) not null;


--modifier une table pour supprimer un champ
alter table client drop column adresse;
--supprimer une table
drop table client;

--creer une table avec clé primaire
--methode 1
--clé sur le champs
create table client
(
idclient int identity(1,1) primary key,
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30)
);


drop table client;

--creer une table avec clé primaire
--methode 2
--clé sur une contrainte interne
create table client
(
idclient int identity(1,1),
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30),
constraint pkClient primary key (idclient)
);

drop table client;
--creer une table avec clé primaire
--methode 3
--clé sur une contrainte externe
create table client
(
idclient int identity(1,1),
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30));

alter table client 
add constraint pkClient primary key (idclient);

-- supprimer une contrainte
alter table client drop constraint pkclient;



create table produit
(
ref varchar(50) primary key,
designation varchar(150) not null,
prix money
)
drop table produit

create table produit
(
ref varchar(50),
designation varchar(150) not null,
prix money,
constraint pkproduit primary key (ref)
)


drop table produit
-- probleme de la creation d'une clé primaire externe sur un champ qui accepte les nuls

create table produit
(
ref varchar(50),
designation varchar(150) not null,
prix money

)
alter table produit alter column ref varchar(50) not null;

alter table produit 
add constraint pkproduit primary key (ref);

--les clés étrangères
--methode 1
--sur le champs
create table commande
(
idCommande int identity(1,1),
idClient int foreign key references client(idclient),
dateCommande date,
constraint pkCommande primary key (idcommande)

)

drop table commande

--les clés étrangères
--methode 2
--contrainte interne

create table commande
(
idCommande int identity(1,1),
idClient int ,
dateCommande date,
constraint pkCommande primary key (idcommande),
constraint fkCommandeClient foreign key (idClient) references client(idclient)

)

drop table commande
--les clés étrangères
--methode 3
--contrainte externe

create table commande
(
idCommande int identity(1,1),
idClient int ,
dateCommande date,
constraint pkCommande primary key (idcommande)
)

alter table commande
add constraint fkCommandeClient foreign key (idClient) references client(idclient)








