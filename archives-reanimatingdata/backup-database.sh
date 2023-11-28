#!/bin/sh
mysqldump -u omeka_s -p$DBPASS --databases omeka_s | gzip > archives_reanimatingdata_day_"`date +"%d"`".sql.gz
rsync -avz ./archives_reanimatingdata_day_"`date +"%d"`".sql.gz swebb@139.184.232.151:/home/data/sharonwebb/archives_reanimatingdata/
rm ./archives_reanimatingdata_day_"`date +"%d"`".sql.gz
tar -cvzf omeka_s_current.tar.gz /srv/http/omeka_s
rsync -avz omeka_s_current.tar.gz swebb@139.184.232.151:/home/data/sharonwebb/archives_reanimatingdata/
