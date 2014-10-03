#!/bin/bash

source ./test.conf

ORACLE_SID=$SID

SEQUENCE=(20327 77131 16973 19667 29000 27748 30931 22554 21004 31695 28509 14798 21633 4792 1241 22726 18385 24500 21954 5745 12434 14709 27144 17482 85771 26275 21952 29978 25415 1909 14476 9713 7516 32017 18376 31458 3192 27305 20345 2945 64656 11345 22006 31518 17289 24482 20052 22718 53906 23057 1427 733 31975 10508 13961 2790 20631 30682 28818 21614 8080 30512 95605 27700 8575 80850 12053 21210 19082 32624 19292 14176 31257 12796 28903 23908 19048 972 12785 11035 19662 14388 18177 6926 16074 19041 2259 3477 978 28981 7432 13844 28636 1254 16780 8184 11944 8790 25291 71905) 

#### requetes et mesure du temps
# point query
echo "***************************"
echo " Point_query non ensembliste"
echo "***************************"
time \
    for i in ${SEQUENCE[*]}; do
    a="
    select * from LA_TABLE_DU_TD where nss = ${i};
    "
    echo "$a"| sqlplus ${USER}/${PASS} > /dev/null ;
done



