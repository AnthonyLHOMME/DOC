SET AUTOCOMMIT OFF;
CREATE TABLE XXXX
(
 nss   INTEGER,
 nom   VARCHAR(100) NOT NULL, 
 dist_10   INTEGER,
 dist_100  INTEGER,
 dist_1000  INTEGER,
 dist_10000  INTEGER,
 random  FLOAT
);
COMMIT;
EXIT;

