#!/bin/bash

#### requetes et mesure du temps
# point query
echo "***************************"
echo " Point_query ensembliste"
echo "***************************"

time sqlplus / @point_query.sql
# pour cacher l'affichage, utiliser :
# time sqlplus / @point_query.sql > /dev/null

