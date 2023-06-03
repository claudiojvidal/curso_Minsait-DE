#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

echo "Iniciando a criacao em ${DATE}"
cd ../../raw/
if [ "$IMPORT_CSV" = true ] ; then
   echo 'Iniciando importação de arquivos CSV'
   for table in "${TABLES[@]}"
   do
   	echo "tabela $table"
      mkdir $table
      chmod 777 $table
      cd $table
      curl -O $CSV_URL$table.csv
      cd ../
   done
fi

if [ "$EXPORT_HDFS" = true ] ; then
   echo 'Iniciando exportação de arquivos ao HDFS'
   
   for table in "${TABLES[@]}"
   do   
       echo "tabela $table"
       cd $table
       hdfs dfs -mkdir /datalake/raw/$table
       hdfs dfs -chmod 777 /datalake/raw/$table
       hdfs dfs -copyFromLocal $table.csv /datalake/raw/$table
       cd../
   done

fi

echo "Finalizando a criacao em ${DATE}"
