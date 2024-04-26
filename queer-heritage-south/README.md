# Queer-heritage-south
- URL: queerheritagesouth.co.uk,
- Server: Apache2,
- Framework: Omeka_s,
- Database: MariaDB,
- Database name: `omeka_s`,
- Database password: stored in `/root/.my.cnf` on the image
- Files being served: `/mnt/qhs_extra/`,
- Custom modules: `QhsModule`, #TODO: work out if there are other custom modules
- Backups are on lab workstation: `swebb@139.184.232.151:/home/data/sharonwebb/queer-heritage-south/`,


Reinstall backups by:

- follow [instructions](https://omeka.org/s/docs/user-manual/install/) to install `omeka_s` 
- add the omeka media and modules that are backed up in `qhs_extra_current.tar.gz` to your `omeka_s` installation 
- Install `MariaDB`
- restore the sql database that is backed up in `queer_heritage_south_day_NN.sql.gz` using `mysql` command (tips on usage [here](https://simplebackups.com/blog/the-complete-mysqldump-guide-with-examples/#restore-a-mysql-database-on-a-remote-mysql-server)). `NN` corresponds to the day of the month that the backup was taken

Backup script's crontab configuration:
```
30 2 * * * /mnt/qhs_extra/backup-database.sh
```
