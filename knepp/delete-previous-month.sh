#!/bin/bash

function rollback()
{
        # Arguments:
        # $1: number of months to roll back
        # $2: month
        # $3: year
        # Returns year/month minus months of rollback
        local year=$3
        local month=$2
        local steps=$1

        if (($steps < 1)); then
                echo $year/$month
        else
                month=$(( month - 1 ))
                if (($month < 1)); then
                        month=12
                        year=$(( year - 1 ))
                fi
                rollback $(( $steps - 1 )) $month $year
        fi
}

year=$(date +%Y)
echo This year: $year
currentmonth=$(date +%m)
echo This month: $currentmonth

datefolder=$(rollback 1 $currentmonth $year)

airdelete="air/$datefolder"

if [ -d "/mnt/knepp_extra/recordings/$airdelete" ]
then
        echo deleting /mnt/knepp_extra/recordings/$airdelete
        rm -r /mnt/knepp_extra/recordings/$airdelete
else
        echo /mnt/knepp_extra/recordings/$airdelete does not exist, doing nothing
fi

waterdelete="water/$datefolder"

if [ -d "/mnt/knepp_extra/recordings/$waterdelete" ]
then
        echo deleting /mnt/knepp_extra/recordings/$waterdelete
        rm -r /mnt/knepp_extra/recordings/$waterdelete
else
        echo /mnt/knepp_extra/recordings/$waterdelete does not exist, doing nothing
fi
