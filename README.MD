
# Script for custom backup of db

## Configuration
- ```chmod +x backup.sh```
- Create environment file for example ```.env.stage``` and set this variables:
    - ```DRIVER```
    - ```BACKUP_DIR_PATH```
    - ```DB_HOST```
    - ```DB_USERNAME```
    - ```DB_PASSWORD```


- Set command on crontab

    Example Cron Job
    ```SHELL
    0 0 * * * /backup.sh stage >> /logs/backup-db.log 2>&1
    ```

## TODO
- Driver mysql
    - [*] Export
    - [ ] Import
- Driver postgres
    - [ ] Export
    - [ ] Import