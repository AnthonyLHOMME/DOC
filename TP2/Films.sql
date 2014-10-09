/*   	Commandes de création de la base Films.
         SQL ANSI SAUF le type TEXT (remplacer par LONG pour ORACLE)   */

CREATE TABLE Internaute (email VARCHAR (40) NOT NULL, 
                         nom VARCHAR (30) NOT NULL ,
                         prenom VARCHAR (30) NOT NULL,
                         mot_de_passe VARCHAR (32) NOT NULL,
                         annee_naissance INTEGER,
                         PRIMARY KEY (email));
 
CREATE TABLE Pays (code    VARCHAR(4) NOT NULL,
                   nom  VARCHAR (30) DEFAULT 'Inconnu' NOT NULL,
                   langue VARCHAR (30) NOT NULL,
                   PRIMARY KEY (code));

CREATE TABLE Artiste  (id INTEGER NOT NULL,
                       nom VARCHAR (30) NOT NULL,
                       prenom VARCHAR (30) NOT NULL,
                       annee_naissance INTEGER,
                       PRIMARY KEY (id),
                       UNIQUE (nom, prenom));

CREATE TABLE Film  (id INTEGER NOT NULL,
                    titre    VARCHAR (50) NOT NULL,
                    annee    INTEGER NOT NULL,
                    id_realisateur  INTEGER,
                    genre VARCHAR(30) NOT NULL,
                    resume      LONG, /* LONG pour ORACLE */
                    code_pays    VARCHAR (4),
                    PRIMARY KEY (id),
                    FOREIGN KEY (id_realisateur) REFERENCES Artiste,
                    FOREIGN KEY (code_pays) REFERENCES Pays);

CREATE TABLE Notation (id_film INTEGER NOT NULL,
                       email  VARCHAR (40) NOT NULL,
                       note  INTEGER NOT NULL,
                       PRIMARY KEY (id_film, email),
                       FOREIGN KEY (id_film) REFERENCES Film,
                       FOREIGN KEY (email) REFERENCES Internaute);

CREATE TABLE Role (id_film INTEGER NOT NULL,
                   id_acteur INTEGER NOT NULL,
                   nom_role  VARCHAR(60), 
                   PRIMARY KEY (id_film, id_acteur),
                   FOREIGN KEY (id_film) REFERENCES Film,
                   FOREIGN KEY (id_acteur) REFERENCES Artiste);