#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

for table in "${TABLES[@]}"
do
    echo " "
    echo "Inicio criação de tabela "$table
    HDFS_DIR="/datalake/raw/$table"
    TARGET_TABLE_EXTERNAL="$table"
    TARGET_TABLE_GERENCIADA="tbl_$table"
    echo "target database        :"$TARGET_DATABASE
    echo "target stage database  :"$TARGET_STAGE_DATABASE
    echo "hdfs_dir               :"$HDFS_DIR
    echo "target table external  :"${TARGET_TABLE_EXTERNAL}
    echo "target table gerenciada:"${TARGET_TABLE_GERENCIADA}
    echo "participacao           :"${PARTICAO}
#    docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000 \
#    --hivevar TARGET_DATABASE="${TARGET_DATABASE}"\
#    --hivevar TARGET_STAGE_DATABASE="${TARGET_STAGE_DATABASE}"\
#    --hivevar HDFS_DIR="${HDFS_DIR}"\
#    --hivevar TARGET_TABLE_EXTERNAL="${TARGET_TABLE_EXTERNAL}"\
#    --hivevar TARGET_TABLE_GERENCIADA="${TARGET_TABLE_GERENCIADA}"\
#    --hivevar PARTICAO="${PARTICAO}"\
#    -f ../../hql/create_$table.hql 
done
