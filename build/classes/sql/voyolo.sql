/* Ouvrir le fichier avec Sublime Text -> https://www.sublimetext.com/ | Visual Studio Code -> https://visualstudio.microsoft.com/fr/downloads/ */
/* [Sublime Text] Retour automatique à la ligne : View (menu en haut) -> Word Wrap (en bas) */
/* [Visual Studio Code] Retour automatique à la ligne -> Affichage (menu en haut) -> Retour automatique à la ligne (en bas) */
/******************************************************************************
 * Nom du fichier                               : voyolo.sql
 * Version du fichier                           : 5.0.0
 * Description du fichier                       : Base de données SQL MySQL-MariaDB de VOYOLO
 * Date création fichier                        : 18/11/2022
 * Date dernière modification                   : 08/12/2022
 * Chemin d'accès fichier                       : 
 * Auteur du fichier                            : Tom BRUAIRE
 * Nombre de tables entité                      : 19
 * Nombre de tables relation                    : 11 
 * Nombre de tables d'historisation (archivage) : 30
 * Nombre de tables totals                      : 88
 * Nombre de views                              : 27
 * Nombre de triggers                           : 126
 * Nombre de procedures                         : 59
 * Nombre de fonctions                          : 21
 * Nombre d'enregistrements totals (insertion)  : 301
 * Nombre de lignes (totale)                    : 3941
******************************************************************************/ 

/******************** SOMMAIRE ********************
 * TABLES --------------------------- -> LIGNE 42
 * ------ Entité -------------------- -> LIGNE 44
 * ------ Relation ------------------ -> LIGNE 324
 * TABLES D'HISTORISATION (Archivage) -> LIGNE 482
 * VIEWS ---------------------------- -> LIGNE 1745
 * TRIGGERS & FONCTIONS ------------- -> LIGNE 1999
 * PROCEDURES ----------------------- -> LIGNE 2773
 * INSERTIONS ----------------------- -> LIGNE 3410
 * PROCÉDURE CONNEXION USER --------- -> LIGNE 3850 (susceptible d'être modifié)
 * STATISTIQUES BASE DE DONNÉES ----- -> LIGNE 3865 (susceptible d'être modifié)
 * REQUÊTES INFORMATION_SCHEMA ------ -> LIGNE 3915 (susceptible d'être modifié)
****************************************************/

DROP DATABASE IF EXISTS voyolo;
CREATE DATABASE IF NOT EXISTS voyolo;
USE voyolo;

/*** TABLES ***/

# Entité

-- 1. TABLE USERS (entité)
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
	idu int(11) not null auto_increment,
	nom varchar(30) not null,
	prenom varchar(30) not null,
	pseudo varchar(20) not null UNIQUE,
	email varchar(50) not null UNIQUE,
	mdp varchar(255) not null,
	role enum("client", "admin"),
	nbTentatives int not null default 0,
	nbConnexion int not null default 0,
	bloque int not null default 0,
	last_connexion datetime default null,
	last_deconnexion datetime default null,
	creation_compte datetime not null,
	primary key (idu)
) ENGINE=InnoDB, CHARSET=utf8;

-- 2. TABLE CLIENTS (entité)
DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients (
	idu int(11) not null,
	date_naissance date not null,
	tel char(10) not null UNIQUE,
	adresse varchar(100) not null UNIQUE,
	carte_avantage enum("Avantage famille", "Avantage week-end", "Avantage jeune 10-30 ans", "Avantage senior 60 ans et plus") not null,
	primary key (idu),
	foreign key (idu) references users (idu)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 3. TABLE ADMINS (entité)
DROP TABLE IF EXISTS admins;
CREATE TABLE IF NOT EXISTS admins (
	idu int(11) not null,
	num_identification int(11) not null UNIQUE,
	type enum("admin", "modo") not null,
	primary key (idu),
	foreign key (idu) references users (idu)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 4. TABLE COMMENTAIRES (entité)
DROP TABLE IF EXISTS commentaires;
CREATE TABLE IF NOT EXISTS commentaires (
	idcom int(11) not null auto_increment,
	contenu varchar(255) not null,
	date_heure_post datetime not null,
	idu int(11) not null,
	primary key (idcom),
	foreign key (idu) references clients (idu)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 5. TABLE TRAINS (entité)
DROP TABLE IF EXISTS trains;
CREATE TABLE IF NOT EXISTS trains (
	numtrain int(11) not null auto_increment,
	nomtrain varchar(50) not null UNIQUE,
	nbwagon int(2) not null,
	date_creation_train date not null,
	primary key (numtrain)
) ENGINE=InnoDB, CHARSET=utf8;

-- 6. TABLE PAYS (entité)
DROP TABLE IF EXISTS pays;
CREATE TABLE IF NOT EXISTS pays (
	idpays int(11) not null auto_increment,
	nompays varchar(100) not null UNIQUE,
	primary key (idpays)
) ENGINE=InnoDB, CHARSET=utf8;

-- 7. TABLE VILLES (entité)
DROP TABLE IF EXISTS villes;
CREATE TABLE IF NOT EXISTS villes (
	idville int(11) not null auto_increment,
	nomville varchar(100) not null UNIQUE,
	idpays int(11) not null,
	primary key (idville),
	foreign key (idpays) references pays (idpays)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 8. TABLE GARES (entité)
DROP TABLE IF EXISTS gares;
CREATE TABLE IF NOT EXISTS gares (
	idgare int(11) not null auto_increment,
	nomgare varchar(100) not null UNIQUE,
	type enum("petite", "moyenne", "grande", "très grande") not null,
	adresse varchar(100) not null UNIQUE,
	idpays int(11) not null,
	idville int(11) not null,
	primary key (idgare),
	foreign key (idpays) references pays (idpays)
	on update cascade
	on delete cascade,
	foreign key (idville) references villes (idville)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 9. TABLE TRAJETS (entité)
DROP TABLE IF EXISTS trajets;
CREATE TABLE IF NOT EXISTS trajets (
	idtrajet int(11) not null auto_increment,
	numtrain int(11) not null,
	idgare1 int(11) not null,
	date_depart date not null,
	heure_depart time not null,
	idgare2 int(11) not null,
	date_arrivee date not null,
	heure_arrivee time not null,
	duree time not null,
	prix decimal(6,2) not null,
	quai varchar(15) not null,
	primary key (idtrajet),
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade,
	foreign key (idgare1) references gares (idgare)
	on update cascade
	on delete cascade,
	foreign key (idgare2) references gares (idgare)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 10. TABLE ENERGIES (entité)
DROP TABLE IF EXISTS energies;
CREATE TABLE IF NOT EXISTS energies (
	idenergie int(11) not null auto_increment,
	numtrain int(11) not null,
	energie_consommee int(3) not null,
	primary key (idenergie, numtrain),
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 11. TABLE RESERVATIONS (entité)
DROP TABLE IF EXISTS reservations;
CREATE TABLE IF NOT EXISTS reservations (
	idreservation int(11) not null auto_increment,
	statut_reservation enum("En attente...", "Action requise", "Demande", "Pré-approuvé", "Acceptée", "Refusée", "Expirée", "Annulée") not null,
	nbpersonne int(3) not null default 0,
	idu int(11) not null,
	numtrain int(11) not null,
	primary key (idreservation),
	foreign key (idu) references users (idu)
	on update cascade
	on delete cascade,
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 12. TABLE FACTURES (entité)
DROP TABLE IF EXISTS factures;
CREATE TABLE IF NOT EXISTS factures (
	idfacture int(11) not null auto_increment,
	date_heure_facture datetime not null,
	idu int(11) not null,
	idreservation int(11) not null,
	primary key (idfacture),
	foreign key (idu) references users (idu)
	on update cascade
	on delete cascade,
	foreign key (idreservation) references reservations (idreservation)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 13. TABLE SERVICES (entité)
DROP TABLE IF EXISTS services;
CREATE TABLE IF NOT EXISTS services (
	idservice int(11) not null auto_increment,
	nomservice varchar(50) not null,
	typeservice enum("Livre", "Film", "Consommations") not null,
	telservice char(10) not null UNIQUE,
	numtrain int(11) not null,
	idgare int(11) not null,
	primary key (idservice),
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade,
	foreign key (idgare) references gares (idgare)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 14. TABLE LIVRES (entité)
DROP TABLE IF EXISTS livres;
CREATE TABLE IF NOT EXISTS livres (
	idservice int(11) not null,
	reflivre int(11) not null UNIQUE,
	nomlivre varchar(50) not null UNIQUE,
	auteur varchar(50) not null,
	edition varchar(50) not null,
	nbpages int(3) not null,
	resume varchar(255),
	disponible enum("true", "false") not null,
	date_sortie date not null,
	primary key (idservice),
	foreign key (idservice) references services (idservice)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 15. TABLE FILMS (entité)
DROP TABLE IF EXISTS films;
CREATE TABLE IF NOT EXISTS films (
	idservice int(11) not null,
	reffilm int(11) not null UNIQUE,
	nomfilm varchar(50) not null UNIQUE,
	realisateur varchar(50) not null,
	duree time not null,
	resume varchar(255),
	disponible enum("true", "false") not null,
	date_sortie date not null,
	primary key (idservice),
	foreign key (idservice) references services (idservice)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 16. TABLE CONSOMMATIONS (entité)
DROP TABLE IF EXISTS consommations;
CREATE TABLE IF NOT EXISTS consommations (
	idservice int(11) not null,
	refarticle int(11) not null UNIQUE,
	article varchar(50) not null UNIQUE,
	prix decimal(6,2) not null,
	quantite int(3) not null default 1,
	description varchar(255),
	date_expiration date not null,
	date_ajout date not null,
	primary key (idservice),
	foreign key (idservice) references services (idservice)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 17. TABLE ENQUETES (entité)
DROP TABLE IF EXISTS enquetes;
CREATE TABLE IF NOT EXISTS enquetes (
	idenquete int(11) not null auto_increment,
	nom_enquete varchar(100) not null UNIQUE,
	description varchar(255),
	date_creation_enquete date not null,
	primary key (idenquete)
) ENGINE=InnoDB, CHARSET=utf8;

-- 18. TABLE QUESTIONS (entité)
DROP TABLE IF EXISTS questions;
CREATE TABLE IF NOT EXISTS questions (
	idquestion int(11) not null auto_increment,
	enonce varchar(255) not null UNIQUE,
	primary key (idquestion)
) ENGINE=InnoDB, CHARSET=utf8;

-- 19. TABLE PERSONNES (entité)
DROP TABLE IF EXISTS personnes;
CREATE TABLE IF NOT EXISTS personnes (
	idpers int(11) not null auto_increment,
	sexe enum("Femme", "Homme", "Non préciser") not null,
	nom varchar(30) not null,
	prenom varchar(30) not null,
	age enum("0-18", "19-35", "36-62", "63 ans et plus"),
	datenaissance date not null,
	email varchar(50) not null UNIQUE,
	tel char(10) not null UNIQUE,
	adresse varchar(100) not null,
	type enum("visiteur", "user", "client", "admin"),
	score decimal(6,2) not null default 0,
	primary key (idpers)
) ENGINE=InnoDB, CHARSET=utf8;

# Relation

-- 1. TABLE MODERER (relation)
DROP TABLE IF EXISTS moderer;
CREATE TABLE IF NOT EXISTS moderer (
	idu int(11) not null,
	idcom int(11) not null,
	primary key (idu, idcom),
	foreign key (idu) references admins (idu)
	on update cascade
	on delete cascade,
	foreign key (idcom) references commentaires (idcom)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 2. TABLE CONCERNE (relation)
DROP TABLE IF EXISTS concerne;
CREATE TABLE IF NOT EXISTS concerne (
	idcom int(11) not null,
	idtrajet int(11) not null,
	primary key (idcom, idtrajet),
	foreign key (idcom) references commentaires (idcom)
	on update cascade
	on delete cascade,
	foreign key (idtrajet) references trajets (idtrajet)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 3. TABLE AVOIR (relation)
DROP TABLE IF EXISTS avoir;
CREATE TABLE IF NOT EXISTS avoir (
	numtrain int(11) not null,
	idgare int(11) not null,
	primary key (numtrain, idgare),
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade,
	foreign key (idgare) references gares (idgare)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 4. TABLE SE_SITUE (relation)
DROP TABLE IF EXISTS se_situe;
CREATE TABLE IF NOT EXISTS se_situe (
	idgare int(11) not null,
	idpays int(11) not null,
	primary key (idgare, idpays),
	foreign key (idgare) references gares (idgare)
	on update cascade
	on delete cascade,
	foreign key (idpays) references pays (idpays)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 5. TABLE SE_SITUE_2 (relation)
DROP TABLE IF EXISTS se_situe_2;
CREATE TABLE IF NOT EXISTS se_situe_2 (
	idgare int(11) not null,
	idville int(11) not null,
	primary key (idgare, idville),
	foreign key (idgare) references gares (idgare)
	on update cascade
	on delete cascade,
	foreign key (idville) references villes (idville)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 6. TABLE GERER (relation)
DROP TABLE IF EXISTS gerer;
CREATE TABLE IF NOT EXISTS gerer (
	idgare int(11) not null,
	idservice int(11) not null,
	primary key (idgare, idservice),
	foreign key (idgare) references gares (idgare)
	on update cascade
	on delete cascade,
	foreign key (idservice) references services (idservice)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 7. TABLE PROPOSE (relation)
DROP TABLE IF EXISTS propose;
CREATE TABLE IF NOT EXISTS propose (
	numtrain int(11) not null,
	idservice int(11) not null,
	primary key (numtrain, idservice),
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade,
	foreign key (idservice) references services (idservice)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 8. TABLE CONTENIR (relation)
DROP TABLE IF EXISTS contenir;
CREATE TABLE IF NOT EXISTS contenir (
	idreservation int(11) not null,
	numtrain int(11) not null,
	primary key (idreservation, numtrain),
	foreign key (idreservation) references reservations (idreservation)
	on update cascade
	on delete cascade,
	foreign key (numtrain) references trains (numtrain)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 9. TABLE FAIRE (relation)
DROP TABLE IF EXISTS faire;
CREATE TABLE IF NOT EXISTS faire (
	idu int(11) not null,
	idreservation int(11) not null,
	primary key (idu, idreservation),
	foreign key (idu) references users (idu)
	on update cascade
	on delete cascade,
	foreign key (idreservation) references reservations (idreservation)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8; 

-- 10. TABLE REALISER (relation)
DROP TABLE IF EXISTS realiser;
CREATE TABLE IF NOT EXISTS realiser (
	idgare int(11) not null,
	idenquete int(11) not null,
	primary key (idgare, idenquete),
	foreign key (idgare) references gares (idgare)
	on update cascade
	on delete cascade,
	foreign key (idenquete) references enquetes (idenquete)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;

-- 11. TABLE REPONDRE (relation)
DROP TABLE IF EXISTS repondre;
CREATE TABLE IF NOT EXISTS repondre (
	idu int(11) not null,
	idquestion int(11) not null,
	reponse varchar(255) not null,
	primary key (idu, idquestion),
	foreign key (idu) references users (idu)
	on update cascade
	on delete cascade,
	foreign key (idquestion) references questions (idquestion)
	on update cascade
	on delete cascade
) ENGINE=InnoDB, CHARSET=utf8;


/*** TABLE D'HISTORISATION (Archivage) ***/

-- 1. TABLE D'HISTORISATION DES USERS
DROP TABLE IF EXISTS histoUsers;
CREATE TABLE histoUsers AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM users
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoUserInsert;
DELIMITER //
CREATE TRIGGER HistoUserInsert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO histoUsers select *, sysdate(), user(), 'INSERT'
	FROM users
	WHERE idu = new.idu;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoUserUpdate;
DELIMITER //
CREATE TRIGGER HistoUserUpdate
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	INSERT INTO histoUsers select *, sysdate(), user(), 'UPDATE'
	FROM users
	WHERE idu = old.idu;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoUserDelete;
DELIMITER //
CREATE TRIGGER HistoUserDelete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
	INSERT INTO histoUsers select *, sysdate(), user(), 'DELETE'
	FROM users
	WHERE idu = old.idu;
END //
DELIMITER ;

-- 2. TABLE D'HISTORISATION DES CLIENTS
DROP TABLE IF EXISTS histoClients;
CREATE TABLE histoClients AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM clients
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoClientInsert;
DELIMITER //
CREATE TRIGGER HistoClientInsert
AFTER INSERT ON clients
FOR EACH ROW
BEGIN
	INSERT INTO histoClients select *, sysdate(), user(), 'INSERT'
	FROM clients
	WHERE idu = new.idu;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoClientUpdate;
DELIMITER //
CREATE TRIGGER HistoClientUpdate
BEFORE UPDATE ON clients
FOR EACH ROW
BEGIN
	INSERT INTO histoClients select *, sysdate(), user(), 'UPDATE'
	FROM clients
	WHERE idu = old.idu;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoClientDelete;
DELIMITER //
CREATE TRIGGER HistoClientDelete
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
	INSERT INTO histoClients select *, sysdate(), user(), 'DELETE'
	FROM clients
	WHERE idu = old.idu;
END //
DELIMITER ;

-- 3. TABLE D'HISTORISATION DES ADMINS
DROP TABLE IF EXISTS histoAdmins;
CREATE TABLE histoAdmins AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM admins
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoAdminInsert;
DELIMITER //
CREATE TRIGGER HistoAdminInsert
AFTER INSERT ON admins
FOR EACH ROW
BEGIN
	INSERT INTO histoAdmins select *, sysdate(), user(), 'INSERT'
	FROM admins
	WHERE idu = new.idu;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoAdminUpdate;
DELIMITER //
CREATE TRIGGER HistoAdminUpdate
BEFORE UPDATE ON admins
FOR EACH ROW
BEGIN
	INSERT INTO histoAdmins select *, sysdate(), user(), 'UPDATE'
	FROM admins
	WHERE idu = old.idu;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoAdminDelete;
DELIMITER //
CREATE TRIGGER HistoAdminDelete
BEFORE DELETE ON admins
FOR EACH ROW
BEGIN
	INSERT INTO histoAdmins select *, sysdate(), user(), 'DELETE'
	FROM admins
	WHERE idu = old.idu;
END //
DELIMITER ;

-- 4. TABLE D'HISTORISATION DES COMMENTAIRES
DROP TABLE IF EXISTS histoCommentaires;
CREATE TABLE histoCommentaires AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM commentaires
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoCommentaireInsert;
DELIMITER //
CREATE TRIGGER HistoCommentaireInsert
AFTER INSERT ON commentaires
FOR EACH ROW
BEGIN
	INSERT INTO histoCommentaires select *, sysdate(), user(), 'INSERT'
	FROM commentaires
	WHERE idcom = new.idcom;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoCommentaireUpdate;
DELIMITER //
CREATE TRIGGER HistoCommentaireUpdate
BEFORE UPDATE ON commentaires
FOR EACH ROW
BEGIN
	INSERT INTO histoCommentaires select *, sysdate(), user(), 'UPDATE'
	FROM commentaires
	WHERE idcom = old.idcom;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoCommentaireDelete;
DELIMITER //
CREATE TRIGGER HistoCommentaireDelete
BEFORE DELETE ON commentaires
FOR EACH ROW
BEGIN
	INSERT INTO histoCommentaires select *, sysdate(), user(), 'DELETE'
	FROM commentaires
	WHERE idcom = old.idcom;
END //
DELIMITER ;

-- 5. TABLE D'HISTORISATION DES TRAINS
DROP TABLE IF EXISTS histoTrains;
CREATE TABLE histoTrains AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM trains
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoTrainInsert;
DELIMITER //
CREATE TRIGGER HistoTrainInsert
AFTER INSERT ON trains
FOR EACH ROW
BEGIN
	INSERT INTO histoTrains select *, sysdate(), user(), 'INSERT'
	FROM trains
	WHERE numtrain = new.numtrain;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoTrainUpdate;
DELIMITER //
CREATE TRIGGER HistoTrainUpdate
BEFORE UPDATE ON trains
FOR EACH ROW
BEGIN
	INSERT INTO histoTrains select *, sysdate(), user(), 'UPDATE'
	FROM trains
	WHERE numtrain = old.numtrain;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoTrainDelete;
DELIMITER //
CREATE TRIGGER HistoTrainDelete
BEFORE DELETE ON trains
FOR EACH ROW
BEGIN
	INSERT INTO histoTrains select *, sysdate(), user(), 'DELETE'
	FROM trains
	WHERE numtrain = old.numtrain;
END //
DELIMITER ;

-- 6. TABLE D'HISTORISATION DES PAYS
DROP TABLE IF EXISTS histoPays;
CREATE TABLE histoPays AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM pays
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoPaysInsert;
DELIMITER //
CREATE TRIGGER HistoPaysInsert
AFTER INSERT ON pays
FOR EACH ROW
BEGIN
	INSERT INTO histoPays select *, sysdate(), user(), 'INSERT'
	FROM pays
	WHERE idpays = new.idpays;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoPaysUpdate;
DELIMITER //
CREATE TRIGGER HistoPaysUpdate
BEFORE UPDATE ON pays
FOR EACH ROW
BEGIN
	INSERT INTO histoPays select *, sysdate(), user(), 'UPDATE'
	FROM pays
	WHERE idpays = old.idpays;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoPaysDelete;
DELIMITER //
CREATE TRIGGER HistoPaysDelete
BEFORE DELETE ON pays
FOR EACH ROW
BEGIN
	INSERT INTO histoPays select *, sysdate(), user(), 'DELETE'
	FROM pays
	WHERE idpays = old.idpays;
END //
DELIMITER ;

-- 7. TABLE D'HISTORISATION DES VILLES
DROP TABLE IF EXISTS histoVilles;
CREATE TABLE histoVilles AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM villes
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoVilleInsert;
DELIMITER //
CREATE TRIGGER HistoVilleInsert
AFTER INSERT ON villes
FOR EACH ROW
BEGIN
	INSERT INTO histoVilles select *, sysdate(), user(), 'INSERT'
	FROM villes
	WHERE idville = new.idville;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoVilleUpdate;
DELIMITER //
CREATE TRIGGER HistoVilleUpdate
BEFORE UPDATE ON villes
FOR EACH ROW
BEGIN
	INSERT INTO histoVilles select *, sysdate(), user(), 'UPDATE'
	FROM villes
	WHERE idville = old.idville;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoVilleDelete;
DELIMITER //
CREATE TRIGGER HistoVilleDelete
BEFORE DELETE ON villes
FOR EACH ROW
BEGIN
	INSERT INTO histoVilles select *, sysdate(), user(), 'DELETE'
	FROM villes
	WHERE idville = old.idville;
END //
DELIMITER ;

-- 8. TABLE D'HISTORISATION DES GARES
DROP TABLE IF EXISTS histoGares;
CREATE TABLE histoGares AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM gares
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoGareInsert;
DELIMITER //
CREATE TRIGGER HistoGareInsert
AFTER INSERT ON gares
FOR EACH ROW
BEGIN
	INSERT INTO histoGares select *, sysdate(), user(), 'INSERT'
	FROM gares
	WHERE idgare = new.idgare;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoGareUpdate;
DELIMITER //
CREATE TRIGGER HistoGareUpdate
BEFORE UPDATE ON gares
FOR EACH ROW
BEGIN
	INSERT INTO histoGares select *, sysdate(), user(), 'UPDATE'
	FROM gares
	WHERE idgare = old.idgare;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoGareDelete;
DELIMITER //
CREATE TRIGGER HistoGareDelete
BEFORE DELETE ON gares
FOR EACH ROW
BEGIN
	INSERT INTO histoGares select *, sysdate(), user(), 'DELETE'
	FROM gares
	WHERE idgare = old.idgare;
END //
DELIMITER ;

-- 9. TABLE D'HISTORISATION DES TRAJETS
DROP TABLE IF EXISTS histoTrajets;
CREATE TABLE histoTrajets AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM trajets
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoTrajetInsert;
DELIMITER //
CREATE TRIGGER HistoTrajetInsert
AFTER INSERT ON trajets
FOR EACH ROW
BEGIN
	INSERT INTO histoTrajets select *, sysdate(), user(), 'INSERT'
	FROM trajets
	WHERE idtrajet = new.idtrajet;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoTrajetUpdate;
DELIMITER //
CREATE TRIGGER HistoTrajetUpdate
BEFORE UPDATE ON trajets
FOR EACH ROW
BEGIN
	INSERT INTO histoTrajets select *, sysdate(), user(), 'UPDATE'
	FROM trajets
	WHERE idtrajet = old.idtrajet;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoTrajetDelete;
DELIMITER //
CREATE TRIGGER HistoTrajetDelete
BEFORE DELETE ON trajets
FOR EACH ROW
BEGIN
	INSERT INTO histoTrajets select *, sysdate(), user(), 'DELETE'
	FROM trajets
	WHERE idtrajet = old.idtrajet;
END //
DELIMITER ;

-- 10. TABLE D'HISTORISATION DES ENERGIES (consommées par les trains)
DROP TABLE IF EXISTS histoEnergies;
CREATE TABLE histoEnergies AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM energies
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoEnergieInsert;
DELIMITER //
CREATE TRIGGER HistoEnergieInsert
AFTER INSERT ON energies
FOR EACH ROW
BEGIN
	INSERT INTO histoEnergies select *, sysdate(), user(), 'INSERT'
	FROM energies
	WHERE numtrain = new.numtrain;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoEnergieUpdate;
DELIMITER //
CREATE TRIGGER HistoEnergieUpdate
BEFORE UPDATE ON energies
FOR EACH ROW
BEGIN
	INSERT INTO histoEnergies select *, sysdate(), user(), 'UPDATE'
	FROM energies
	WHERE numtrain = old.numtrain;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoEnergieDelete;
DELIMITER //
CREATE TRIGGER HistoEnergieDelete
BEFORE DELETE ON energies
FOR EACH ROW
BEGIN
	INSERT INTO histoEnergies select *, sysdate(), user(), 'DELETE'
	FROM energies
	WHERE numtrain = old.numtrain;
END //
DELIMITER ;

-- 11. TABLE D'HISTORISATION DES RESERVATIONS
DROP TABLE IF EXISTS histoReservations;
CREATE TABLE histoReservations AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM reservations
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoReservationInsert;
DELIMITER //
CREATE TRIGGER HistoReservationInsert
AFTER INSERT ON reservations
FOR EACH ROW
BEGIN
	INSERT INTO histoReservations select *, sysdate(), user(), 'INSERT'
	FROM reservations
	WHERE idreservation = new.idreservation;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoReservationUpdate;
DELIMITER //
CREATE TRIGGER HistoReservationUpdate
BEFORE UPDATE ON reservations
FOR EACH ROW
BEGIN
	INSERT INTO histoReservations select *, sysdate(), user(), 'UPDATE'
	FROM reservations
	WHERE idreservation = old.idreservation;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoReservationDelete;
DELIMITER //
CREATE TRIGGER HistoReservationDelete
BEFORE DELETE ON reservations
FOR EACH ROW
BEGIN
	INSERT INTO histoReservations select *, sysdate(), user(), 'DELETE'
	FROM reservations
	WHERE idreservation = old.idreservation;
END //
DELIMITER ;

-- 12. TABLE D'HISTORISATION DES FACTURES
DROP TABLE IF EXISTS histoFactures;
CREATE TABLE histoFactures AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM factures
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoFactureInsert;
DELIMITER //
CREATE TRIGGER HistoFactureInsert
AFTER INSERT ON factures
FOR EACH ROW
BEGIN
	INSERT INTO histoFactures select *, sysdate(), user(), 'INSERT'
	FROM factures
	WHERE idfacture = new.idfacture;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoFactureUpdate;
DELIMITER //
CREATE TRIGGER HistoFactureUpdate
BEFORE UPDATE ON factures
FOR EACH ROW
BEGIN
	INSERT INTO histoFactures select *, sysdate(), user(), 'UPDATE'
	FROM factures
	WHERE idfacture = old.idfacture;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoFactureDelete;
DELIMITER //
CREATE TRIGGER HistoFactureDelete
BEFORE DELETE ON factures
FOR EACH ROW
BEGIN
	INSERT INTO histoFactures select *, sysdate(), user(), 'DELETE'
	FROM factures
	WHERE idfacture = old.idfacture;
END //
DELIMITER ;

-- 13. TABLE D'HISTORISATION DES SERVICES
DROP TABLE IF EXISTS histoServices;
CREATE TABLE histoServices AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM services
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoServiceInsert;
DELIMITER //
CREATE TRIGGER HistoServiceInsert
AFTER INSERT ON services
FOR EACH ROW
BEGIN
	INSERT INTO histoServices select *, sysdate(), user(), 'INSERT'
	FROM services
	WHERE idservice = new.idservice;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoServiceUpdate;
DELIMITER //
CREATE TRIGGER HistoServiceUpdate
BEFORE UPDATE ON services
FOR EACH ROW
BEGIN
	INSERT INTO histoServices select *, sysdate(), user(), 'UPDATE'
	FROM services
	WHERE idservice = old.idservice;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoServiceDelete;
DELIMITER //
CREATE TRIGGER HistoServiceDelete
BEFORE DELETE ON services
FOR EACH ROW
BEGIN
	INSERT INTO histoServices select *, sysdate(), user(), 'DELETE'
	FROM services
	WHERE idservice = old.idservice;
END //
DELIMITER ;

-- 14. TABLE D'HISTORISATION DES LIVRES
DROP TABLE IF EXISTS histoLivres;
CREATE TABLE histoLivres AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM livres
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoLivreInsert;
DELIMITER //
CREATE TRIGGER HistoLivreInsert
AFTER INSERT ON livres
FOR EACH ROW
BEGIN
	INSERT INTO histoLivres select *, sysdate(), user(), 'INSERT'
	FROM livres
	WHERE reflivre = new.reflivre;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoLivreUpdate;
DELIMITER //
CREATE TRIGGER HistoLivreUpdate
BEFORE UPDATE ON livres
FOR EACH ROW
BEGIN
	INSERT INTO histoLivres select *, sysdate(), user(), 'UPDATE'
	FROM livres
	WHERE reflivre = old.reflivre;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoLivreDelete;
DELIMITER //
CREATE TRIGGER HistoLivreDelete
BEFORE DELETE ON livres
FOR EACH ROW
BEGIN
	INSERT INTO histoLivres select *, sysdate(), user(), 'DELETE'
	FROM livres
	WHERE reflivre = old.reflivre;
END //
DELIMITER ;

-- 15. TABLE D'HISTORISATION DES FILMS
DROP TABLE IF EXISTS histoFilms;
CREATE TABLE histoFilms AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM films
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoFilmInsert;
DELIMITER //
CREATE TRIGGER HistoFilmInsert
AFTER INSERT ON films
FOR EACH ROW
BEGIN
	INSERT INTO histoFilms select *, sysdate(), user(), 'INSERT'
	FROM films
	WHERE reffilm = new.reffilm;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoFilmUpdate;
DELIMITER //
CREATE TRIGGER HistoFilmUpdate
BEFORE UPDATE ON films
FOR EACH ROW
BEGIN
	INSERT INTO histoFilms select *, sysdate(), user(), 'UPDATE'
	FROM films
	WHERE reffilm = old.reffilm;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoFilmDelete;
DELIMITER //
CREATE TRIGGER HistoFilmDelete
BEFORE DELETE ON films
FOR EACH ROW
BEGIN
	INSERT INTO histoFilms select *, sysdate(), user(), 'DELETE'
	FROM films
	WHERE reffilm = old.reffilm;
END //
DELIMITER ;

-- 16. TABLE D'HISTORISATION DES CONSOMMATIONS
DROP TABLE IF EXISTS histoConsommations;
CREATE TABLE histoConsommations AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM consommations
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoConsommationInsert;
DELIMITER //
CREATE TRIGGER HistoConsommationInsert
AFTER INSERT ON consommations
FOR EACH ROW
BEGIN
	INSERT INTO histoConsommations select *, sysdate(), user(), 'INSERT'
	FROM consommations
	WHERE refarticle = new.refarticle;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoConsommationUpdate;
DELIMITER //
CREATE TRIGGER HistoConsommationUpdate
BEFORE UPDATE ON consommations
FOR EACH ROW
BEGIN
	INSERT INTO histoConsommations select *, sysdate(), user(), 'UPDATE'
	FROM consommations
	WHERE refarticle = old.refarticle;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoConsommationDelete;
DELIMITER //
CREATE TRIGGER HistoConsommationDelete
BEFORE DELETE ON consommations
FOR EACH ROW
BEGIN
	INSERT INTO histoConsommations select *, sysdate(), user(), 'DELETE'
	FROM consommations
	WHERE refarticle = old.refarticle;
END //
DELIMITER ;

-- 17. TABLE D'HISTORISATION DES ENQUETES
DROP TABLE IF EXISTS histoEnquetes;
CREATE TABLE histoEnquetes AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM enquetes
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoEnqueteInsert;
DELIMITER //
CREATE TRIGGER HistoEnqueteInsert
AFTER INSERT ON enquetes
FOR EACH ROW
BEGIN
	INSERT INTO histoEnquetes select *, sysdate(), user(), 'INSERT'
	FROM enquetes
	WHERE idenquete = new.idenquete;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoEnqueteUpdate;
DELIMITER //
CREATE TRIGGER HistoEnqueteUpdate
BEFORE UPDATE ON enquetes
FOR EACH ROW
BEGIN
	INSERT INTO histoEnquetes select *, sysdate(), user(), 'UPDATE'
	FROM enquetes
	WHERE idenquete = old.idenquete;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoEnqueteDelete;
DELIMITER //
CREATE TRIGGER HistoEnqueteDelete
BEFORE DELETE ON enquetes
FOR EACH ROW
BEGIN
	INSERT INTO histoEnquetes select *, sysdate(), user(), 'DELETE'
	FROM enquetes
	WHERE idenquete = old.idenquete;
END //
DELIMITER ;

-- 18. TABLE D'HISTORISATION DES QUESTIONS
DROP TABLE IF EXISTS histoQuestions;
CREATE TABLE histoQuestions AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM questions
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoQuestionInsert;
DELIMITER //
CREATE TRIGGER HistoQuestionInsert
AFTER INSERT ON questions
FOR EACH ROW
BEGIN
	INSERT INTO histoQuestions select *, sysdate(), user(), 'INSERT'
	FROM questions
	WHERE idquestion = new.idquestion;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoQuestionUpdate;
DELIMITER //
CREATE TRIGGER HistoQuestionUpdate
BEFORE UPDATE ON questions
FOR EACH ROW
BEGIN
	INSERT INTO histoQuestions select *, sysdate(), user(), 'UPDATE'
	FROM questions
	WHERE idquestion = old.idquestion;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoQuestionDelete;
DELIMITER //
CREATE TRIGGER HistoQuestionDelete
BEFORE DELETE ON questions
FOR EACH ROW
BEGIN
	INSERT INTO histoQuestions select *, sysdate(), user(), 'DELETE'
	FROM questions
	WHERE idquestion = old.idquestion;
END //
DELIMITER ;

-- 19. TABLE D'HISTORISATION DES PERSONNES
DROP TABLE IF EXISTS histoPersonnes;
CREATE TABLE histoPersonnes AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM personnes
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoPersonneInsert;
DELIMITER //
CREATE TRIGGER HistoPersonneInsert
AFTER INSERT ON personnes
FOR EACH ROW
BEGIN
	INSERT INTO histoPersonnes select *, sysdate(), user(), 'INSERT'
	FROM personnes
	WHERE idpers = new.idpers;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoPersonneUpdate;
DELIMITER //
CREATE TRIGGER HistoPersonneUpdate
BEFORE UPDATE ON personnes
FOR EACH ROW
BEGIN
	INSERT INTO histoPersonnes select *, sysdate(), user(), 'UPDATE'
	FROM personnes
	WHERE idpers = old.idpers;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoPersonneDelete;
DELIMITER //
CREATE TRIGGER HistoPersonneDelete
BEFORE DELETE ON personnes
FOR EACH ROW
BEGIN
	INSERT INTO histoPersonnes select *, sysdate(), user(), 'DELETE'
	FROM personnes
	WHERE idpers = old.idpers;
END //
DELIMITER ;

-- 20. TABLE D'HISTORISATION DE LA RELATION MODERER
DROP TABLE IF EXISTS histoModerer;
CREATE TABLE histoModerer AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM moderer
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoModererInsert;
DELIMITER //
CREATE TRIGGER HistoModererInsert
AFTER INSERT ON moderer
FOR EACH ROW
BEGIN
	INSERT INTO histoModerer select *, sysdate(), user(), 'INSERT'
	FROM moderer
	WHERE idu = new.idu AND idcom = new.idcom;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoModererUpdate;
DELIMITER //
CREATE TRIGGER HistoModererUpdate
BEFORE UPDATE ON moderer
FOR EACH ROW
BEGIN
	INSERT INTO histoModerer select *, sysdate(), user(), 'UPDATE'
	FROM moderer
	WHERE idu = old.idu AND idcom = old.idcom;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoModererDelete;
DELIMITER //
CREATE TRIGGER HistoModererDelete
BEFORE DELETE ON moderer
FOR EACH ROW
BEGIN
	INSERT INTO histoModerer select *, sysdate(), user(), 'DELETE'
	FROM moderer
	WHERE idu = old.idu AND idcom = old.idcom;
END //
DELIMITER ;

-- 21. TABLE D'HISTORISATION DE LA RELATION CONCERNE
DROP TABLE IF EXISTS histoConcerne;
CREATE TABLE histoConcerne AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM concerne
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoConcerneInsert;
DELIMITER //
CREATE TRIGGER HistoConcerneInsert
AFTER INSERT ON concerne
FOR EACH ROW
BEGIN
	INSERT INTO histoConcerne select *, sysdate(), user(), 'INSERT'
	FROM concerne
	WHERE idcom = new.idcom AND idtrajet = new.idtrajet;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoConcerneUpdate;
DELIMITER //
CREATE TRIGGER HistoConcerneUpdate
BEFORE UPDATE ON concerne
FOR EACH ROW
BEGIN
	INSERT INTO histoConcerne select *, sysdate(), user(), 'UPDATE'
	FROM concerne
	WHERE idcom = old.idcom AND idtrajet = old.idtrajet;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoConcerneDelete;
DELIMITER //
CREATE TRIGGER HistoConcerneDelete
BEFORE DELETE ON concerne
FOR EACH ROW
BEGIN
	INSERT INTO histoConcerne select *, sysdate(), user(), 'DELETE'
	FROM concerne
	WHERE idcom = old.idcom AND idtrajet = old.idtrajet;
END //
DELIMITER ;

-- 22. TABLE D'HISTORISATION DE LA RELATION AVOIR
DROP TABLE IF EXISTS histoAvoir;
CREATE TABLE histoAvoir AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM avoir
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoAvoirInsert;
DELIMITER //
CREATE TRIGGER HistoAvoirInsert
AFTER INSERT ON avoir
FOR EACH ROW
BEGIN
	INSERT INTO histoAvoir select *, sysdate(), user(), 'INSERT'
	FROM avoir
	WHERE numtrain = new.numtrain AND idgare = new.idgare;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoAvoirUpdate;
DELIMITER //
CREATE TRIGGER HistoAvoirUpdate
BEFORE UPDATE ON avoir
FOR EACH ROW
BEGIN
	INSERT INTO histoAvoir select *, sysdate(), user(), 'UPDATE'
	FROM avoir
	WHERE numtrain = old.numtrain AND idgare = old.idgare;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoAvoirDelete;
DELIMITER //
CREATE TRIGGER HistoAvoirDelete
BEFORE DELETE ON avoir
FOR EACH ROW
BEGIN
	INSERT INTO histoAvoir select *, sysdate(), user(), 'DELETE'
	FROM avoir
	WHERE numtrain = old.numtrain AND idgare = old.idgare;
END //
DELIMITER ;

-- 23. TABLE D'HISTORISATION DE LA RELATION SE_SITUE
DROP TABLE IF EXISTS histoSeSitue;
CREATE TABLE histoSeSitue AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM se_situe
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoSeSitueInsert;
DELIMITER //
CREATE TRIGGER HistoSeSitueInsert
AFTER INSERT ON se_situe
FOR EACH ROW
BEGIN
	INSERT INTO histoSeSitue select *, sysdate(), user(), 'INSERT'
	FROM se_situe
	WHERE idgare = new.idgare AND idpays = new.idpays;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoSeSitueUpdate;
DELIMITER //
CREATE TRIGGER HistoSeSitueUpdate
BEFORE UPDATE ON se_situe
FOR EACH ROW
BEGIN
	INSERT INTO histoSeSitue select *, sysdate(), user(), 'UPDATE'
	FROM se_situe
	WHERE idgare = old.idgare AND idpays = old.idpays;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoSeSitueDelete;
DELIMITER //
CREATE TRIGGER HistoSeSitueDelete
BEFORE DELETE ON se_situe
FOR EACH ROW
BEGIN
	INSERT INTO histoSeSitue select *, sysdate(), user(), 'DELETE'
	FROM se_situe
	WHERE idgare = old.idgare AND idpays = old.idpays;
END //
DELIMITER ;

-- 24. TABLE D'HISTORISATION DE LA RELATION SE_SITUE_2
DROP TABLE IF EXISTS histoSeSitue2;
CREATE TABLE histoSeSitue2 AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM se_situe_2
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoSeSitue2Insert;
DELIMITER //
CREATE TRIGGER HistoSeSitue2Insert
AFTER INSERT ON se_situe_2
FOR EACH ROW
BEGIN
	INSERT INTO histoSeSitue2 select *, sysdate(), user(), 'INSERT'
	FROM se_situe_2
	WHERE idgare = new.idgare AND idville = new.idville;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoSeSitue2Update;
DELIMITER //
CREATE TRIGGER HistoSeSitue2Update
BEFORE UPDATE ON se_situe_2
FOR EACH ROW
BEGIN
	INSERT INTO histoSeSitue2 select *, sysdate(), user(), 'UPDATE'
	FROM se_situe_2
	WHERE idgare = old.idgare AND idville = old.idville;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoSeSitue2Delete;
DELIMITER //
CREATE TRIGGER HistoSeSitue2Delete
BEFORE DELETE ON se_situe_2
FOR EACH ROW
BEGIN
	INSERT INTO histoSeSitue2 select *, sysdate(), user(), 'DELETE'
	FROM se_situe_2
	WHERE idgare = old.idgare AND idville = old.idville;
END //
DELIMITER ;

-- 25. TABLE D'HISTORISATION DE LA RELATION GERER
DROP TABLE IF EXISTS histoGerer;
CREATE TABLE histoGerer AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM gerer
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoGererInsert;
DELIMITER //
CREATE TRIGGER HistoGererInsert
AFTER INSERT ON gerer
FOR EACH ROW
BEGIN
	INSERT INTO histoGerer select *, sysdate(), user(), 'INSERT'
	FROM gerer
	WHERE idgare = new.idgare AND idservice = new.idservice;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoGererUpdate;
DELIMITER //
CREATE TRIGGER HistoGererUpdate
BEFORE UPDATE ON gerer
FOR EACH ROW
BEGIN
	INSERT INTO histoGerer select *, sysdate(), user(), 'UPDATE'
	FROM gerer
	WHERE idgare = old.idgare AND idservice = old.idservice;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoGererDelete;
DELIMITER //
CREATE TRIGGER HistoGererDelete
BEFORE DELETE ON gerer
FOR EACH ROW
BEGIN
	INSERT INTO histoGerer select *, sysdate(), user(), 'DELETE'
	FROM gerer
	WHERE idgare = old.idgare AND idservice = old.idservice;
END //
DELIMITER ;

-- 26. TABLE D'HISTORISATION DE LA RELATION PROPOSE
DROP TABLE IF EXISTS histoPropose;
CREATE TABLE histoPropose AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM propose
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoProposeInsert;
DELIMITER //
CREATE TRIGGER HistoProposeInsert
AFTER INSERT ON propose
FOR EACH ROW
BEGIN
	INSERT INTO histoPropose select *, sysdate(), user(), 'INSERT'
	FROM propose
	WHERE numtrain = new.numtrain AND idservice = new.idservice;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoProposeUpdate;
DELIMITER //
CREATE TRIGGER HistoProposeUpdate
BEFORE UPDATE ON propose
FOR EACH ROW
BEGIN
	INSERT INTO histoPropose select *, sysdate(), user(), 'UPDATE'
	FROM propose
	WHERE numtrain = old.numtrain AND idservice = old.idservice;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoProposeDelete;
DELIMITER //
CREATE TRIGGER HistoProposeDelete
BEFORE DELETE ON propose
FOR EACH ROW
BEGIN
	INSERT INTO histoPropose select *, sysdate(), user(), 'DELETE'
	FROM propose
	WHERE numtrain = old.numtrain AND idservice = old.idservice;
END //
DELIMITER ;

-- 27. TABLE D'HISTORISATION DE LA RELATION CONTENIR
DROP TABLE IF EXISTS histoContenir;
CREATE TABLE histoContenir AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM contenir
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoContenirInsert;
DELIMITER //
CREATE TRIGGER HistoContenirInsert
AFTER INSERT ON contenir
FOR EACH ROW
BEGIN
	INSERT INTO histoContenir select *, sysdate(), user(), 'INSERT'
	FROM contenir
	WHERE idreservation = new.idreservation AND numtrain = new.numtrain;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoContenirUpdate;
DELIMITER //
CREATE TRIGGER HistoContenirUpdate
BEFORE UPDATE ON contenir
FOR EACH ROW
BEGIN
	INSERT INTO histoContenir select *, sysdate(), user(), 'UPDATE'
	FROM contenir
	WHERE idreservation = old.idreservation AND numtrain = old.numtrain;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoContenirDelete;
DELIMITER //
CREATE TRIGGER HistoContenirDelete
BEFORE DELETE ON contenir
FOR EACH ROW
BEGIN
	INSERT INTO histoContenir select *, sysdate(), user(), 'DELETE'
	FROM contenir
	WHERE idreservation = old.idreservation AND numtrain = old.numtrain;
END //
DELIMITER ;

-- 28. TABLE D'HISTORISATION DE LA RELATION FAIRE
DROP TABLE IF EXISTS histoFaire;
CREATE TABLE histoFaire AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM faire
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoFaireInsert;
DELIMITER //
CREATE TRIGGER HistoFaireInsert
AFTER INSERT ON faire
FOR EACH ROW
BEGIN
	INSERT INTO histoFaire select *, sysdate(), user(), 'INSERT'
	FROM faire
	WHERE idu = new.idu AND idreservation = new.idreservation;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoFaireUpdate;
DELIMITER //
CREATE TRIGGER HistoFaireUpdate
BEFORE UPDATE ON faire
FOR EACH ROW
BEGIN
	INSERT INTO histoFaire select *, sysdate(), user(), 'UPDATE'
	FROM faire
	WHERE idu = old.idu AND idreservation = old.idreservation;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoFaireDelete;
DELIMITER //
CREATE TRIGGER HistoFaireDelete
BEFORE DELETE ON faire
FOR EACH ROW
BEGIN
	INSERT INTO histoFaire select *, sysdate(), user(), 'DELETE'
	FROM faire
	WHERE idu = old.idu AND idreservation = old.idreservation;
END //
DELIMITER ;

-- 29. TABLE D'HISTORISATION DE LA RELATION REALISER
DROP TABLE IF EXISTS histoRealiser;
CREATE TABLE histoRealiser AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM realiser
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoRealiserInsert;
DELIMITER //
CREATE TRIGGER HistoRealiserInsert
AFTER INSERT ON realiser
FOR EACH ROW
BEGIN
	INSERT INTO histoRealiser select *, sysdate(), user(), 'INSERT'
	FROM realiser
	WHERE idgare = new.idgare AND idenquete = new.idenquete;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoRealiserUpdate;
DELIMITER //
CREATE TRIGGER HistoRealiserUpdate
BEFORE UPDATE ON realiser
FOR EACH ROW
BEGIN
	INSERT INTO histoRealiser select *, sysdate(), user(), 'UPDATE'
	FROM realiser
	WHERE idgare = old.idgare AND idenquete = old.idenquete;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoRealiserDelete;
DELIMITER //
CREATE TRIGGER HistoRealiserDelete
BEFORE DELETE ON realiser
FOR EACH ROW
BEGIN
	INSERT INTO histoRealiser select *, sysdate(), user(), 'DELETE'
	FROM realiser
	WHERE idgare = old.idgare AND idenquete = old.idenquete;
END //
DELIMITER ;

-- 30. TABLE D'HISTORISATION DE LA RELATION REPONDRE
DROP TABLE IF EXISTS histoRepondre;
CREATE TABLE histoRepondre AS SELECT *, sysdate() dateHeureAction, user() user, '__________' action
FROM repondre
WHERE 2=0;

DROP TRIGGER IF EXISTS HistoRepondreInsert;
DELIMITER //
CREATE TRIGGER HistoRepondreInsert
AFTER INSERT ON repondre
FOR EACH ROW
BEGIN
	INSERT INTO histoRepondre select *, sysdate(), user(), 'INSERT'
	FROM repondre
	WHERE idu = new.idu AND idquestion = new.idquestion;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoRepondreUpdate;
DELIMITER //
CREATE TRIGGER HistoRepondreUpdate
BEFORE UPDATE ON repondre
FOR EACH ROW
BEGIN
	INSERT INTO histoRepondre select *, sysdate(), user(), 'UPDATE'
	FROM repondre
	WHERE idu = old.idu AND idquestion = old.idquestion;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS HistoRepondreDelete;
DELIMITER //
CREATE TRIGGER HistoRepondreDelete
BEFORE DELETE ON repondre
FOR EACH ROW
BEGIN
	INSERT INTO histoRepondre select *, sysdate(), user(), 'DELETE'
	FROM repondre
	WHERE idu = old.idu AND idquestion = old.idquestion;
END //
DELIMITER ;


/*** VIEWS ***/

-- 1. VIEW DE LA TABLE USERS
CREATE OR REPLACE VIEW vusers (idu, nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte)
AS SELECT idu, nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, DATE_FORMAT(last_connexion, '%d/%m/%Y %H:%i'), DATE_FORMAT(last_deconnexion, '%d/%m/%Y %H:%i'), DATE_FORMAT(creation_compte, '%d/%m/%Y %H:%i')
FROM users;

-- 2. VIEW DE LA TABLE CLIENTS
CREATE OR REPLACE VIEW vclients (idu, nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte, date_naissance, tel, adresse, carte_avantage)
AS SELECT u.idu, u.nom, u.prenom, u.pseudo, u.email, u.mdp, u.role, u.nbTentatives, u.nbConnexion, u.bloque, DATE_FORMAT(u.last_connexion, '%d/%m/%Y %H:%i'), DATE_FORMAT(u.last_deconnexion, '%d/%m/%Y %H:%i'), DATE_FORMAT(u.creation_compte, '%d/%m/%Y %H:%i'), DATE_FORMAT(c.date_naissance, '%d/%m/%Y'), c.tel, c.adresse, c.carte_avantage
FROM users u INNER JOIN clients c
ON u.idu = c.idu
GROUP BY u.idu;

-- 3. VIEW DE LA TABLE ADMINS
CREATE OR REPLACE VIEW vadmins (idu, nom, prenom, pseudo, email, mdp, role, nbTentatives, nbConnexion, bloque, last_connexion, last_deconnexion, creation_compte, num_identification, type)
AS SELECT u.idu, u.nom, u.prenom, u.pseudo, u.email, u.mdp, u.role, u.nbTentatives, u.nbConnexion, u.bloque, DATE_FORMAT(u.last_connexion, '%d/%m/%Y %H:%i'), DATE_FORMAT(u.last_deconnexion, '%d/%m/%Y %H:%i'), DATE_FORMAT(u.creation_compte, '%d/%m/%Y %H:%i'), a.num_identification, a.type
FROM users u INNER JOIN admins a
ON u.idu = a.idu
GROUP BY u.idu;

-- 4. VIEW DE LA TABLE COMMENTAIRES
CREATE OR REPLACE VIEW vcommentaires (idcom, contenu, date_heure_post, idu, nom, prenom, pseudo, email, last_connexion)
AS SELECT c.idcom, c.contenu, DATE_FORMAT(c.date_heure_post, '%d/%m/%Y %H:%i'), u.idu, u.nom, u.prenom, u.pseudo, u.email, DATE_FORMAT(u.last_connexion, '%d/%m/%Y %H:%i')
FROM commentaires c INNER JOIN users u
ON c.idu = u.idu
GROUP BY c.idcom;

-- 5. VIEW DE LA TABLE TRAINS
CREATE OR REPLACE VIEW vtrains (numtrain, nomtrain, nbwagon, date_creation_train)
AS SELECT numtrain, nomtrain, nbwagon, DATE_FORMAT(date_creation_train, '%d/%m/%Y')
FROM trains;

-- 6. VIEW DE LA TABLE VILLES
CREATE OR REPLACE VIEW vvilles (idville, nomville, idpays, nompays)
AS SELECT v.idville, v.nomville, v.idpays, p.nompays
FROM villes v INNER JOIN pays p
ON v.idpays = p.idpays
GROUP BY v.idville;

-- 7. VIEW DE LA TABLE GARES
CREATE OR REPLACE VIEW vgares (idgare, nomgare, type, adresse, idpays, nompays, idville, nomville)
AS SELECT g.idgare, g.nomgare, g.type, g.adresse, g.idpays, p.nompays, g.idville, v.nomville
FROM gares g INNER JOIN pays p
ON g.idpays = p.idpays
INNER JOIN villes v
ON g.idville = v.idville
GROUP BY g.idgare;

-- 8. VIEW DE LA TABLE TRAJETS
CREATE OR REPLACE VIEW vtrajets (idtrajet, numtrain, nomtrain, idgare1, gare_depart, date_depart, heure_depart, idgare2, gare_arrivee, date_arrivee, heure_arrivee, duree, prix, quai)
AS SELECT trj.idtrajet, trj.numtrain, trn.nomtrain, trj.idgare1, g1.nomgare, DATE_FORMAT(trj.date_depart, '%d/%m/%Y'), DATE_FORMAT(trj.heure_depart, '%H:%i'), trj.idgare2, g2.nomgare, DATE_FORMAT(trj.date_arrivee, '%d/%m/%Y'), DATE_FORMAT(trj.heure_arrivee, '%H:%i'), trj.duree, trj.prix, trj.quai
FROM trajets trj INNER JOIN trains trn
ON trj.numtrain = trn.numtrain
INNER JOIN gares g1
ON trj.idgare1 = g1.idgare
INNER JOIN gares g2
ON trj.idgare2 = g2.idgare
GROUP BY trj.idtrajet;

-- 9. VIEW DE LA TABLE ENERGIES
CREATE OR REPLACE VIEW venergies (idenergie, numtrain, nomtrain, energie_consommee)
AS SELECT e.idenergie, e.numtrain, t.nomtrain, e.energie_consommee
FROM energies e INNER JOIN trains t
ON e.numtrain = t.numtrain
GROUP BY e.numtrain;

-- 10. VIEW DE LA TABLE RESERVATIONS
CREATE OR REPLACE VIEW vreservations (idreservation, statut_reservation, nbpersonne, idu, nom, prenom, email, creation_compte, numtrain, nomtrain)
AS SELECT r.idreservation, r.statut_reservation, r.nbpersonne, r.idu, u.nom, u.prenom, u.email, DATE_FORMAT(u.creation_compte, '%d/%m/%Y %H:%i'), r.numtrain, t.nomtrain
FROM reservations r INNER JOIN users u
ON r.idu = u.idu
INNER JOIN trains t
ON r.numtrain = t.numtrain
GROUP BY r.idreservation;

-- 11. VIEW DE LA TABLE FACTURES
CREATE OR REPLACE VIEW vfactures (idfacture, date_heure_facture, idu, nom, prenom, email, idreservation, statut_reservation, nbpersonne)
AS SELECT f.idfacture, DATE_FORMAT(f.date_heure_facture, '%d/%m/%Y %H:%i'), f.idu, u.nom, u.prenom, u.email, f.idreservation, r.statut_reservation, r.nbpersonne
FROM factures f INNER JOIN users u
ON f.idu = u.idu
INNER JOIN reservations r
ON r.idreservation = r.idreservation
GROUP BY f.idfacture;

-- 12. VIEW DE LA TABLE SERVICES
CREATE OR REPLACE VIEW vservices (idservice, nomservice, typeservice, numtrain, nomtrain)
AS SELECT s.idservice, s.nomservice, s.typeservice, s.numtrain, t.nomtrain
FROM services s INNER JOIN trains t
ON s.numtrain = t.numtrain
GROUP BY s.idservice;

-- 13. VIEW DE LA TABLE LIVRES
CREATE OR REPLACE VIEW vlivres (idservice, nomservice, typeservice, telservice, numtrain, nomtrain, idgare, nomgare, reflivre, nomlivre, auteur, edition, nbpages, resume, disponible, date_sortie)
AS SELECT l.idservice, s.nomservice, s.typeservice, s.telservice, s.numtrain, t.nomtrain, s.idgare, g.nomgare, l.reflivre, l.nomlivre, l.auteur, l.edition, l.nbpages, l.resume, l.disponible, DATE_FORMAT(l.date_sortie, '%d/%m/%Y')
FROM livres l INNER JOIN services s
ON l.idservice = s.idservice
INNER JOIN trains t
ON s.numtrain = t.numtrain
INNER JOIN gares g
ON s.idgare = g.idgare
GROUP BY l.idservice;

-- 14. VIEW DE LA TABLE FILMS
CREATE OR REPLACE VIEW vfilms (idservice, nomservice, typeservice, telservice, numtrain, nomtrain, idgare, nomgare, reffilm, nomfilm, realisateur, duree, resume, disponible, date_sortie)
AS SELECT f.idservice, s.nomservice, s.typeservice, s.telservice, s.numtrain, t.nomtrain, s.idgare, g.nomgare, f.reffilm, f.nomfilm, f.realisateur, f.duree, f.resume, f.disponible, DATE_FORMAT(f.date_sortie, '%d/%m/%Y')
FROM films f INNER JOIN services s
ON f.idservice = s.idservice
INNER JOIN trains t
ON s.numtrain = t.numtrain
INNER JOIN gares g
ON s.idgare = g.idgare
GROUP BY f.idservice;

-- 15. VIEW DE LA TABLE CONSOMMATIONS
CREATE OR REPLACE VIEW vconsommations (idservice, nomservice, typeservice, telservice, numtrain, nomtrain, idgare, nomgare, refarticle, article, prix, quantite, description, date_expiration, date_ajout)
AS SELECT c.idservice, s.nomservice, s.typeservice, s.telservice, s.numtrain, t.nomtrain, s.idgare, g.nomgare, c.refarticle, c.article, c.prix, c.quantite, c.description, DATE_FORMAT(c.date_expiration, '%d/%m/%Y'), DATE_FORMAT(c.date_ajout, '%d/%m/%Y')
FROM consommations c INNER JOIN services s
ON c.idservice = s.idservice
INNER JOIN trains t
ON s.numtrain = t.numtrain
INNER JOIN gares g
ON s.idgare = g.idgare
GROUP BY c.idservice;

-- 16. VIEW DE LA RELATION MODERER
CREATE OR REPLACE VIEW vmoderer (idu, num_identification, idcom, contenu, date_heure_post)
AS SELECT m.idu, a.num_identification, m.idcom, c.contenu, DATE_FORMAT(c.date_heure_post, '%d/%m/%Y %H:%i')
FROM moderer m INNER JOIN admins a
ON m.idu = a.idu
INNER JOIN commentaires c
ON m.idcom = c.idcom
GROUP BY m.idu;

-- 17. VIEW DE LA RELATION CONCERNE
CREATE OR REPLACE VIEW vconcerne (idcom, contenu, date_heure_post, idtrajet, date_depart, heure_depart, date_arrivee, heure_arrivee, duree, prix, quai)
AS SELECT con.idcom, com.contenu, DATE_FORMAT(com.date_heure_post, '%d/%m/%Y %H:%i'), con.idtrajet, DATE_FORMAT(trj.date_depart, '%d/%m/%Y'), DATE_FORMAT(trj.heure_depart, '%H:%i'), DATE_FORMAT(trj.date_arrivee, '%d/%m/%Y'), DATE_FORMAT(trj.heure_arrivee, '%H:%i'), trj.duree, trj.prix, trj.quai
FROM concerne con INNER JOIN commentaires com
ON con.idcom = com.idcom
INNER JOIN trajets trj
ON con.idtrajet = trj.idtrajet
GROUP BY con.idcom;

-- 18. VIEW DE LA RELATION AVOIR
CREATE OR REPLACE VIEW vavoir (numtrain, nomtrain, nbwagon, date_creation_train, idgare, nomgare, type, adresse, idpays, nompays, idville, nomville)
AS SELECT a.numtrain, t.nomtrain, t.nbwagon, DATE_FORMAT(t.date_creation_train, '%d/%m/%Y'), a.idgare, g.nomgare, g.type, g.adresse, g.idpays, p.nompays, g.idville, v.nomville
FROM avoir a INNER JOIN trains t
ON a.numtrain = t.numtrain
INNER JOIN gares g
ON a.idgare = g.idgare
INNER JOIN pays p
ON g.idpays = p.idpays
INNER JOIN villes v
ON g.idville = v.idville
GROUP BY a.numtrain;

-- 19. VIEW DE LA RELATION SE_SITUE
CREATE OR REPLACE VIEW vsesitue (idgare, nomgare, type, adresse, idpays, nompays)
AS SELECT s1.idgare, g.nomgare, g.type, g.adresse, s1.idpays, p.nompays
FROM se_situe s1 INNER JOIN gares g
ON s1.idgare = g.idgare
INNER JOIN pays p
ON s1.idpays = p.idpays
GROUP BY s1.idgare;

-- 20. VIEW DE LA RELATION SE_SITUE_2
CREATE OR REPLACE VIEW vsesitue2 (idgare, nomgare, type, adresse, idville, nomville)
AS SELECT s2.idgare, g.nomgare, g.type, g.adresse, s2.idville, v.nomville
FROM se_situe_2 s2 INNER JOIN gares g
ON s2.idgare = g.idgare
INNER JOIN villes v
ON s2.idville = v.idville
GROUP BY s2.idgare;

-- 21. VIEW DE LA RELATION GERER
CREATE OR REPLACE VIEW vgerer (idgare, nomgare, type, adresse, idpays, nompays, idville, nomville, idservice, nomservice, typeservice, numtrain, nomtrain, nbwagon)
AS SELECT ge.idgare, g.nomgare, g.type, g.adresse, g.idpays, p.nompays, g.idville, v.nomville, ge.idservice, s.nomservice, s.typeservice, s.numtrain, t.nomtrain, t.nbwagon
FROM gerer ge INNER JOIN gares g
ON ge.idgare = g.idgare
INNER JOIN pays p
ON g.idpays = p.idpays
INNER JOIN villes v
ON g.idville = v.idville
INNER JOIN services s
ON ge.idservice = s.idservice
INNER JOIN trains t
ON s.numtrain = t.numtrain
GROUP BY ge.idgare;

-- 22. VIEW DE LA RELATION PROPOSE
CREATE OR REPLACE VIEW vpropose (numtrain, nomtrain, nbwagon, date_creation_train, idservice, nomservice, typeservice)
AS SELECT p.numtrain, t.nomtrain, t.nbwagon, DATE_FORMAT(t.date_creation_train, '%d/%m/%Y'), p.idservice, s.nomservice, s.typeservice
FROM propose p INNER JOIN trains t
ON p.numtrain = t.numtrain
INNER JOIN services s
ON p.idservice = s.idservice
GROUP BY p.numtrain;

-- 23. VIEW DE LA RELATION CONTENIR
CREATE OR REPLACE VIEW vcontenir (idreservation, statut_reservation, nbpersonne, idu, nom, prenom, email, numtrain, nomtrain, nbwagon, date_creation_train)
AS SELECT c.idreservation, r.statut_reservation, r.nbpersonne, r.idu, u.nom, u.prenom, u.email, c.numtrain, t.nomtrain, t.nbwagon, DATE_FORMAT(t.date_creation_train, '%d/%m/%Y')
FROM contenir c INNER JOIN reservations r
ON c.idreservation = r.idreservation
INNER JOIN users u
ON r.idu = u.idu
INNER JOIN trains t
ON c.numtrain = t.numtrain
GROUP BY c.idreservation;

-- 24. VIEW DE LA RELATION FAIRE
CREATE OR REPLACE VIEW vfaire (idu, nom, prenom, pseudo, email, creation_compte, idreservation, statut_reservation, nbpersonne, numtrain, nomtrain, nbwagon, date_creation_train)
AS SELECT f.idu, u.nom, u.prenom, u.pseudo, u.email, DATE_FORMAT(u.creation_compte, '%d/%m/%Y %H:%i'), f.idreservation, r.statut_reservation, r.nbpersonne, r.numtrain, t.nomtrain, t.nbwagon, DATE_FORMAT(t.date_creation_train, '%d/%m/%Y')
FROM faire f INNER JOIN users u
ON f.idu = u.idu
INNER JOIN reservations r
ON f.idreservation = r.idreservation
INNER JOIN trains t
ON r.numtrain = t.numtrain
GROUP BY f.idu;

-- 25. VIEW DE LA RELATION REALISER
CREATE OR REPLACE VIEW vrealiser (idgare, nomgare, type, adresse, idpays, nompays, idville, nomville, idenquete, nom_enquete, description, date_creation_enquete)
AS SELECT r.idgare, g.nomgare, g.type, g.adresse, g.idpays, p.nompays, g.idville, v.nomville, r.idenquete, e.nom_enquete,
e.description, DATE_FORMAT(e.date_creation_enquete, '%d/%m/%Y')
FROM realiser r INNER JOIN gares g
ON r.idgare = g.idgare
INNER JOIN pays p
ON g.idpays = p.idpays
INNER JOIN villes v
ON g.idville = v.idville
INNER JOIN enquetes e
ON r.idenquete = e.idenquete
GROUP BY r.idgare;

-- 26. VIEW DE LA RELATION REPONDRE
CREATE OR REPLACE VIEW vrepondre (idu, nom, prenom, pseudo, email, idquestion, enonce, reponse)
AS SELECT r.idu, u.nom, u.prenom, u.pseudo, u.email, r.idquestion, q.enonce, r.reponse
FROM repondre r INNER JOIN users u
ON r.idu = u.idu
INNER JOIN questions q
ON r.idquestion = q.idquestion
GROUP BY r.idu;

-- 27. VIEW DE LA TABLE ENQUETES
CREATE OR REPLACE VIEW venquetes (idenquete, nom_enquete, description, date_creation_enquete)
AS SELECT e.idenquete, e.nom_enquete, e.description, DATE_FORMAT(e.date_creation_enquete, '%d/%m/%Y')
FROM enquetes e
GROUP BY e.idenquete;


/*** TRIGGERS & FONCTIONS ***/

# TABLE USERS - Vérification du pseudo de l'utilisateur

-- Fonction qui permet de compter le nombre de pseudo utilisés d'un nouveau pseudo passé en paramètres
-- (Si le nouveau pseudo passé en paramètre existe déjà ou non)
DROP FUNCTION IF EXISTS countPseudoUser;
DELIMITER //
CREATE FUNCTION countPseudoUser(newpseudo varchar(20))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM users WHERE pseudo = newpseudo INTO @result;
	RETURN @result;
END //
DELIMITER ;

-- Trigger qui permet de vérifier si le nouveau pseudo de l'utilisateur existe déjà ou non
DROP TRIGGER IF EXISTS verifPseudoUser;
DELIMITER //
CREATE TRIGGER verifPseudoUser
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	if countPseudoUser(new.pseudo)
		then signal sqlstate '45000'
		set message_text = 'Pseudo déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE USERS - Vérification de l'adresse email de l'utilisateur
DROP FUNCTION IF EXISTS countEmailUser;
DELIMITER //
CREATE FUNCTION countEmailUser(newemail varchar(50))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM users WHERE email = newemail INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifEmailUser;
DELIMITER //
CREATE TRIGGER verifEmailUser
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	if countEmailUser(new.email)
		then signal sqlstate '45000'
		set message_text = 'Adresse email déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE USERS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsUsers;
DELIMITER //
CREATE TRIGGER verifContentsUsers
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	if new.nom = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom ne peut pas être vide';
	elseif new.prenom = ''
		then signal sqlstate '45000'
		set message_text = 'Le prénom ne peut pas être vide';
	elseif new.pseudo = ''
		then signal sqlstate '45000'
		set message_text = 'Le pseudo ne peut pas être vide';
	elseif new.email = ''
		then signal sqlstate '45000'
		set message_text = 'L\'adresse email ne peut pas être vide';
	elseif new.mdp = ''
		then signal sqlstate '45000'
		set message_text = 'Le mot de passe ne peut pas être vide';
	end if;
END //
DELIMITER ;

/* Tests du trigger "verifContentsUsers"
call insertUser("", "Test", "test123", "test1@gmail.com", "123", "client");
call insertUser("TEST", "", "test456", "test2@gmail.com", "456", "client");
call insertUser("TEST", "Test", "", "test3@gmail.com", "789", "client");
call insertUser("TEST", "Test", "test789", "", "987", "client");
call insertUser("TEST", "Test", "test987", "test4@gmail.com", "", "client");
*/

# TABLE CLIENTS - Vérification du numéro de téléphone du client
DROP FUNCTION IF EXISTS countTelClient;
DELIMITER //
CREATE FUNCTION countTelClient(newtel char(10))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM clients WHERE tel = newtel INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifTelClient;
DELIMITER //
CREATE TRIGGER verifTelClient
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
	if countTelClient(new.tel)
		then signal sqlstate '45000'
		set message_text = 'Numéro de téléphone déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE CLIENTS - Vérification de l'adresse du client
DROP FUNCTION IF EXISTS countAdresseClient;
DELIMITER //
CREATE FUNCTION countAdresseClient(newadresse varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM clients WHERE adresse = newadresse INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifAdresseClient;
DELIMITER //
CREATE TRIGGER verifAdresseClient
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
	if countAdresseClient(new.tel)
		then signal sqlstate '45000'
		set message_text = 'Adresse déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE CLIENTS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsClients;
DELIMITER //
CREATE TRIGGER verifContentsClients
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
	if new.tel = ''
		then signal sqlstate '45000'
		set message_text = 'Le numéro de téléphone ne peut pas être vide';
	elseif new.adresse = ''
		then signal sqlstate '45000'
		set message_text = 'L\'adresse ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE ADMINS - Vérification du numéro d'identification de l'administrateur
DROP FUNCTION IF EXISTS countNumIdentificationAdmin;
DELIMITER //
CREATE FUNCTION countNumIdentificationAdmin(newnum_identification int(11))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM admins WHERE num_identification = newnum_identification INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNumIdentificationAdmin;
DELIMITER //
CREATE TRIGGER verifNumIdentificationAdmin
BEFORE INSERT ON admins
FOR EACH ROW
BEGIN
	if countNumIdentificationAdmin(new.num_identification)
		then signal sqlstate '45000'
		set message_text = 'Numéro d\'identification déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE COMMENTAIRES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsCommentaires;
DELIMITER //
CREATE TRIGGER verifContentsCommentaires
BEFORE INSERT ON commentaires
FOR EACH ROW
BEGIN
	if new.contenu = ''
		then signal sqlstate '45000'
		set message_text = 'La commentaire ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE TRAINS - Vérification du nom du train
DROP FUNCTION IF EXISTS countNomTrain;
DELIMITER //
CREATE FUNCTION countNomTrain(newnomtrain varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM trains WHERE nomtrain = newnomtrain INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomTrain;
DELIMITER //
CREATE TRIGGER verifNomTrain
BEFORE INSERT ON trains
FOR EACH ROW
BEGIN
	if countNomTrain(new.nomtrain)
		then signal sqlstate '45000'
		set message_text = 'Nom de train déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE TRAINS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsTrains;
DELIMITER //
CREATE TRIGGER verifContentsTrains
BEFORE INSERT ON trains
FOR EACH ROW
BEGIN
	if new.nomtrain = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du train ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE PAYS - Vérification du nom du pays
DROP FUNCTION IF EXISTS countNomPays;
DELIMITER //
CREATE FUNCTION countNomPays(newnompays varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM pays WHERE nompays = newnompays INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomPays;
DELIMITER //
CREATE TRIGGER verifNomPays
BEFORE INSERT ON pays
FOR EACH ROW
BEGIN
	if countNomPays(new.nompays)
		then signal sqlstate '45000'
		set message_text = 'Nom de pays déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE PAYS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsPays;
DELIMITER //
CREATE TRIGGER verifContentsPays
BEFORE INSERT ON pays
FOR EACH ROW
BEGIN
	if new.nompays = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du pays ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE VILLES - Vérification du nom de la ville
DROP FUNCTION IF EXISTS countNomVille;
DELIMITER //
CREATE FUNCTION countNomVille(newnomville varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM villes WHERE nomville = newnomville INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomVille;
DELIMITER //
CREATE TRIGGER verifNomVille
BEFORE INSERT ON villes
FOR EACH ROW
BEGIN
	if countNomVille(new.nomville)
		then signal sqlstate '45000'
		set message_text = 'Nom de ville déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE VILLES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsVilles;
DELIMITER //
CREATE TRIGGER verifContentsVilles
BEFORE INSERT ON villes
FOR EACH ROW
BEGIN
	if new.nomville = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom de la ville ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE GARES - Vérification du nom de la gare
DROP FUNCTION IF EXISTS countNomGare;
DELIMITER //
CREATE FUNCTION countNomGare(newnomgare varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM gares WHERE nomgare = newnomgare INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomGare;
DELIMITER //
CREATE TRIGGER verifNomGare
BEFORE INSERT ON gares
FOR EACH ROW
BEGIN
	if countNomGare(new.nomgare)
		then signal sqlstate '45000'
		set message_text = 'Nom de gare déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE GARES - Vérification de l'adresse de la gare
DROP FUNCTION IF EXISTS countAdresseGare;
DELIMITER //
CREATE FUNCTION countAdresseGare(newadresse varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM gares WHERE adresse = newadresse INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifAdresseGare;
DELIMITER //
CREATE TRIGGER verifAdresseGare
BEFORE INSERT ON gares
FOR EACH ROW
BEGIN
	if countAdresseGare(new.adresse)
		then signal sqlstate '45000'
		set message_text = 'Adresse déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE GARES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsGares;
DELIMITER //
CREATE TRIGGER verifContentsGares
BEFORE INSERT ON gares
FOR EACH ROW
BEGIN
	if new.nomgare = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom de la gare ne peut pas être vide';
	elseif new.adresse = ''
		then signal sqlstate '45000'
		set message_text = 'L\'adresse ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE TRAJETS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsTrajets;
DELIMITER //
CREATE TRIGGER verifContentsTrajets
BEFORE INSERT ON trajets
FOR EACH ROW
BEGIN
	if new.prix = ''
		then signal sqlstate '45000'
		set message_text = 'Le prix ne peut pas être vide';
	elseif new.quai = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du quai ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE SERVICES - Vérification du numéro de téléphone du service
DROP FUNCTION IF EXISTS countTelService;
DELIMITER //
CREATE FUNCTION countTelService(newtelservice char(10))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM services WHERE telservice = newtelservice INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifTelService;
DELIMITER //
CREATE TRIGGER verifTelService
BEFORE INSERT ON services
FOR EACH ROW
BEGIN
	if countTelService(new.telservice)
		then signal sqlstate '45000'
		set message_text = 'Numéro de service déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE SERVICES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsServices;
DELIMITER //
CREATE TRIGGER verifContentsServices
BEFORE INSERT ON services
FOR EACH ROW
BEGIN
	if new.nomservice = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du service ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE LIVRES - Vérification de la référence du livre
DROP FUNCTION IF EXISTS countRefLivre;
DELIMITER //
CREATE FUNCTION countRefLivre(newreflivre int(11))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM livres WHERE reflivre = newreflivre INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifRefLivre;
DELIMITER //
CREATE TRIGGER verifRefLivre
BEFORE INSERT ON livres
FOR EACH ROW
BEGIN
	if countRefLivre(new.reflivre)
		then signal sqlstate '45000'
		set message_text = 'Référence du livre déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE LIVRES - Vérification du nom du livre
DROP FUNCTION IF EXISTS countNomLivre;
DELIMITER //
CREATE FUNCTION countNomLivre(newnomlivre varchar(50))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM livres WHERE nomlivre = newnomlivre INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomLivre;
DELIMITER //
CREATE TRIGGER verifNomLivre
BEFORE INSERT ON livres
FOR EACH ROW
BEGIN
	if countNomLivre(new.nomlivre)
		then signal sqlstate '45000'
		set message_text = 'Nom de livre déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE LIVRES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsLivres;
DELIMITER //
CREATE TRIGGER verifContentsLivres
BEFORE INSERT ON livres
FOR EACH ROW
BEGIN
	if new.nomlivre = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du livre ne peut pas être vide';
	elseif new.auteur = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom de l\'auteur ne peut pas être vide';
	elseif new.edition = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom de l\'édition ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE FILMS - Vérification de la référence du film
DROP FUNCTION IF EXISTS countRefFilm;
DELIMITER //
CREATE FUNCTION countRefFilm(newreffilm int(11))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM films WHERE reffilm = newreffilm INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifRefFilm;
DELIMITER //
CREATE TRIGGER verifRefFilm
BEFORE INSERT ON films
FOR EACH ROW
BEGIN
	if countRefFilm(new.reffilm)
		then signal sqlstate '45000'
		set message_text = 'Référence du film déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE FILMS - Vérification du nom du film
DROP FUNCTION IF EXISTS countNomFilm;
DELIMITER //
CREATE FUNCTION countNomFilm(newnomfilm varchar(50))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM films WHERE nomfilm = newnomfilm INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomFilm;
DELIMITER //
CREATE TRIGGER verifNomFilm
BEFORE INSERT ON films
FOR EACH ROW
BEGIN
	if countNomFilm(new.nomfilm)
		then signal sqlstate '45000'
		set message_text = 'Nom de film déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE FILMS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsFilms;
DELIMITER //
CREATE TRIGGER verifContentsFilms
BEFORE INSERT ON films
FOR EACH ROW
BEGIN
	if new.nomfilm = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du film ne peut pas être vide';
	elseif new.realisateur = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du réalisateur ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE CONSOMMATIONS - Vérification de la référence de l'article
DROP FUNCTION IF EXISTS countRefArticle;
DELIMITER //
CREATE FUNCTION countRefArticle(newrefarticle int(11))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM consommations WHERE refarticle = newrefarticle INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifRefArticle;
DELIMITER //
CREATE TRIGGER verifRefArticle
BEFORE INSERT ON consommations
FOR EACH ROW
BEGIN
	if countRefArticle(new.refarticle)
		then signal sqlstate '45000'
		set message_text = 'Référence de l\'article déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE CONSOMMATIONS - Vérification du nom de l'article
DROP FUNCTION IF EXISTS countNomArticle;
DELIMITER //
CREATE FUNCTION countNomArticle(newarticle varchar(50))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM consommations WHERE article = newarticle INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomArticle;
DELIMITER //
CREATE TRIGGER verifNomArticle
BEFORE INSERT ON consommations
FOR EACH ROW
BEGIN
	if countNomArticle(new.article)
		then signal sqlstate '45000'
		set message_text = 'Article déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE CONSOMMATIONS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsConsommations;
DELIMITER //
CREATE TRIGGER verifContentsConsommations
BEFORE INSERT ON consommations
FOR EACH ROW
BEGIN
	if new.article = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom du l\'article ne peut pas être vide';
	elseif new.prix = ''
		then signal sqlstate '45000'
		set message_text = 'Le prix de l\'article ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE ENQUETES - Vérification du nom de l'enquête
DROP FUNCTION IF EXISTS countNomEnquete;
DELIMITER //
CREATE FUNCTION countNomEnquete(newnom_enquete varchar(100))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM enquetes WHERE nom_enquete = newnom_enquete INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifNomEnquete;
DELIMITER //
CREATE TRIGGER verifNomEnquete
BEFORE INSERT ON enquetes
FOR EACH ROW
BEGIN
	if countNomEnquete(new.nom_enquete)
		then signal sqlstate '45000'
		set message_text = 'Nom de l\'enquête déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE ENQUETES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsEnquetes;
DELIMITER //
CREATE TRIGGER verifContentsEnquetes
BEFORE INSERT ON enquetes
FOR EACH ROW
BEGIN
	if new.nom_enquete = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom de l\'enquête ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE QUESTIONS - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsQuestions;
DELIMITER //
CREATE TRIGGER verifContentsQuestions
BEFORE INSERT ON questions
FOR EACH ROW
BEGIN
	if new.enonce = ''
		then signal sqlstate '45000'
		set message_text = 'L\'énoncé de la question ne peut pas être vide';
	end if;
END //
DELIMITER ;

# TABLE QUESTIONS - Vérification de l'énoncé de la question
DROP FUNCTION IF EXISTS countEnonceQuestion;
DELIMITER //
CREATE FUNCTION countEnonceQuestion(newenonce varchar(255))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM questions WHERE enonce = newenonce INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifEnonceQuestion;
DELIMITER //
CREATE TRIGGER verifEnonceQuestion
BEFORE INSERT ON questions
FOR EACH ROW
BEGIN
	if countEnonceQuestion(new.enonce)
		then signal sqlstate '45000'
		set message_text = 'Énoncé déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE PERSONNES - Vérification de l'adresse email de la personne
DROP FUNCTION IF EXISTS countEmailPersonne;
DELIMITER //
CREATE FUNCTION countEmailPersonne(newemail varchar(50))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM personnes WHERE email = newemail INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifEmailPersonne;
DELIMITER //
CREATE TRIGGER verifEmailPersonne
BEFORE INSERT ON personnes
FOR EACH ROW
BEGIN
	if countEmailPersonne(new.email)
		then signal sqlstate '45000'
		set message_text = 'Adresse email déjà utilisée !';
	end if;
END //
DELIMITER ;

# TABLE PERSONNES - Vérification du numéro de téléphone de la personne
DROP FUNCTION IF EXISTS countTelPersonne;
DELIMITER //
CREATE FUNCTION countTelPersonne(newtel char(10))
RETURNS INT
BEGIN
	SELECT COUNT(*) FROM personnes WHERE tel = newtel INTO @result;
	RETURN @result;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS verifTelPersonne;
DELIMITER //
CREATE TRIGGER verifTelPersonne
BEFORE INSERT ON personnes
FOR EACH ROW
BEGIN
	if countTelPersonne(new.tel)
		then signal sqlstate '45000'
		set message_text = 'Numéro de téléphone déjà utilisé !';
	end if;
END //
DELIMITER ;

# TABLE PERSONNES - Vérification des données non remplis => ''
DROP TRIGGER IF EXISTS verifContentsPersonnes;
DELIMITER //
CREATE TRIGGER verifContentsPersonnes
BEFORE INSERT ON personnes
FOR EACH ROW
BEGIN
	if new.nom = ''
		then signal sqlstate '45000'
		set message_text = 'Le nom de la personne ne peut pas être vide';
	elseif new.prenom = ''
		then signal sqlstate '45000'
		set message_text = 'Le prénom de la personne ne peut pas être vide';
	elseif new.email = ''
		then signal sqlstate '45000'
		set message_text = 'L\'adresse email de la personne ne peut pas être vide';
	elseif new.tel = ''
		then signal sqlstate '45000'
		set message_text = 'Le numéro de téléphone de la personne ne peut pas être vide';
	elseif new.adresse = ''
		then signal sqlstate '45000'
		set message_text = 'L\'adresse de la personne ne peut pas être vide';
	end if;
END //
DELIMITER ;


/*** PROCEDURES ***/

# TABLE USERS 
DROP PROCEDURE IF EXISTS insertUser;
DELIMITER //
CREATE PROCEDURE insertUser(in u_nom varchar(30), in u_prenom varchar(30), in u_pseudo varchar(20), in u_email varchar(50), in u_mdp varchar(255), in u_role enum("client", "admin"))
BEGIN
	INSERT INTO users VALUES (null, u_nom, u_prenom, u_pseudo, u_email, u_mdp, u_role, 0, 0, 0, null, null, sysdate());
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateUser;
DELIMITER //
CREATE PROCEDURE updateUser(in u_nom varchar(30), in u_prenom varchar(30), in u_pseudo varchar(20), in u_email varchar(50), in u_mdp varchar(255), in u_role enum("client", "admin"))
BEGIN
	UPDATE users
	SET nom = u_nom, prenom = u_prenom, pseudo = u_pseudo, email = u_email, mdp = u_mdp, role = u_role
	WHERE pseudo = u_pseudo AND email = u_email;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteUser;
DELIMITER //
CREATE PROCEDURE deleteUser(in u_pseudo varchar(20), in u_email varchar(50))
BEGIN
	DELETE FROM users WHERE pseudo = u_pseudo AND email = u_email;
END //
DELIMITER ;

# TABLE CLIENTS
DROP PROCEDURE IF EXISTS insertClient;
DELIMITER //
CREATE PROCEDURE insertClient(in u_nom varchar(30), in u_prenom varchar(30), in u_pseudo varchar(20), in u_email varchar(50), in u_mdp varchar(255), in u_role enum("client", "admin"), in c_date_naissance date, in c_tel char(10), in c_adresse varchar(100), in c_carte_avantage enum("Avantage famille", "Avantage week-end", "Avantage jeune 10-30 ans", "Avantage senior 60 ans et plus"))
BEGIN
	declare p_idu int(11);
	INSERT INTO users VALUES (null, u_nom, u_prenom, u_pseudo, u_email, u_mdp, u_role, 0, 0, 0, null, null, sysdate());
	SELECT idu into p_idu
	FROM users
	WHERE pseudo = u_pseudo AND email = u_email;
	INSERT INTO clients VALUES (p_idu, c_date_naissance, c_tel, c_adresse, c_carte_avantage);
	UPDATE users SET nom = UPPER(u_nom) WHERE idu = p_idu;
	UPDATE users SET prenom = CONCAT(UCASE(LEFT(u_prenom,1)), LCASE(SUBSTRING(u_prenom,2))) WHERE idu = p_idu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateClient;
DELIMITER //
CREATE PROCEDURE updateClient(in u_idu int(11), in u_nom varchar(30), in u_prenom varchar(30), in u_pseudo varchar(20), in u_email varchar(50), in u_mdp varchar(255), in u_role enum("client", "admin"), in c_date_naissance date, in c_tel char(10), in c_adresse varchar(100), in c_carte_avantage enum("Avantage famille", "Avantage week-end", "Avantage jeune 10-30 ans", "Avantage senior 60 ans et plus"))
BEGIN
	UPDATE users
	SET nom = u_nom, prenom = u_prenom, pseudo = u_pseudo, email = u_email, mdp = u_mdp, role = u_role
	WHERE idu = u_idu;
	UPDATE clients
	SET date_naissance = c_date_naissance, tel = c_tel, adresse = c_adresse, carte_avantage = c_carte_avantage
	WHERE idu = u_idu;
	UPDATE users SET nom = UPPER(u_nom) WHERE idu = u_idu;
	UPDATE users SET prenom = CONCAT(UCASE(LEFT(u_prenom,1)), LCASE(SUBSTRING(u_prenom,2))) WHERE idu = u_idu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteClient;
DELIMITER //
CREATE PROCEDURE deleteClient(in u_idu int(11))
BEGIN
	DELETE FROM users WHERE idu = u_idu;
	DELETE FROM clients WHERE idu = u_idu;
END //
DELIMITER ;

# TABLE ADMINS
DROP PROCEDURE IF EXISTS insertAdmin;
DELIMITER //
CREATE PROCEDURE insertAdmin(in u_nom varchar(30), in u_prenom varchar(30), in u_pseudo varchar(20), in u_email varchar(50), in u_mdp varchar(255), in u_role enum("client", "admin"), in a_num_identification int(11), in a_type enum("admin", "modo"))
BEGIN
	declare p_idu int(11);
	INSERT INTO users VALUES (null, u_nom, u_prenom, u_pseudo, u_email, u_mdp, u_role, 0, 0, 0, null, null, sysdate());
	SELECT idu into p_idu
	FROM users
	WHERE pseudo = u_pseudo AND email = u_email;
	INSERT INTO admins VALUES (p_idu, a_num_identification, a_type);
	UPDATE users SET nom = UPPER(u_nom) WHERE idu = p_idu;
	UPDATE users SET prenom = CONCAT(UCASE(LEFT(u_prenom,1)), LCASE(SUBSTRING(u_prenom,2))) WHERE idu = p_idu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateAdmin;
DELIMITER //
CREATE PROCEDURE updateAdmin(in u_idu int(11), in u_nom varchar(30), in u_prenom varchar(30), in u_pseudo varchar(20), in u_email varchar(50), in u_mdp varchar(255), in u_role enum("client", "admin"), in a_num_identification int(11), in a_type enum("admin", "modo"))
BEGIN
	UPDATE users
	SET nom = u_nom, prenom = u_prenom, pseudo = u_pseudo, email = u_email, mdp = u_mdp, role = u_role
	WHERE idu = u_idu;
	UPDATE admins
	SET type = a_type
	WHERE idu = u_idu;
	UPDATE users SET nom = UPPER(u_nom) WHERE idu = u_idu;
	UPDATE users SET prenom = CONCAT(UCASE(LEFT(u_prenom,1)), LCASE(SUBSTRING(u_prenom,2))) WHERE idu = u_idu;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteAdmin;
DELIMITER //
CREATE PROCEDURE deleteAdmin(in u_idu int(11))
BEGIN
	DELETE FROM users WHERE idu = u_idu;
	DELETE FROM admins WHERE idu = u_idu;
END //
DELIMITER ;

# TABLE COMMENTAIRES
DROP PROCEDURE IF EXISTS insertCommentaire;
DELIMITER //
CREATE PROCEDURE insertCommentaire(in c_contenu varchar(255), in c_idu int(11))
BEGIN
	INSERT INTO commentaires VALUES (null, c_contenu, sysdate(), c_idu);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateCommentaire;
DELIMITER //
CREATE PROCEDURE updateCommentaire(in c_idcom int(11), in c_contenu varchar(255), in c_idu int(11))
BEGIN
	UPDATE commentaires
	SET contenu = c_contenu
	WHERE idcom = c_idcom;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteCommentaire;
DELIMITER //
CREATE PROCEDURE deleteCommentaire(in c_idcom int(11))
BEGIN
	DELETE FROM commentaires WHERE idcom = c_idcom;
END //
DELIMITER ;

# TABLE TRAINS
DROP PROCEDURE IF EXISTS insertTrain;
DELIMITER //
CREATE PROCEDURE insertTrain(in t_nomtrain varchar(50), in t_nbwagon int(2))
BEGIN
	declare p_numtrain int(11);
	INSERT INTO trains VALUES (null, t_nomtrain, t_nbwagon, sysdate());
	SELECT numtrain into p_numtrain
	FROM trains
	WHERE nomtrain = t_nomtrain;
	UPDATE trains SET nomtrain = CONCAT(UCASE(LEFT(t_nomtrain,1)), LCASE(SUBSTRING(t_nomtrain,2))) WHERE numtrain = p_numtrain;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateTrain;
DELIMITER //
CREATE PROCEDURE updateTrain(in t_numtrain int(11), in t_nomtrain varchar(50), in t_nbwagon int(2))
BEGIN
	UPDATE trains
	SET nomtrain = t_nomtrain, nbwagon = t_nbwagon
	WHERE numtrain = t_numtrain;
	UPDATE trains SET nomtrain = CONCAT(UCASE(LEFT(t_nomtrain,1)), LCASE(SUBSTRING(t_nomtrain,2))) WHERE numtrain = t_numtrain;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteTrain;
DELIMITER //
CREATE PROCEDURE deleteTrain(in t_numtrain int(11))
BEGIN
	DELETE FROM trains WHERE numtrain = t_numtrain;
END //
DELIMITER ;

# TABLE PAYS
DROP PROCEDURE IF EXISTS insertPays;
DELIMITER //
CREATE PROCEDURE insertPays(in p_nompays varchar(100))
BEGIN
	declare p_idpays int(11);
	INSERT INTO pays VALUES (null, p_nompays);
	SELECT idpays into p_idpays
	FROM pays
	WHERE nompays = p_nompays;
	UPDATE pays SET nompays = UPPER(p_nompays) WHERE idpays = p_idpays;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updatePays;
DELIMITER //
CREATE PROCEDURE updatePays(in p_idpays int(11), in p_nompays varchar(100))
BEGIN
	UPDATE pays
	SET nompays = p_nompays
	WHERE idpays = p_idpays;
	UPDATE pays SET nompays = UPPER(p_nompays) WHERE idpays = p_idpays;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deletePays;
DELIMITER //
CREATE PROCEDURE deletePays(in p_idpays int(11))
BEGIN
	DELETE FROM pays WHERE idpays = p_idpays;
END //
DELIMITER ;

# TABLE VILLES
DROP PROCEDURE IF EXISTS insertVille;
DELIMITER //
CREATE PROCEDURE insertVille(in v_nomville varchar(100), in v_idpays int(11))
BEGIN
	declare p_idville int(11);
	INSERT INTO villes VALUES (null, v_nomville, v_idpays);
	SELECT idville into p_idville
	FROM villes
	WHERE nomville = v_nomville;
	UPDATE villes SET nomville = CONCAT(UCASE(LEFT(v_nomville,1)), LCASE(SUBSTRING(v_nomville,2))) WHERE idville = p_idville;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateVille;
DELIMITER //
CREATE PROCEDURE updateVille(in v_idville int(11), in v_nomville varchar(100), in v_idpays int(11))
BEGIN
	UPDATE villes
	SET nomville = v_nomville, idpays = v_idpays
	WHERE idville = v_idville;
	UPDATE villes SET nomville = CONCAT(UCASE(LEFT(v_nomville,1)), LCASE(SUBSTRING(v_nomville,2))) WHERE idville = v_idville;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteVille;
DELIMITER //
CREATE PROCEDURE deleteVille(in v_idville int(11))
BEGIN
	DELETE FROM villes WHERE idville = v_idville;
END //
DELIMITER ;

# TABLE GARES
DROP PROCEDURE IF EXISTS insertGare;
DELIMITER //
CREATE PROCEDURE insertGare(in g_nomgare varchar(100), in g_type enum("petite", "moyenne", "grande", "très grande"), in g_adresse varchar(100), in g_idpays int(11), in g_idville int(11))
BEGIN
	declare p_idgare int(11);
	INSERT INTO gares VALUES (null, g_nomgare, g_type, g_adresse, g_idpays, g_idville);
	SELECT idgare into p_idgare
	FROM gares
	WHERE nomgare = g_nomgare;
	UPDATE gares SET nomgare = CONCAT(UCASE(LEFT(g_nomgare,1)), LCASE(SUBSTRING(g_nomgare,2))) WHERE idgare = p_idgare;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateGare;
DELIMITER //
CREATE PROCEDURE updateGare(in g_idgare int(11), in g_nomgare varchar(100), in g_type enum("petite", "moyenne", "grande","très grande"), in g_adresse varchar(100), in g_idpays int(11), in g_idville int(11))
BEGIN
	UPDATE gares
	SET nomgare = g_nomgare, type = g_type, adresse = g_adresse, idpays = g_idpays, idville = g_idville
	WHERE idgare = g_idgare;
	UPDATE gares SET nomgare = CONCAT(UCASE(LEFT(g_nomgare,1)), LCASE(SUBSTRING(g_nomgare,2))) WHERE idgare = g_idgare;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteGare;
DELIMITER //
CREATE PROCEDURE deleteGare(in g_idgare int(11))
BEGIN
	DELETE FROM gares WHERE idgare = g_idgare;
END //
DELIMITER ;

# TABLE TRAJETS
DROP PROCEDURE IF EXISTS insertTrajet;
DELIMITER //
CREATE PROCEDURE insertTrajet(in trj_numtrain int(11), in trj_idgare1 int(11), in trj_date_depart date, in trj_heure_depart time, in trj_idgare2 int(11), in trj_date_arrivee date, in trj_heure_arrivee time, in trj_duree time, in trj_prix decimal(6,2), trj_quai varchar(15))
BEGIN
	INSERT INTO trajets VALUES (null, trj_numtrain, trj_idgare1, trj_date_depart, trj_heure_depart, trj_idgare2, trj_date_arrivee, trj_heure_arrivee, trj_duree, trj_prix, trj_quai);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateTrajet;
DELIMITER //
CREATE PROCEDURE updateTrajet(in trj_idtrajet int(11), in trj_numtrain int(11), in trj_idgare1 int(11), in trj_date_depart date, in trj_heure_depart time, in trj_idgare2 int(11), in trj_date_arrivee date, in trj_heure_arrivee time, in trj_duree time, in trj_prix decimal(6,2), trj_quai varchar(15))
BEGIN
	UPDATE trajets
	SET numtrain = trj_numtrain, idgare1 = trj_idgare1, date_depart = trj_date_depart, heure_depart = trj_heure_depart, idgare2 = trj_idgare2, date_arrivee = trj_date_arrivee, heure_arrivee = trj_heure_arrivee, duree = trj_duree, prix = trj_prix, quai = trj_quai
	WHERE idtrajet = trj_idtrajet;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteTrajet;
DELIMITER //
CREATE PROCEDURE deleteTrajet(in trj_idtrajet int(11))
BEGIN
	DELETE FROM trajets WHERE idtrajet = trj_idtrajet;
END //
DELIMITER ;

# TABLE ENERGIES
DROP PROCEDURE IF EXISTS insertEnergie;
DELIMITER //
CREATE PROCEDURE insertEnergie(in e_numtrain int(11), in e_energie_consommee int(3))
BEGIN
	INSERT INTO energies VALUES (null, e_numtrain, e_energie_consommee);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateEnergie;
DELIMITER //
CREATE PROCEDURE updateEnergie(in e_idenergie int(11), in e_numtrain int(11), in e_energie_consommee int(3))
BEGIN
	UPDATE energies
	SET energie_consommee = e_energie_consommee
	WHERE idenergie = e_idenergie AND numtrain = e_numtrain;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteEnergie;
DELIMITER //
CREATE PROCEDURE deleteEnergie(in e_idenergie int(11), in e_numtrain int(11))
BEGIN
	DELETE FROM energies WHERE idenergie = e_idenergie AND numtrain = e_numtrain;
END //
DELIMITER ;

# TABLE RESERVATIONS
DROP PROCEDURE IF EXISTS insertReservation;
DELIMITER //
CREATE PROCEDURE insertReservation(in r_statut_reservation enum("En attente...", "Action requise", "Demande", "Pré-approuvé", "Acceptée", "Refusée", "Expirée", "Annulée"), in r_nbpersonne int(3), in r_idu int(11), in r_numtrain int(11))
BEGIN
	INSERT INTO reservations VALUES (null, r_statut_reservation, r_nbpersonne, r_idu, r_numtrain);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateReservation;
DELIMITER //
CREATE PROCEDURE updateReservation(in r_idreservation int(11), in r_statut_reservation enum("En attente...", "Action requise", "Demande", "Pré-approuvé", "Acceptée", "Refusée", "Expirée", "Annulée"), in r_nbpersonne int(3), in r_idu int(11), in r_numtrain int(11))
BEGIN
	UPDATE reservations
	SET statut_reservation = r_statut_reservation, nbpersonne = r_nbpersonne, idu = r_idu, numtrain = r_numtrain
	WHERE idreservation = r_idreservation;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteReservation;
DELIMITER //
CREATE PROCEDURE deleteReservation(in r_idreservation int(11))
BEGIN
	DELETE FROM reservations WHERE idreservation = r_idreservation;
END //
DELIMITER ;

# TABLE FACTURES
DROP PROCEDURE IF EXISTS insertFacture;
DELIMITER //
CREATE PROCEDURE insertFacture(in f_idu int(11), f_idreservation int(11))
BEGIN
	INSERT INTO factures VALUES (null, sysdate(), f_idu, f_idreservation);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateFacture;
DELIMITER //
CREATE PROCEDURE updateFacture(in f_idfacture int(11), in f_date_heure_facture datetime, in f_idu int(11), in f_idreservation int(11))
BEGIN
	UPDATE factures
	SET date_heure_facture = f_date_heure_facture, idu = f_idu, idreservation = f_idreservation
	WHERE facture = f_facture;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteFacture;
DELIMITER //
CREATE PROCEDURE deleteFacture(in f_idfacture int(11))
BEGIN
	DELETE FROM factures WHERE idfacture = f_idfacture;
END //
DELIMITER ;

# TABLE SERVICES
DROP PROCEDURE IF EXISTS insertService;
DELIMITER //
CREATE PROCEDURE insertService(in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11))
BEGIN
	INSERT INTO services VALUES (null, s_nomservice, s_typeservice, s_telservice, s_numtrain, s_idgare);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateService;
DELIMITER //
CREATE PROCEDURE updateService(in s_idservice int(11), in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11))
BEGIN
	UPDATE services
	SET nomservice = s_nomservice, typeservice = s_typeservice, telservice = s_telservice, numtrain = s_numtrain, idgare = s_idgare
	WHERE idservice = s_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteService;
DELIMITER //
CREATE PROCEDURE deleteService(in s_idservice int(11))
BEGIN
	DELETE FROM services WHERE idservice = s_idservice;
END //
DELIMITER ;

# TABLE LIVRES
DROP PROCEDURE IF EXISTS insertLivre;
DELIMITER //
CREATE PROCEDURE insertLivre(in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11), in l_reflivre int(11), l_nomlivre varchar(50), l_auteur varchar(50), l_edition varchar(50), l_nbpages int(3), l_resume varchar(255), l_disponible enum("true", "false"), l_date_sortie date)
BEGIN
	declare p_idservice int(11);
	INSERT INTO services VALUES (null, s_nomservice, s_typeservice, s_telservice, s_numtrain, s_idgare);
	UPDATE services SET nomservice = CONCAT(UCASE(LEFT(s_nomservice,1)), LCASE(SUBSTRING(s_nomservice,2)));
	SELECT idservice INTO p_idservice
	FROM services
	WHERE telservice = s_telservice;
	INSERT INTO livres VALUES (p_idservice, l_reflivre, l_nomlivre, l_auteur, l_edition, l_nbpages, l_resume, l_disponible, l_date_sortie); 
	UPDATE livres SET nomlivre = CONCAT(UCASE(LEFT(l_nomlivre,1)), LCASE(SUBSTRING(l_nomlivre,2))) WHERE idservice = p_idservice;
	UPDATE livres SET auteur = CONCAT(UCASE(LEFT(l_auteur,1)), LCASE(SUBSTRING(l_auteur,2))) WHERE idservice = p_idservice;
	UPDATE livres SET edition = CONCAT(UCASE(LEFT(l_edition,1)), LCASE(SUBSTRING(l_edition,2))) WHERE idservice = p_idservice;
	UPDATE livres SET resume = CONCAT(UCASE(LEFT(l_resume,1)), LCASE(SUBSTRING(l_resume,2))) WHERE idservice = p_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateLivre;
DELIMITER //
CREATE PROCEDURE updateLivre(in s_idservice int(11), in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11), in l_reflivre int(11), l_nomlivre varchar(50), l_auteur varchar(50), l_edition varchar(50), l_nbpages int(3), l_resume varchar(255), l_disponible enum("true", "false"), l_date_sortie date)
BEGIN
	UPDATE services
	SET nomservice = s_nomservice, typeservice = s_typeservice, telservice = s_telservice, numtrain = s_numtrain, idgare = s_idgare
	WHERE idservice = s_idservice;
	UPDATE services SET nomservice = CONCAT(UCASE(LEFT(s_nomservice,1)), LCASE(SUBSTRING(s_nomservice,2)));
	UPDATE livres
	SET reflivre = l_reflivre, nomlivre = l_nomlivre, auteur = l_auteur, edition = l_edition, nbpages = l_nbpages, resume = l_resume, disponible = l_disponible, date_sortie = l_date_sortie
	WHERE idservice = s_idservice;
	UPDATE livres SET nomlivre = CONCAT(UCASE(LEFT(l_nomlivre,1)), LCASE(SUBSTRING(l_nomlivre,2))) WHERE idservice = s_idservice;
	UPDATE livres SET auteur = CONCAT(UCASE(LEFT(l_auteur,1)), LCASE(SUBSTRING(l_auteur,2))) WHERE idservice = s_idservice;
	UPDATE livres SET edition = CONCAT(UCASE(LEFT(l_edition,1)), LCASE(SUBSTRING(l_edition,2))) WHERE idservice = s_idservice;
	UPDATE livres SET resume = CONCAT(UCASE(LEFT(l_resume,1)), LCASE(SUBSTRING(l_resume,2))) WHERE idservice = s_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteLivre;
DELIMITER //
CREATE PROCEDURE deleteLivre(in s_idservice int(11), in l_reflivre int(11))
BEGIN
	DELETE FROM services WHERE idservice = s_idservice;
	DELETE FROM livres WHERE reflivre = l_reflivre;
END //
DELIMITER ;

# TABLE FILMS
DROP PROCEDURE IF EXISTS insertFilm;
DELIMITER //
CREATE PROCEDURE insertFilm(in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11), in f_reffilm int(11), f_nomfilm varchar(50), f_realisateur varchar(50), f_duree time, f_resume varchar(255), f_disponible enum("true", "false"), f_date_sortie date)
BEGIN
	declare p_idservice int(11);
	INSERT INTO services VALUES (null, s_nomservice, s_typeservice, s_telservice, s_numtrain, s_idgare);
	UPDATE services SET nomservice = CONCAT(UCASE(LEFT(s_nomservice,1)), LCASE(SUBSTRING(s_nomservice,2)));
	SELECT idservice INTO p_idservice
	FROM services
	WHERE telservice = s_telservice;
	INSERT INTO films VALUES (p_idservice, f_reffilm, f_nomfilm, f_realisateur, f_duree, f_resume, f_disponible, f_date_sortie);
	UPDATE films SET nomfilm = CONCAT(UCASE(LEFT(f_nomfilm,1)), LCASE(SUBSTRING(f_nomfilm,2))) WHERE idservice = p_idservice;
	UPDATE films SET realisateur = CONCAT(UCASE(LEFT(f_realisateur,1)), LCASE(SUBSTRING(f_realisateur,2))) WHERE idservice = p_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateFilm;
DELIMITER //
CREATE PROCEDURE updateFilm(in s_idservice int(11), in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11), in f_reffilm int(11), f_nomfilm varchar(50), f_realisateur varchar(50), f_duree time, f_resume varchar(255), f_disponible enum("true", "false"), f_date_sortie date)
BEGIN
	UPDATE services
	SET nomservice = s_nomservice, typeservice = s_typeservice, telservice = s_telservice, numtrain = s_numtrain, idgare = s_idgare
	WHERE idservice = s_idservice;
	UPDATE services SET nomservice = CONCAT(UCASE(LEFT(s_nomservice,1)), LCASE(SUBSTRING(s_nomservice,2)));
	UPDATE films
	SET reffilm = f_reffilm, nomfilm = f_nomfilm, realisateur = f_realisateur, duree = f_duree, resume = f_resume, disponible = f_disponible, date_sortie = f_date_sortie
	WHERE idservice = s_idservice;
	UPDATE films SET nomfilm = CONCAT(UCASE(LEFT(f_nomfilm,1)), LCASE(SUBSTRING(f_nomfilm,2))) WHERE idservice = s_idservice;
	UPDATE films SET realisateur = CONCAT(UCASE(LEFT(f_realisateur,1)), LCASE(SUBSTRING(f_realisateur,2))) WHERE idservice = s_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteFilm;
DELIMITER //
CREATE PROCEDURE deleteFilm(in s_idservice int(11), in f_reffilm int(11))
BEGIN
	DELETE FROM services WHERE idservice = s_idservice;
	DELETE FROM films WHERE reffilm = f_reffilm;
END //
DELIMITER ;

# TABLE CONSOMMATIONS
DROP PROCEDURE IF EXISTS insertConsommation;
DELIMITER //
CREATE PROCEDURE insertConsommation(in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11), in c_refarticle int(11), c_article varchar(50), c_prix decimal(6,2), c_quantite int(3), c_description varchar(255), c_date_expiration date)
BEGIN
	declare p_idservice int(11);
	INSERT INTO services VALUES (null, s_nomservice, s_typeservice, s_telservice, s_numtrain, s_idgare);
	UPDATE services SET nomservice = CONCAT(UCASE(LEFT(s_nomservice,1)), LCASE(SUBSTRING(s_nomservice,2)));
	SELECT idservice INTO p_idservice
	FROM services
	WHERE telservice = s_telservice;
	INSERT INTO consommations VALUES (p_idservice, c_refarticle, c_article, c_prix, c_quantite, c_description, c_date_expiration, curdate());
	UPDATE consommations SET article = CONCAT(UCASE(LEFT(c_article,1)), LCASE(SUBSTRING(c_article,2))) WHERE idservice = p_idservice;
	UPDATE consommations SET description = CONCAT(UCASE(LEFT(c_description,1)), LCASE(SUBSTRING(c_description,2))) WHERE idservice = p_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateConsommation;
DELIMITER //
CREATE PROCEDURE updateConsommation(in s_idservice int(11), in s_nomservice varchar(50), in s_typeservice enum("Livre", "Film", "Consommations"), in s_telservice char(10), in s_numtrain int(11), in s_idgare int(11), in c_refarticle int(11), c_article varchar(50), c_prix decimal(6,2), c_quantite int(3), c_description varchar(255), c_date_expiration date)
BEGIN
	UPDATE services
	SET nomservice = s_nomservice, typeservice = s_typeservice, telservice = s_telservice, numtrain = s_numtrain, idgare = s_idgare
	WHERE idservice = s_idservice;
	UPDATE services SET nomservice = CONCAT(UCASE(LEFT(s_nomservice,1)), LCASE(SUBSTRING(s_nomservice,2)));
	UPDATE consommations
	SET refarticle = c_refarticle, article = c_article, prix = c_prix, quantite = c_quantite, description = c_description, date_expiration = c_date_expiration
	WHERE idservice = s_idservice;
	UPDATE consommations SET article = CONCAT(UCASE(LEFT(c_article,1)), LCASE(SUBSTRING(c_article,2))) WHERE idservice = s_idservice;
	UPDATE consommations SET description = CONCAT(UCASE(LEFT(c_description,1)), LCASE(SUBSTRING(c_description,2))) WHERE idservice = s_idservice;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteConsommation;
DELIMITER //
CREATE PROCEDURE deleteConsommation(in s_idservice int(11), in c_refarticle int(11))
BEGIN
	DELETE FROM services WHERE idservice = s_idservice;
	DELETE FROM consommations WHERE refarticle = c_refarticle;
END //
DELIMITER ;

# TABLE ENQUETES
DROP PROCEDURE IF EXISTS insertEnquete;
DELIMITER //
CREATE PROCEDURE insertEnquete(in en_nom_enquete varchar(100), in en_description varchar(255))
BEGIN
	declare p_idenquete int(11);
	INSERT INTO enquetes VALUES (null, en_nom_enquete, en_description, curdate());
	SELECT idenquete into p_idenquete
	FROM enquetes
	WHERE nom_enquete = en_nom_enquete;
	UPDATE enquetes SET nom_enquete = CONCAT(UCASE(LEFT(en_nom_enquete,1)), LCASE(SUBSTRING(en_nom_enquete,2))) WHERE idenquete = p_idenquete;
	UPDATE enquetes SET description = CONCAT(UCASE(LEFT(en_description,1)), LCASE(SUBSTRING(en_description,2))) WHERE idenquete = p_idenquete;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateEnquete;
DELIMITER //
CREATE PROCEDURE updateEnquete(in en_idenquete int(11), in en_nom_enquete varchar(100), in en_description varchar(255))
BEGIN
	UPDATE enquetes
	SET nom_enquete = en_nom_enquete, description = en_description
	WHERE idenquete = en_idenquete;
	UPDATE enquetes SET nom_enquete = CONCAT(UCASE(LEFT(en_nom_enquete,1)), LCASE(SUBSTRING(en_nom_enquete,2))) WHERE idenquete = en_idenquete;
	UPDATE enquetes SET description = CONCAT(UCASE(LEFT(en_description,1)), LCASE(SUBSTRING(en_description,2))) WHERE idenquete = en_idenquete;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteEnquete;
DELIMITER //
CREATE PROCEDURE deleteEnquete(in en_idenquete int(11))
BEGIN
	DELETE FROM enquetes WHERE idenquete = en_idenquete;
END //
DELIMITER ;

# TABLE QUESTIONS
DROP PROCEDURE IF EXISTS insertQuestion;
DELIMITER //
CREATE PROCEDURE insertQuestion(in q_enonce varchar(255))
BEGIN
	declare p_idquestion int(11);
	INSERT INTO questions VALUES (null, q_enonce);
	SELECT idquestion into p_idquestion
	FROM questions
	WHERE enonce = q_enonce;
	UPDATE questions SET enonce = CONCAT(UCASE(LEFT(q_enonce,1)), LCASE(SUBSTRING(q_enonce,2))) WHERE idquestion = p_idquestion;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updateQuestion;
DELIMITER //
CREATE PROCEDURE updateQuestion(in q_idquestion int(11), in q_enonce varchar(255))
BEGIN
	UPDATE questions
	SET enonce = q_enonce
	WHERE idquestion = q_idquestion;
	UPDATE questions SET enonce = CONCAT(UCASE(LEFT(q_enonce,1)), LCASE(SUBSTRING(q_enonce,2))) WHERE idquestion = q_idquestion;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deleteQuestion;
DELIMITER //
CREATE PROCEDURE deleteQuestion(in q_idquestion int(11))
BEGIN
	DELETE FROM questions WHERE idquestion = q_idquestion;
END //
DELIMITER ;

# TABLE PERSONNES
DROP PROCEDURE IF EXISTS insertPersonne;
DELIMITER //
CREATE PROCEDURE insertPersonne(in p_sexe enum("Femme", "Homme", "Non préciser"), in p_nom varchar(30), in p_prenom varchar(30), in p_age enum("0-18", "19-35", "36-62", "63 ans et plus"), in p_datenaissance date, in p_email varchar(50), in p_tel char(10), in p_adresse varchar(100), in p_type enum("visiteur", "user", "client", "admin"))
BEGIN
	declare p_idpers int(11);
	INSERT INTO personnes VALUES (null, p_sexe, p_nom, p_prenom, p_age, p_datenaissance, p_email, p_tel, p_adresse, p_type, 0);
	SELECT idpers into p_idpers
	FROM personnes
	WHERE email = p_email AND tel = p_tel;
	UPDATE personnes SET nom = UPPER(p_nom) WHERE idpers = p_idpers;
	UPDATE personnes SET prenom = CONCAT(UCASE(LEFT(p_prenom,1)), LCASE(SUBSTRING(p_prenom,2))) WHERE idpers = p_idpers;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS updatePersonne;
DELIMITER //
CREATE PROCEDURE updatePersonne(in p_idpers int(11), in p_sexe enum("Femme", "Homme", "Non préciser"), in p_nom varchar(30), in p_prenom varchar(30), in p_age enum("0-18", "19-35", "36-32", "63 ans et plus"), in p_datenaissance date, in p_email varchar(50), in p_tel char(10), in p_adresse varchar(100), in p_type enum("visiteur", "user", "client", "admin"))
BEGIN
	UPDATE personnes
	SET sexe = p_sexe, nom = p_nom, prenom = p_prenom, age = p_age, datenaissance = p_datenaissance, email = p_email, tel = p_tel, adresse = p_adresse, type = p_type
	WHERE idpers = p_idpers;
	UPDATE personnes SET nom = UPPER(p_nom) WHERE idpers = p_idpers;
	UPDATE personnes SET prenom = CONCAT(UCASE(LEFT(p_prenom,1)), LCASE(SUBSTRING(p_prenom,2))) WHERE idpers = p_idpers;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS deletePersonne;
DELIMITER //
CREATE PROCEDURE deletePersonne(in p_idpers int(11))
BEGIN
	DELETE FROM personnes WHERE idpers = p_idpers;
END //
DELIMITER ;


/*** INSERTIONS ***/

# USERS
-- Pas d'insertion directement, car c'est une table mère (héritage)

# CLIENTS (4 insertions)
call insertClient("CHALIFOUF", "Thierry", "Thaverefull", "thierry.chalifouf@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "client", "1971-07-01", "0562486398", "54, rue des Dunes 33160 SAINT-MEDARD-EN-JALLES", "Avantage famille");
call insertClient("BLANCHARD", "Evrad", "Hingst", "evrad.blanchard@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "client", "1955-08-28", "0426232829", "16, boulevard Aristide Briand 06110 LE CANNET", "Avantage week-end");
call insertClient("LANDRY", "Marveille", "Defe1964", "marveille.landry@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "client", "1964-09-07", "0492203287", "2, boulevard de la Liberation 13015 MARSEILLE", "Avantage jeune 10-30 ans");
call insertClient("BEAUPRE", "Jacqueline", "Dinen1955", "jacqueline.beaufre@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "client", "1955-07-25", "0530722090", "73, rue Sadi Carnot 32000 AUCH", "Avantage senior 60 ans et plus");

# ADMINS (3 insertions)
call insertAdmin("BRUAIRE", "Tom", "tombruaire", "tom.bruaire@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "admin", 76036920, "admin");
call insertAdmin("DESERT", "Anais", "anaisdesert", "anais.desert@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "admin", 95001184, "modo");
call insertAdmin("TAPI-DIMO", "Winnie", "winnietapidimo", "winnie.tapi-dimo@gmail.com", "107d348bff437c999a9ff192adcb78cb03b8ddc6", "admin", 28606421, "modo");

# COMMENTAIRES (3 insertions)
call insertCommentaire("VOYOLO est un exploit !", 1);
call insertCommentaire("J'adore voyager en VOYOLO !", 2);
call insertCommentaire("Très bon service, je recommande !", 3);

# TRAINS (5 insertions)
call insertTrain("IRIS Express", 20);
call insertTrain("Oiseau Bleu", 10);
call insertTrain("Golden Arrow", 5);
call insertTrain("Orien-Express", 15);
call insertTrain("Lézard Rouge", 10);

# PAYS (27 insertions)
call insertPays("FRANCE");
call insertPays("BELGIQUE");
call insertPays("ALLEMAGNE");
call insertPays("AUTRICHE");
call insertPays("BULGARIE");
call insertPays("CHYPRE");
call insertPays("CROATIE");
call insertPays("DANEMARK");
call insertPays("ESPAGNE");
call insertPays("ESTONIE");
call insertPays("FINLANDE");
call insertPays("GRÈCE");
call insertPays("HONGRIE");
call insertPays("IRLANDE");
call insertPays("ITALIE");
call insertPays("LETTONIE");
call insertPays("LITUANIE");
call insertPays("LUXEMBOURG");
call insertPays("MALTE");
call insertPays("PAYS-BAS");
call insertPays("POLOGNE");
call insertPays("PORTUGAL");
call insertPays("TCHÉQUE");
call insertPays("ROUMANIE");
call insertPays("SLOVAQUIE");
call insertPays("SLOVÉNIE");
call insertPays("SUÈDE");

# VILLES (81 insertions)
-- FRANCE
call insertVille("Paris", 1);
call insertVille("Lyon", 1);
call insertVille("Marseille", 1);

-- BELGIQUE
call insertVille("Bruges", 2);
call insertVille("Bruxelles", 2);
call insertVille("Audembourg", 2);

-- ALLEMAGNE
call insertVille("Berlin", 3);
call insertVille("Hambourg", 3);
call insertVille("Munich", 3);

-- AUTRICHE
call insertVille("Vienne", 4);
call insertVille("Innsbruck", 4);
call insertVille("Salzbourg", 4);

-- BULGARIE
call insertVille("Sofia", 5);
call insertVille("Plovdiv", 5);
call insertVille("Varna", 5);

-- CHYPRE
call insertVille("Nicosie", 6);
call insertVille("Limassol", 6);
call insertVille("Larnaca", 6);

-- CROATIE
call insertVille("Dubrovnik", 7);
call insertVille("Split", 7);
call insertVille("Zagreb", 7);

-- DANEMARK
call insertVille("Copenhague", 8);
call insertVille("Aarthus", 8);
call insertVille("Odense", 8);

-- ESPAGNE
call insertVille("Barcelone", 9);
call insertVille("Madrid", 9);
call insertVille("Séville", 9);

-- ESTONIE
call insertVille("Tallinn", 10);
call insertVille("Tartu", 10);
call insertVille("Narva", 10);

-- FINLANDE
call insertVille("Helsinki", 11);
call insertVille("Turku", 11);
call insertVille("Tampere", 11);

-- GRÈCE
call insertVille("Athènes", 12);
call insertVille("Thessalonique", 12);
call insertVille("Oia", 12);

-- HONGRIE
call insertVille("Budapest", 13);
call insertVille("Tokaj", 13);
call insertVille("Kalosca", 13);

-- IRLANDE
call insertVille("Dublin", 14);
call insertVille("Cork", 14);
call insertVille("Galway", 14);

-- ITALIE
call insertVille("Rome", 15);
call insertVille("Venise", 15);
call insertVille("Naples", 15);

-- LETTONIE
call insertVille("Riga", 16);
call insertVille("Jurmala", 16);
call insertVille("Siguida", 16);

-- LITUANIE
call insertVille("Vilnius", 17);
call insertVille("Kaunas", 17);
call insertVille("Utena", 17);

-- LUXEMBOURG
call insertVille("Luxembourg", 18);
call insertVille("Esch-sur-Alzette", 18);
call insertVille("Dudelange", 18);

-- MALTE
call insertVille("La Valette", 19);
call insertVille("L-Imdina", 19);
call insertVille("Tas-Sliema", 19);

-- PAYS-BAS
call insertVille("Amsterdam", 20);
call insertVille("Rotterdam", 20);
call insertVille("Eindhoven", 20);

-- POLOGNE
call insertVille("Varsovie", 21);
call insertVille("Cracovie", 21);
call insertVille("Katowice", 21);

-- PORTUGAL
call insertVille("Lisbonne", 22);
call insertVille("Porto", 22);
call insertVille("Évora", 22);

-- TCHÉQUE
call insertVille("Prague", 23);
call insertVille("Karlovy Vary", 23);
call insertVille("Brno", 23);

-- ROUMANIE
call insertVille("Bucarest", 24);
call insertVille("Sibiu", 24);
call insertVille("Drobeta-Turnu Severin", 24);

-- SLOVAQUIE
call insertVille("Bratislava", 25);
call insertVille("Bardejov", 25);
call insertVille("Nitra", 25);

-- SLOVÉNIE
call insertVille("Ljubljana", 26);
call insertVille("Piran", 26);
call insertVille("Ptuj", 26);

-- SUÈDE
call insertVille("Göteborg", 27);
call insertVille("Malmö", 27);
call insertVille("Stockholm", 27);

# GARES (XX insertions)
-- FRANCE
call insertGare("Montparnasse", "grande", "Place Raoult-Dautry 75015 Paris", 1, 1);
call insertGare("Lyon", "grande", "5 place Charles-Béraudier", 1, 2);
call insertGare("Marseille", "grande", "13001 Marseille", 1, 3);

-- BELGIQUE
call insertGare("Mons", "grande", "Pl. Léopold, 7000 Mons, Belgique", 2, 4);
call insertGare("Soignies", "moyenne", "Rue de la Station 96, 7060 Soignies, Belgique", 2, 5);
call insertGare("Ath", "petite", "Rue de la Station, 7800 Ath, Belgique", 2, 6);

-- ALLEMAGNE
call insertGare("Neuenburg", "petite", "79395 Neuenburg am Rhein, Allemagne", 3, 7);
call insertGare("Muellheim", "moyenne", "79379 Müllheim, Allemagne", 3, 8);
call insertGare("Berg", "petite", "76768 Berg, Allemagne", 3, 9);

-- AUTRICHE
call insertGare("Vienna Central T", "très grande", "Am Hbf 1, 1100 Wien, Autriche", 4, 10);
call insertGare("Salzburg", "grande", "5020 Salzbourg, Autriche", 4, 11);
call insertGare("Pratersten", "moyenne", "1020 Vienna, Autriche", 4, 12);

-- BULGARIE
call insertGare("Bansko", "petite", "2770 Bansko, Bulgarie", 5, 13);
call insertGare("Varna", "moyenne", "9000 Tsentralna Zhp Gara, Varna, Bulgarie", 5, 14);
call insertGare("Sofia Central Station", "grande", "1202 Orlandovtsi, Sofia, Bulgarie", 5, 15);

-- CHYPRE
call insertGare("Λευκωσία", "petite", "Nicosia, Chypre", 6, 16);
call insertGare("OSYPA", "moyenne", "Paphos, Chypre", 6, 17);
call insertGare("Karavella", "grande", "LIUSB, Chypre", 6, 18);

-- CROATIE
call insertGare("Zagreb", "grande", "Trj Kralja Tomislava 12, 10000, Zagreb, Croatie", 7, 19);
call insertGare("Split", "petite", "21000, Split, Croatie", 7, 20);
call insertGare("Dubrovnik", "très grande", "23000, Croatie", 7, 21);

-- DANEMARK
call insertGare("Copenhague", "très grande", "Bernstorffsgade, 1651 København, Danemark", 8, 22);
call insertGare("Fredericia", "moyenne", "Jernbanegade 2B, 7000 Fredericia, Danemark", 8, 23);
call insertGare("Noerreport St", "petite", " Nørre Voldgade 13, 1358 København K, Danemark", 8, 24);

-- ESPAGNE
call insertGare("Barcelona-Sants", "très grande", "Plaça dels Països Catalans, 1, 7, 08014 Barcelona, Espagne", 9, 25);
call insertGare("Portbou", "moyenne", "17497 Portbou, Gérone, Espagne", 9, 26);
call insertGare("Llançà", "petite", "17490 Llançà, Girona, Espagne", 9, 27);

-- ESTONIE
call insertGare("Tartu", "grande", "50409 Tartu, Estonie", 10, 28);
call insertGare("Narva", "petite", "Vaksali 22, 20308 Narva, Estonie", 10, 29);
call insertGare("Keila", "petite", "Keila, 76605 Harju Country, Estonie", 10, 30);

-- FINLANDE
call insertGare("Helsinki", "très grande", "Kaivokatu 1, 00100 Helsinki, Finlande", 11, 31);
call insertGare("Tampere", "grande", "Rautatienkatu 25, 33100 Tampere, Finlande", 11, 32);
call insertGare("Tornio", "petite", "95420 Tornio, Finlande", 11, 33);

-- GRÈCE
call insertGare("Athens", "grande", "Domokou Avenue, Colone; Athènes; Grèce", 12, 34);
call insertGare("Aéroport international d’Athènes", "petite", "Spata Loutsa 190 04, Grèce", 12, 35);
call insertGare("Neratziotissa", "moyenne", "Maroússi, Athènes; Grèce", 12, 36);

-- HONGRIE
call insertGare("Budapest", "grande", "Budapest, Kerepesi ùt 2-4, 1087 Hongrie", 13, 37);
call insertGare("Györ", "moyenne", "Györ, 9021 Hongrie", 13, 38);
call insertGare("Háros", "petite", "Budapest, 1222 Hongrie", 13, 39);

-- IRLANDE
call insertGare("Connolly", "grande", "1 Amiens St, North Dock, Dublin, Irlande", 14, 40);
call insertGare("Heuston", "très grande", "Heuston Station Saint John's Road West, Dublin, Irlande", 14, 41);
call insertGare("Pearse", "grande", "Dublin, Irlande", 14, 42);

-- ITALIE
call insertGare("Rome-Termini", "très grande", "Via Giovanni Giolitti, 40, 00185 Rome, RM, Italie", 15, 43);
call insertGare("Roma Trastevere", "grande", "00152 Rome, Metropolitan City of Rome, Italie", 15, 44);
call insertGare("Roma Prenestina", "petite", "00177 Rome, Italie", 15, 45);

-- LETTONIE
call insertGare("Rīga-Pasažieru", "très grande", "Stacijas laukums 2, Centra rajons, Rīga, LV-1050, Lettonie", 16, 46);
call insertGare("Carnikava", "moyenne", "Carnikava, Carnikavas pagasti, LV-2163, Lettonie", 16, 47); 
call insertGare("Sloka", "petite", "Jurmala, LV-2011, Lettonie", 16, 48); 

-- LITUANIE
call insertGare("Vilnius", "grande", "Vilnius, 02100 Municipalité de Vilnius-ville, Lituanie", 17, 49);
call insertGare("Kaunas", "moyenne", "Kaunas, 44362 Kaunas City Munipality, Lituanie", 17, 50);
call insertGare("Klaipèda", "moyenne", "Klapèdia, 92228 Klaipeda City Munipality, Lituanie", 17, 51);

-- LUXEMBOURG
call insertGare("Luxembourg", "très grande", "11 Pl. de la Gare, 1616 Luxembourg", 18, 52);
call insertGare("Gare Centrale routière", "moyenne", "1616 Luxembourg", 18, 53);
call insertGare("Gare de Luxembourg- CFL", "moyenne", "Pl. de la Gare, 1616 Luxembourg", 18, 54);

-- MALTE
 call insertGare("Valletta A1", "grande", "Vjal Nelson, Il-Belt Valletta, Malte", 19, 55);
 call insertGare("Ponsonby", "moyenne", "Il-Gżira, Malte", 19, 56);
 call insertGare("Vapur", "petite", "Għajnsielem, Malte", 19, 57);

-- PAYS-BAS
call insertGare("Maastricht", "petite", "Stationsplein 29, 6221 BT Maastricht, Pays-Bas", 20, 58);
call insertGare("Den Haag", "grande", "Kon. Julianaplein 10, 2595 AA Den Haag, Pays-Bas", 20, 59);
call insertGare("Gare d'Amsterdam-Central", "grande", "Stationsplein, 1012 AB Amsterdam, Pays-Bas", 20, 60);

-- POLOGNE
call insertGare("Wrocław", "grande", "Piłsudskiego 105, 50-085 Wrocław, Pologne", 21, 61);
call insertGare("Varsovie", "moyenne", "al. Jerozolimskie, 02-305 Warszawa, Pologne", 21, 62);
call insertGare("Poznań", "grande", "Dworcowa 2, 61-801 Poznań, Pologne", 21, 63);

-- PORTUGAL
call insertGare("Lisbonne", "très grande", "Av. Dom João II, 1900-233 Lisboa, Portugal", 22, 64);
call insertGare("São Bento", "petite", "Praça de Almeida Garrett, 4000-069 Porto, Portugal", 22, 65);
call insertGare("Rossio", "grande", "R. 1º de Dezembro 125, 1249-970 Lisboa, Portugal", 22, 66);

-- TCHÉQUE
call insertGare("Prague", "très grande", "Wilsonova 300/8, 120 00 Vinohrady, Tchéquie", 23, 67);
call insertGare("Masarykovo", "moyenne", "2, Havlíčkova 1014, Nové Město, 110 00 Praha, Tchéquie", 23, 68);
call insertGare("Praha-Holesovice", "grande", "Partyzánská 1546/26, 170 00 Praha 7-Holešovice, Tchéquie", 23, 69);

-- ROUMANIE
call insertGare("North Railway Station", "grande", "Bucharest, Roumanie", 24, 70);
call insertGare("Bicaz", "petite", "DN15, Bicaz 615100, Roumanie", 24, 71);
call insertGare("Sibiu", "petite", "Piața 1 Decembrie 1918, Sibiu 550200, Roumanie", 24, 72);

-- SLOVAQUIE
call insertGare("Bratislava Hlavna", "grande", "Námestie Franza Liszta, 811 04 Staré Mesto, Slovaquie", 25, 73);
call insertGare("Košice", "très grande", "040 01 Košice, Slovaquie", 25, 74);
call insertGare("Poprad-Tatry", "moyenne", "Jiřího Wolkera, 058 01 Poprad, Slovaquie", 25, 75);

-- SLOVÉNIE
call insertGare("Ljubljana", "grande", "Trg Osvobodilne fronte 7, 1000 Ljubljana, Slovénie", 26, 76);
call insertGare("Lesce-Bled", "petite", "4248 Lesce, Slovénie", 26, 77);
call insertGare("Maribor", "moyenne", "Center, 2000 Maribor, Slovénie", 26, 78);

-- SUÈDE
call insertGare("Gothembourg", "moyenne", "Centralplan 15, 111 20 Stockholm, Suède", 27, 79);
call insertGare("Nyköping Centralstation", "petite", "611 30 Nyköping, Suède", 27, 80);
call insertGare("Uppsala Central Station", "petite", "753 21 Uppsala, Suède", 27, 81);


# TRAJETS
call insertTrajet(1, 1, "2023-01-15", "12:30:00", 2, "2023-01-15", "15:00:00", "02:30:00", 50.00, "Voie 1");
call insertTrajet(2, 2, "2023-01-30", "10:00:00", 1, "2023-01-30", "12:30:00", "02:30:00", 50.00, "Voie 5");
call insertTrajet(3, 3, "2023-02-02", "09:05:00", 2, "2023-02-02", "11:40:00", "03:40:00", 69.99, "Voie 2");

# ENERGIES
call insertEnergie(1, 60);
call insertEnergie(2, 75);
call insertEnergie(3, 10);
call insertEnergie(4, 100);
call insertEnergie(5, 90);

# RESERVATIONS
call insertReservation("En attente...", 5, 1, 1);
call insertReservation("Acceptée", 2, 2, 2);
call insertReservation("Action requise", 3, 3, 3);
call insertReservation("Demande", 1, 4, 4);
call insertReservation("Pré-approuvé", 10, 5, 5);
call insertReservation("Annulée", 20, 6, 1);
call insertReservation("Expirée", 4, 7, 2);

# FACTURES
call insertFacture(1, 1);
call insertFacture(2, 2);
call insertFacture(3, 3);
call insertFacture(4, 4);
call insertFacture(5, 5);
call insertFacture(6, 6);
call insertFacture(7, 7);

# SERVICES (pas d'insertion dans cette table directement)

# LIVRES -> https://www.kobo.com/fr/fr
call insertLivre("Kobo", "Livre", "0000000001", 1, 1, 978222, "20000 lieues sous les mers", "Jules Verne", "Raanan", 512, "L'apparition d'une bête monstrueuse en 1866 dans plusieurs mers du globe défraie la chronique. L'animal, rapide, fusiforme et phosphorescent, est responsable de plusieurs naufrages, brisant le bois et l'acier des navires avec une force colossale.", "true", "1870-06-15");
call insertLivre("Kobo", "Livre", "0000000002", 2, 2, 978223, "After", "Anna Todd", "Simon & Schuster", 811, "À 18 ans, Theresa « Tessa » Young est une jeune étudiante ambitieuse, volontaire et réservée. Sa mère contrôle sa vie. Son petit ami Noah est le gendre idéal. ", "true", "2014-10-21");
call insertLivre("Kobo", "Livre", "0000000003", 3, 3, 978224, "La Bible", "Ecole Biblique", "Pocket",2144, "Traduction collective des textes hébreu et grec sous la direction des frères dominicains à L'École biblique et archéologique française de Jérusalem qui lui a donné son nom.", "true", "2005-04-07");
call insertLivre("Kobo", "Livre", "0000000004", 4, 4, 978225, "Les Misérables tome 1 sur 2", "Victor Hugo", "Albert Lacroix & Cie", 955, "Autrefois du côté du mal, Jean Valjean est devenu un homme bon. Une lutte implacable l’oppose à l’inspecteur de police Javert.", "true", "1862-01-30");
call insertLivre("Kobo", "Livre", "0000000005", 5, 5, 978226, "Le petit prince", "Antoine de Saint-Exupéry", "Reynal & Hitchcock", 93, "J'ai ainsi vécu seul, sans personne avec qui parler véritablement, jusqu'à une panne dans le désert du Sahara, il y a six ans. ", "true", "1999-02-23");
call insertLivre("Kobo", "Livre", "0000000006", 3, 6, 978227, "Les Rougon-Macquart tome 13 : Germinal sur 20", "Emile Zola", "Gérard Gengembre", 100, "Une des grandes grèves du siècle dernier racontée par un journaliste de génie qui en a fait un réquisitoire, un formidable « J’accuse » contre le capital, le roman de la lutte des classes et de la misère ouvrière.", "true", "2008-01-04");
call insertLivre("Kobo", "Livre", "0000000007", 4, 7, 978228, "Le seigneur des anneaux La communauté de l'anneau", "J.R.R Tolkien", "Allen & Unwin", 704, "Le Tiers Age touche à sa fin, et la Terre du Milieu à son crépuscule.", "true", "2005-03-03");
call insertLivre("Kobo", "Livre", "0000000008", 1, 8, 978229, "I have a Dream", "Dr.Martin Luther King Jr", "Random House Children's Books", 40, "From Dr. Martin Luther King, Jr. s daughter, Dr. Bernice A.", "true", "2012-10-09");
-- (TEMPLATE INSERTION) call insertLivre("Kobo", "Livre", ""000000000N+1"," NumTrain, IdGare, RefLivre, "NomLivre", "AuteurLivre", "EditionLivre", NbPages, "RésuméLivre", "Disponible", "DateSortieLivre");
/* Valeurs à modifier : NumTrain, IdGare, RefLivre*, NomLivre, AuteurLivre, EditionLivre, NbPages, RésuméLivre, Disponible, DateSortieLivre */
-- * RefLivre = 8 chiffres aléatoires (UNIQUE)

# FILMS -> culture
call insertFilm("Netflix", "Film", "0000000009", 1, 9, 838200, "Charlie et la Chocolatrie", "Tim Burton", "01:55:00", "Issue d'une famille modeste, le jeune Charlie doit travailler pour aider les siens et doit économiser chaque penny durement gagné.", "true", "2005-07-13");
call insertFilm("Netflix", "Film", "0000000010", 2, 10, 838201, "Red Notice", "Rawson Marshall Thurber", "01:45:00", "Lorsqu'Interpol déclenche une Alerte Rouge, destinée à traquer et à capturer les criminels les plus recherchés au monde, le FBI fait appel à son meilleur profiler, John Hartley.", "true", "2021-11-05");
call insertFilm("Netflix", "Film", "0000000011", 3, 11, 838202, "Don't look up", "Adam McKay", "01:35:00", "Persuadés qu'une météorite s'apprête à détruire la Terre, deux astronomes peu crédibles aux yeux de la population se lancent dans une tournée médiatique pour prévenir l'humanité de la probable et inévitable fin du monde.", "true", "2021-12-10");
call insertFilm("Netflix", "Film", "0000000012", 4, 12, 838203, "Bird Box", "Susanne Bier", "02:30:00", "Alors qu'une mystérieuse force décime la population mondiale, une seule chose est sûre : ceux qui ont gardé les yeux ouverts ont perdu la vie.", "true", "2018-12-14");
call insertFilm("Netflix", "Film", "0000000013", 5, 13, 838204, "The Kissing Booth 2", "Vince Marcello", "01:32:45", "Elle Evans vient de passer l'été le plus romantique de sa vie avec son petit ami, Noah Flynn. Elle s'apprête à entamer sa dernière année de secondaire lorsque son copain s'envole pour l'université d'Harvard.", "true", "2020-07-24");
call insertFilm("Netflix", "Film", "0000000014", 4, 14, 838205, "Rampage", "Brad Peyton", "01:55:00", "Le primatologue Davis Okoye partage un lien inébranlable avec George, un gorille à dos argenté intelligent qui a été confié à ses soins depuis sa naissance.", "true", "2018-05-02");
call insertFilm("Netflix", "Film", "0000000015", 2, 15, 838206, "Les figures de l'ombre", "Theodore Melfi", "02:07:30", "Ce film narre le destin extraordinaire, au début des années 60, des trois scientifiques afro-américaines qui ont permis aux États-Unis de prendre la tête de la conquête spatiale, grâce à la mise en orbite de l'astronaute John Glenn.", "true", "2017-01-06");
call insertFilm("Netflix", "Film", "0000000016", 3, 16, 838207, "Harriet Be free or die", "Kasi Lemmons", "02:05:20", "Vers 1849, Araminta Minty Ross est esclave sur la plantation de la famille Brodess, dans le Maryland. Très croyante, elle a des visions depuis un violent choc à la tête lorsqu'elle était adolescente et pense que Dieu lui envoie des messages.", "true", "2019-11-01");

-- (TEMPLATE INSERTION) call insertFilm("Netflix", "Film", "00000000N+1", NumTrain, IdGare, RefFilm, "NomFilm", "RéalisateurFilm", "DuréeFilm", "RésuméFilm", "Disponible", "DateSortieFilm");
/* Valeurs à modifier : NumTrain, IdGare, RefFilm*, NomFilm, RéalisateurFilm, DuréeFilm, RésuméFilm, Disponible, DateSortieFilm */
-- * RefFilm = 8 chiffres aléatoires (UNIQUE)

# CONSOMMATIONS
call insertConsommation("Golden", "Consommations", "0000000017", 1, 17, 392000, "Coca-Cola", 1.46, 50, "Coca-Cola Original est une boisson au cola au goût unique et historique.", "2023-02-23");
call insertConsommation("Golden", "Consommations", "0000000018", 2, 18, 392001, "Fanta", 1.46, 70, "Fanta Orange est une boisson à l'orange au goût unique et historique.", "2025-02-23");
call insertConsommation("Golden", "Consommations", "0000000019", 3, 19, 392002, "Perrier", 1.46, 50, "Perrier Original est une boisson pétillante au goût unique et historique.", "2025-02-23");
call insertConsommation("Golden", "Consommations", "0000000020", 4, 20, 392003, "Tropico", 1.46, 70, "Tropico tropical est une boisson tropical au goût unique et historique.", "2026-02-23");
call insertConsommation("Golden", "Consommations", "0000000021", 5, 21, 392004, "Schweppes", 1.46, 50, "Schweppes Agrume est une boisson tonic au goût unique et historique.", "2026-02-23");
call insertConsommation("Golden", "Consommations", "0000000022", 3, 22, 392005, "Evian", 1.46, 100, "Evian est une boisson acquese au goût basic et raffraichissante.", "2027-02-23");
call insertConsommation("Golden", "Consommations", "0000000023", 2, 23, 392006, "Oasis", 1.46, 60, "Oasis tropical est une boisson aux fruits tropicaux au goût unique et historique.", "2023-02-23");
call insertConsommation("Golden", "Consommations", "0000000024", 4, 24, 392007, "Redbull", 1.46, 40, "Redbull donne des ailes.", "2027-02-23");

-- (TEMPLATE INSERTION) call insertConsommation("Golden", "Consommations", NumTrain, IdGare, RefArticle, "NomArticle", Pr.ix, Quantité, "DescriptionArticle", "DateExpiration");
/* Valeurs à modifier : NumTrain, IdGare, RefArticle*, NomArticle, Pr.ix**, Quantité, DescriptionArticle, DateExpiration */
-- * RefArticle = 8 chiffres aléatoires (UNIQUE)
-- ** Pr.ix = (Exemple) 4.99

# ENQUETES
call insertEnquete("Enquête 1", "Enquête de satisfaction sur les caractéristiques de VOYOLO");

-- (TEMPLATE INSERTION) call insertEnquete("NomEnquete", "DescriptionEnquete");

# QUESTIONS
call insertQuestion("Qu'aimez vous le plus dans notre service ?");
call insertQuestion("Quelles fonctionnalitées pourrions-nous rajouter pour l'améliorer ?");
call insertQuestion("À quelle fréquence reservez vous des trains ?");
call insertQuestion("Comment nous avez vous connu ?");
call insertQuestion("Sur une échelle de 0 à 10, quelle est note attribuez-vous à nos service ?");
call insertQuestion("Sur une échelle de 0 à 10, quelle est la probabilité que vous recommandiez notre entreprise à un ami / à un collègue / à votre famile ?");
call insertQuestion("Quelles services est indispensable selon vous ?");
call insertQuestion("Toutes les informations dans le site sont-t-elle en accord avec la réalité ?");
call insertQuestion("Êtes-vous satisfait des réductions et offres porposés ?");
call insertQuestion("Êtes-vous satisfait du voyage effectué ?");
call insertQuestion("Quelle type de trajet préférez-vous réserver ?");
call insertQuestion("Votre avis sur le service nous intéresse");

-- (TEMPLATE INSERTION) call insertQuestion("EnonceQuestion");

# PERSONNES
call insertPersonne("Femme", "DESLAURIERS", "Aceline", "19-35", "1959-01-15", "aceline.deslauriers@gmail.com", "0131478633", "71, Place du Jeu de Paume 94800 VILLEJUIF", "visiteur");
call insertPersonne("Homme", "MULLER", "Pierre", "36-62", "1980-05-23", "muller.pierre@gmail.com", "0647878633", "75, Place Vosges 75002 PARIS", "visiteur");
call insertPersonne("Femme", "POULAIN", "Amèlie", "63 ans et plus", "1959-07-09", "poulain.amelie@gmail.com", "0781562873", "92, Rue du succés 92250 LA GARENNE-COLOMBES", "visiteur");
call insertPersonne("Homme", "COELHO", "Laurent", "19-35", "1990-03-01", "coelho.laurent@hotmail.fr", "0153228736", "93, Rue du binks 93400 SAINT-DENIS", "client");
call insertPersonne("Femme", "FLAK", "Alice", "0-18", "2010-04-11", "flak.alice@gmail.com", "0745789652", "95, Rue de la soif 95300 BEAUCHAMPS", "visiteur");
call insertPersonne("Homme", "MACRON", "Patrick", "36-62", "1975-03-20", "macron.patrick@gmail.com", "0976548907", "78, Rue lumière 78500 CHATOU", "client");
call insertPersonne("Femme", "ROCARD", "Carla", "19-35", "1999-01-15", "rocard.alice@gmail.com", "0956784367", "91, Place des champs 91200 CROISSY", "visiteur");

-- (TEMPLATE INSERTION) call insertPersonne("Sexe", "NOM", "Prénom", "Age", "DateNaissance", "Email", "Tel", "Adresse", "Type");
/* Valeurs à modifier : Sexe, NOM, Prénom, Age*, DateNaissance, Email, Tel**, Adresse, Type*** */
-- * Age = 0-18 / 19-35 / 36-62 / 63 ans et plus 
-- ** Tel = (FORMAT) XXXXXXXXXX
-- *** Type = visiteur / user / client / admin

# TABLE USERS - Gestion de la connexion de l'utilisateur
DROP PROCEDURE IF EXISTS gestconnexion;
DELIMITER //
CREATE PROCEDURE gestconnexion(uemail varchar(50), umdp varchar(255))
BEGIN
	if (SELECT mdp FROM users u WHERE u.email = uemail) = umdp
		then
			UPDATE users u
			SET u.nbConnexion = u.nbConnexion + 1,
			u.last_connexion = NOW()
			WHERE u.email = uemail;
	end if;
END //
DELIMITER ;

DROP TABLE IF EXISTS BDD;
CREATE TABLE IF NOT EXISTS BDD (
	nom_bdd varchar(60) not null,
	nb_tables int,
	nb_views int,
	nb_triggers int,
	nb_procedures int,
	nb_functions int,
	nb_enregistrements int,
	primary key (nom_bdd)
) ENGINE=InnoDB;

DROP PROCEDURE IF EXISTS statsbdd;
DELIMITER //
CREATE PROCEDURE statsbdd(nomBdd varchar(60))
BEGIN
	declare nbtable, nbview, nbtrigger, nbprocedure, nbfunction, nbenregistrement INT;

	SELECT COUNT(TABLE_NAME) INTO nbtable
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = nomBdd;

	SELECT COUNT(*) INTO nbview 
	FROM INFORMATION_SCHEMA.views
	WHERE TABLE_SCHEMA = nomBdd;

	SELECT COUNT(*) INTO nbtrigger
	FROM INFORMATION_SCHEMA.TRIGGERS
	WHERE TRIGGER_SCHEMA = nomBdd;

	SELECT COUNT(*) INTO nbprocedure
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_SCHEMA = nomBdd
	AND ROUTINE_TYPE = 'PROCEDURE';

	SELECT COUNT(*) INTO nbfunction
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_SCHEMA = nomBdd
	AND ROUTINE_TYPE = 'FUNCTION';

	SELECT ROUND((SUM(TABLE_ROWS)/2)/2) INTO nbenregistrement
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = nomBdd;

	INSERT INTO BDD values (nomBdd, nbtable, nbview, nbtrigger, nbprocedure, nbfunction, nbenregistrement);
END //
DELIMITER ;

call statsbdd("voyolo");

USE information_schema;

-- Nombre de tables total
SELECT COUNT(TABLE_NAME)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'voyolo';

-- Nombre d'enregistrements par tables
SELECT TABLE_NAME, SUM(TABLE_ROWS) 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'voyolo'
GROUP BY TABLE_NAME;

-- Nombre d'enregistrements totals
SELECT SUM(TABLE_ROWS) 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'voyolo';

-- Nombre d'enregistrements totals (hors tables histos)
SELECT ROUND((SUM(TABLE_ROWS)/2)/2)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'voyolo';

USE voyolo;

SELECT * FROM BDD;
