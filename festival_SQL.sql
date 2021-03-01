#mySQL -u root -p
create database festival;
use festival;

create table representation (
id int not null, Num_Rep int not null auto_increment primary key, Titre_Rep varchar(100), lieu varchar(80));

create table musicien (id int not null, Num_mus int not null auto_increment primary key, nom varchar(100), 
constraint fk_Num_Rep_m foreign key (Num_rep_m) references representation (Num_Rep));

create table programmer (id int not null, date_ date, constraint fk_Num_Rep_p foreign key (num_Rep_p) 
references representation(Num_rep), tarif int);
/*1*/
select Titre_Rep from representation ;
/*2*/
select Titre_Rep from representation where lieu=" théâtre JCC ";
/*3*/
select nom from musicien, (select Titre_Rep from representation) where representation(Num_Rep) = musicien(Num_Rep_m);
/*4*/
select Titre_Rep, lieu, tarif from representation where date_ = "28/02/2021";
/*5*/
select nom from musicien where representation(Num_rep)='15';
/*6*/
select Titre_Rep, date_, tarif from representation having tarif <='30';

/*Exercice2*/

create table Departement (DNO int not null auto_increment, DNOM varchar( 100), DIR varchar(50), 
VILLE varchar(90));

create table Employes (ENO int not null auto_increment, NOM varchar(100), PROF varchar(100), DATEEMB date, SAL int, 
COMM boolean, constraint fk_Departement_DNO foreign key (EMPDNO) references Departement);
/*1*/
select ENO, NOM from Employes where COMM = true;
/*2*/
select NOM, PROF, SAL from Employes where PROF order by asc having SAL order by desc;
/*3*/
select avg(SAL) from Employes; 
/*4*/
select avg(SAL), ENO from Employes where Employes(ENO) = Departement(DNO) and Departement(DNO) = 'Production';
/*5*/
Select DNO from Departement where Employe.EMPDNO = Departement.DNO and MAX(SAL); 
/*6*/
Select AVG(SAL) from Employes order by PROF;
/*7*/
Select AVG(SAL) from Employes having MIN(SAL) order by PROF; 
/*8*/
select AVG(SAL), PROF from Employes having MIN(SAL) order by PROF;


/*Exercice3*/
/*1*/
 create table Client(Numcli int not null auto_increment, Nomcli varchar(100) not null, 
 Prenomcli varchar(100) not null, adressecli varchar (200), mailcli text unique);
 /*2*/
 create table Produit(Numprod int not null auto_increment, designation varchar(100), prix int, qte_stock int);
 /*3*/
 create table Vendeur(Idvendeur int not null auto_increment, Nomvendeur varchar(100) not null,
 adresse_vend varchar(200) not null);
 /*4*/
 create table Commande(Numcom int not null auto_increment, constraint Fk_numcli_c foreign key (NumCli_c) references
 Client(Numcli), datecom date, qte_com int);
 /*5*/
select Nomcli, adressecli where adresse= "%Paris%";
/*6*/
select distinct Numprod, designation, prix from Produit where prix order by desc;
/*7*/
select nm, adresse from Vendeur where nom='M%';
/*8*/
select qte_com, Numcom, datecom from Commande where Numcom = Vendeur.Idvendeur having datecom >=01/02/2020 
and datecom <=28/02/2020 ;
/*9*/
select qte_com, Numcom from Commande where Numcom=36 ;

/*Exercice4*/
create table Spectacle(Spectacle_ID int not null auto_increment primary key, 
Titre varchar(150), DateDeb date, Duree int, constraint fk_salle_ID_spec 
foreign key Salle_ID_spec references Salle(Salle_ID), Chanteur(varchar (150));

create table Concert(Concert_ID int not null auto_increment primary key, Date date, heure time,
constraint fk_spectacle_id_con foreign key spectacle_id_con references Spectacle(Spectacle_ID));

create table Salle(Salle_ID int not null auto_increment primary key, Nom varchar(90), Adresse varchar(200), 
capacite int);

create table Billet(billet_ID int not null auto_increment primary key, constraint fk_concert_id_b 
foreign key concert_id_b references Concert(Concert_ID), Num_Place int, Categorie varchar(3), Prix int);

create table Vente(Vente_ID int not null auto_increment primary key, Date_Vente date, constraint fk_billet_id_v 
foreign key billet_id_v references Billet(Billlet_ID), MoyenPaiement varchar(30));

select DateDeb from Spectacle where Chanteur='Corneille' and where Salle_ID_spec='Zénith';
select nom from Salle where capacite = max;
select chanteur from Spectacle where Salle_ID_spec!='la Cygale' having Nom from Salle;

Select Date, Concert_ID from Concert where Concert_ID=billet_ID and concert_id_b = Capacite from salle; 

3. Quels sont les chanteurs n’ayant jamais réalisé de concert à la Cygale ?
4. Quels sont les chanteurs ayant réalisé au moins un concert dans toutes les salles ?
5. Quels sont les dates et les identificateurs des concerts pour lesquels il ne reste aucun
billet invendu ?
