#!/bin/bash

IMPORT_CSV=true
EXPORT_HDFS=false

CSV_URL="https://raw.githubusercontent.com/caiuafranca/dados_curso/main/"
CSV_DIR="/workspace/curso_minsait.DE/input/curso_minsait/raw"
TABLES=("cidade" "estado" "filial" "parceiro" "cliente" "subcategoria" "categoria" "item_pedido" "produto") #"pedido")

DATE="$(date --date="-0 day" "+%Y%m%d")"
PARTICAO="$(date --date="-0 day" "+%Y%m%d")"

TARGET_DATABASE="aula_hive"
TARGET_STAGE_DATABASE="stg_aula_hive"
SERVER="prod"

TABELA_CLIENTE="TBL_CLIENTE"
#HDFS_DIR="/datalake/raw/categoria"
#TARGET_TABLE_EXTERNAL="categoria"
#TARGET_TABLE_GERENCIADA="tbl_categoria"
