#!/bin/bash
dir=`ls ./*.gz`
for i in $dir
 do
     dbname=`echo $i |sed -e "s:./::g" |sed -e "s:.sql.gz::g"`
     bash ./impdb.sh $dbname 
     echo $dbname
done 
