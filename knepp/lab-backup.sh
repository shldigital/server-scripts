#!/bin/bash
rsync -avz /mnt/knepp_extra alicee@139.184.232.151:/home/data/alicee/
if [ "$?" -eq "0" ]
then
    /mnt/knepp_extra/delete-previous-month.sh
    echo "Done"
else
    echo "Error while running rsync"
fi
