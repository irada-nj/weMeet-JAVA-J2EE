create table pays(
    idp  number(8) primary key,
    nomp varchar2(30)
);

create table ville(
    idv  number(8) primary key,
    nomv varchar2(30),
    idp  number(8) references pays(idp)
);

create table utilisateur(
    idu number(8) primary key,
    nom varchar2(255) ,
    prenom varchar(255) , 
    email varchar2(50),
    tel varchar2(30),
    dateNaiss   date,
    regDate date,
    profilImg VARCHAR2(50),
    banniereImg VARCHAR2(50),
    status VARCHAR2(100),
    mdp varchar2(50),
    role varchar2(50),
    question varchar2(255),
    reponse varchar2(255),
    idville number(8) references ville(idv),
    etatcpt number(1) default 1,
    check (etatcpt in (0,1))
);


CREATE TABLE Amis (
id number(10) PRIMARY KEY,
idu number(10)  references utilisateur(idu),
idu_amis number(10) references utilisateur(idu),
dateAmitie date  
);
CREATE TABLE Groupe (
idg number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu),
name VARCHAR2(50) 
);
CREATE TABLE GroupeAmis (
idg number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu)
);

CREATE TABLE Invitation (
idinv number(10) PRIMARY KEY,
idu number(10)  references utilisateur(idu),
idu_invite number(10) references utilisateur(idu),
dateInvitation date,
dateAcceptation date,
status  varchar2(20),
 check (status in ('en cours','accepte','refuse'))
);

CREATE TABLE Posts (
idp number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu),
title VARCHAR2(150) ,
contenu VARCHAR2(1000) ,
datePoste DATE ,
typeposte varchar2(30),
state number(10), 
nbrlikes number(8) default 0,
nbrdeslikes number(8) default 0,
check (typeposte in ('message','image','video'))
);

CREATE TABLE Albums (
idal number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu),
name VARCHAR2(50) 
);


CREATE TABLE Image (
id number(10) PRIMARY KEY,
path VARCHAR2(50),
name VARCHAR2(50),
album_id number(10) references albums(idal) 
);


CREATE TABLE Partage (
idp number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu),
idu_partage number(10) references utilisateur(idu),
post_id number(10) references posts(idp),
datePartage DATE
);
CREATE TABLE Commentaire (
idc number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu),
post_id number(10) references posts(idp),
contenu VARCHAR2(1000)
);
CREATE TABLE Likes (
idl number(10) PRIMARY KEY,
idu number(10) references utilisateur(idu),
idp number(10) references posts(idp),
typelike varchar2(10),
check (typelike in ('like','deslike'))
);
