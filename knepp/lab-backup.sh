#!/bin/bash

DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$DIR"

rsync -avz $DIR alicee@139.184.232.151:/home/data/alicee/
if [ "$?" -eq "0" ]
then
    $DIR/delete-previous-month.sh
    echo "Done"
else
    echo "Error while running rsync"
fi
