/*  Compléments de la base Films  */

/*  On ajoute un champ 'region' pour l'internaute */

ALTER TABLE Internaute ADD region VARCHAR(30);

/* Liste des régions       */

CREATE TABLE Region (nom    VARCHAR (30) NOT NULL,
                    PRIMARY KEY (nom));

INSERT INTO Region (nom) VALUES ('Ile-de-France');
INSERT INTO Region (nom) VALUES ('Nord-Pas-De-Calais');
INSERT INTO Region (nom) VALUES ('Picardie');
INSERT INTO Region (nom) VALUES ('Haute-Normandie');
INSERT INTO Region (nom) VALUES ('Basse-Normandie');
INSERT INTO Region (nom) VALUES ('Bretagne');
INSERT INTO Region (nom) VALUES ('Centre');
INSERT INTO Region (nom) VALUES ('Champagne-Ardennes');
INSERT INTO Region (nom) VALUES ('Lorraine');
INSERT INTO Region (nom) VALUES ('Alsace');
INSERT INTO Region (nom) VALUES ('Bourgogne');
INSERT INTO Region (nom) VALUES ('Franche-Comté');
INSERT INTO Region (nom) VALUES ('Pays-De-Loire');
INSERT INTO Region (nom) VALUES ('Poitou-Charentes');
INSERT INTO Region (nom) VALUES ('Aquitaine');
INSERT INTO Region (nom) VALUES ('Midi-Pyrénées');
INSERT INTO Region (nom) VALUES ('Limousin');
INSERT INTO Region (nom) VALUES ('Auvergne');
INSERT INTO Region (nom) VALUES ('Languedoc-Roussillon');
INSERT INTO Region (nom) VALUES ('Rhône-Alpes');
INSERT INTO Region (nom) VALUES ('PACA');
INSERT INTO Region (nom) VALUES ('Corse');
INSERT INTO Region (nom) VALUES ('DOM-TOM');
INSERT INTO Region (nom) VALUES ('Autre');

/* Liste des genres  */

CREATE TABLE Genre (code    VARCHAR (20) NOT NULL,
                    PRIMARY KEY (code));

INSERT INTO Genre (code) VALUES ('Histoire');
INSERT INTO Genre (code) VALUES ('Drame');
INSERT INTO Genre  (code) VALUES ('Suspense');
INSERT INTO Genre (code) VALUES ('Catastrophe');
INSERT INTO Genre  (code) VALUES ('Policier');
INSERT INTO Genre  (code) VALUES ('Thriller');
INSERT INTO Genre (code) VALUES ('Aventures');
INSERT INTO Genre (code) VALUES ('Science-fiction');
INSERT INTO Genre (code) VALUES ('Comédie');
INSERT INTO Genre (code) VALUES ('Comédie dramatique');
INSERT INTO Genre (code) VALUES ('Comédie sentimentale');
INSERT INTO Genre (code) VALUES ('Fantastique');
INSERT INTO Genre (code) VALUES ('Horreur');
INSERT INTO Genre (code) VALUES ('Action');
INSERT INTO Genre (code) VALUES ('Guerre');
INSERT INTO Genre (code) VALUES ('Dessin animé');
INSERT INTO Genre (code) VALUES ('Documentaire');
INSERT INTO Genre (code) VALUES ('Western');

/* Création d'une table pour gérer les sessions */

CREATE TABLE SessionWeb (id_session     VARCHAR (40) NOT NULL,
                       	email        VARCHAR(60) NOT NULL, 
                       nom          VARCHAR(30) NOT NULL,
                       prenom          VARCHAR(30) NOT NULL,
                       temps_limite   INT NOT NULL,
                       PRIMARY KEY (id_session),
                       FOREIGN KEY (email) REFERENCES Internaute
                     );

/*  Quelques pays */

INSERT INTO Pays (code, nom, langue) 
          VALUES ('FR', 'France', 'Français');
INSERT INTO Pays (code, nom, langue)  
          VALUES ('USA', 'Etats Unis', 'Anglais');
INSERT INTO Pays (code, nom, langue) 
          VALUES ('IT', 'Italie', 'Italien');
INSERT INTO Pays (code, nom, langue) 
          VALUES ('GB', 'Royaume-Uni', 'Anglais');
INSERT INTO Pays (code, nom, langue) 
          VALUES ('DE', 'Allemagne', 'Allemand');
INSERT INTO Pays (code, nom, langue) 
          VALUES ('JP', 'Japon', 'Japonais');


/* Messages */

CREATE TABLE Message (id INT NOT NULL,
                    id_pere INT DEFAULT 0,
                    id_film  INTEGER NOT NULL,
                    sujet  VARCHAR (30) NOT NULL,
                    texte LONG NOT NULL,
                    date_creation INT,
                    email_createur  VARCHAR(40) NOT NULL,   
                    PRIMARY KEY (id),
                    FOREIGN KEY (email_createur) REFERENCES Internaute);

