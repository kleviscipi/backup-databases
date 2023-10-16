#!/usr/bin/env bash

mysqldump --defaults-extra-file=$CNF_CONF_FILE -h $DB_HOST $DB > $BACKUP_DIR_PATH/$DATE/$FILE