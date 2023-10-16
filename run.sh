ENV=$1
#local,staging,production

DAY=$(date +"%d")
MONTH=$(date +"%m")
YEAR=$(date +"%Y")

DATE=$(date +"%Y%m%d")

echo "$DATE Started..... ON=$ENV"

source $(pwd)/.env.$ENV

set -e

CNF_CONF_FILE=$(pwd)/credentials/.m-$ENV.cnf

envsubst < $(pwd)/templates/.mysql.cnf.template > $CNF_CONF_FILE

DB=$DB_DATABASE

FILE="$DB.sql"

DAY_BACK=$((DAY-1));
MONTH_BACK=$((MONTH-1));
YEAR_BACK=$((YEAR-1))

if [ -d "$BACKUP_DIR_PATH/$YEAR$MONTH$DAY_BACK" ];then
   rm -r $BACKUP_DIR_PATH/$YEAR$MONTH$DAY_BACK;
fi

mkdir -p $BACKUP_DIR_PATH/$DATE

export BACKUP_DIR_PATH
export CNF_CONF_FILE
export DB_HOST
export DB
export DATE
export FILE

if [ $DRIVER == "mysql" ];then
./mysql.sh
fi

rm $CNF_CONF_FILE

echo "$DATE Ended..... ON=$ENV"