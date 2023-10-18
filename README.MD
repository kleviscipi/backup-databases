
# Script for custom backup of db

## Configuration
- ```chmod +x backup.sh```
- ```chmod +x import.sh```
- Create environment file for example ```.env.stage``` and set this variables:
    - ```DRIVER```
        - Example: ```mysql|postgres```
    - ```BACKUP_DIR_PATH```
        - Example:  ```/home/directory/backup/mysql```
    - ```HOST```
    - ```USERNAME```
    - ```PASSWORD```
    - ```IMPORT_FILE_PATH```
        - Example: ```/home/directory/db.sql```


- Set command on crontab

    Example Export with Cron Job ```crontab```
    ```SHELL
    0 0 * * * /backup.sh stage >> /logs/backup-db.log 2>&1
    ```
    
    Example Import
    ```SHELL
    ./import.sh stage >> /logs/import-db.log 2>&1

    #Set directly path import file
    ./import.sh stage '/home/directory/db.sql' >> /logs/import-db.log 2>&1
    ```

## TODO
- Driver mysql
    - [x] Export
    - [x] Import
- Driver postgres
    - [x] Export
    - [ ] Import