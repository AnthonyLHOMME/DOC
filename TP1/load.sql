-- SQL*Loader control file
-- Command line arguments must include userid, control (control file name) and data (data file name).
-- The data file name overloads the default file name given in the INFILE 

OPTIONS (ERRORS = 150)

load data 
infile "blabla"
into table XXXX append
fields terminated by "," 
(
	nss,
	nom,
	dist_10,
 dist_100,
 dist_1000,
 dist_10000,
 random
)

