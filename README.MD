
# Script for custom backup of db


## Configuration
- ```chmod +x run.sh```
- ```chmod +x mysql.sh```
- Create environment file for example ```.env.stage``` and set this variables:
    - ```DRIVER``` mysql|postgres
    - ```BACKUP_DIR_PATH```
- Set command on crontab

    Example Cron Job
    ```SHELL
    0 0 * * * /run.sh stage >> /logs/backup-db.log 2>&1
    ```

## TODO
- [*] Driver mysql
- [] Driver postgres 