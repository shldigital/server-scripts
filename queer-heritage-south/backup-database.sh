#!/bin/sh
mysqldump -u omeka_s -p$DBPASS --databases omeka_s | gzip > queer_heritage_south_day_"`date +"%d"`".sql.gz
rsync -avz ./queer_heritage_south_day_"`date +"%d"`".sql.gz swebb@139.184.232.151:/home/data/sharonwebb/queer-heritage-south/
rm ./queer_heritage_south_day_"`date +"%d"`".sql.gz
tar -cvzf qhs_extra_current.tar.gz /mnt/qhs_extra
rsync -avz qhs_extra_current.tar.gz swebb@139.184.232.151:/home/data/sharonwebb/queer-heritage-south/
