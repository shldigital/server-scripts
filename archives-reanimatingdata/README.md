# Archives-reanimatingdata
URL: <archives.reanimatingdata.co.uk>,

Server: Apache2,

Framework: Omeka_s,

Database: MariaDB,

Database name: `omeka_s`,

Files being served: `/srv/http/omeka_s/`,

Custom modules: `FaysModule`,

Backups are on lab workstation: `swebb@139.184.232.151:/home/data/sharonwebb/archives_reanimatingdata/`,


Reinstall backups by:

- follow [instructions](https://omeka.org/s/docs/user-manual/install/) to install `omeka_s` 
- add the omeka media and modules that are backed up in `omeka_s_current.tar.gz` to your `omeka_s` installation 
- Install `MariaDB`
- restore the sql database that is backed up in `archives_reanimatingdata_day_NN.sql.gz` using `mysql` command (tips on usage [here](https://simplebackups.com/blog/the-complete-mysqldump-guide-with-examples/#restore-a-mysql-database-on-a-remote-mysql-server)). `NN` corresponds to the day of the month that the backup was taken

Backup script's crontab configuration:
```
30 2 * * * /srv/http/omeka_s/backup-database.sh
```
