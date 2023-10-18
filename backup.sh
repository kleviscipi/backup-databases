#!/usr/bin/env bash

ENV=$1
#local,staging,production

DAY=$(date +"%d")
MONTH=$(date +"%m")
YEAR=$(date +"%Y")

DATE=$(date +"%Y%m%d")

echo "$DATE Started..... ON=$ENV"

source $(pwd)/.env.$ENV

set -e

export PASSWORD
export DATABASE
export HOST
export PORT
export USERNAME

CNF_CONF_FILE=$(pwd)/credentials/.m-$ENV.cnf
envsubst < $(pwd)/templates/.$DRIVER.cnf.template > $CNF_CONF_FILE

unset PASSWORD
unset DATABASE
unset HOST
unset PORT
unset USERNAME

DB=$DATABASE

FILE="$DB.sql"

DAY_BACK=$((DAY-1));
MONTH_BACK=$((MONTH-1));
YEAR_BACK=$((YEAR-1))

if [ -d "$BACKUP_DIR_PATH/$YEAR$MONTH$DAY_BACK" ];then
   rm -r $BACKUP_DIR_PATH/$YEAR$MONTH$DAY_BACK;
fi

mkdir -p $BACKUP_DIR_PATH/$DATE

if [ $DRIVER == "mysql" ];then
mysqldump --defaults-extra-file=$CNF_CONF_FILE $DB > $BACKUP_DIR_PATH/$DATE/$FILE
elif [ $DRIVER == "postgres" ];then
pg_dump --file=$BACKUP_DIR_PATH/$DATE/$FILE --dbname=$CNF_CONF_FILE
fi

rm $CNF_CONF_FILE

echo "$DATE Ended..... ON=$ENV"