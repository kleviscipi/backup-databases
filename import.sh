#!/usr/bin/env bash

ENV=$1
FILE_PATH=$2
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

unset DATABASE
unset HOST
unset PORT
unset USERNAME

FILE=$IMPORT_FILE_PATH

if [ -n "$FILE_PATH" ];then
    FILE=$FILE_PATH
fi

if [ $DRIVER == "mysql" ];then
mysql --defaults-extra-file=$CNF_CONF_FILE $DATABASE < $FILE
elif [ $DRIVER == "postgres" ];then
    echo "Driver=$DRIVER";
    echo "In progress";
fi

rm $CNF_CONF_FILE

echo "Ending Import....."