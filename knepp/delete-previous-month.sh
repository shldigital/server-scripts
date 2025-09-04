#!/bin/bash
# deletes month folder air/water from 5 months ago,
# designed to run from cron once a month

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
                datestring="$year/$month/1" # 'date' requires dom to be set, using '1'
                formatteddate=$(date -d "$datestring" +%Y/%m)
                echo $formatteddate
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
currentmonth=$(date +%-m)
echo This month: $currentmonth

datefolder=$(rollback 5 $currentmonth $year)
if [[ -z "$datefolder" ]]; then
        echo Invalid date folder \(empty string\), exiting with error
        exit 1
fi

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
