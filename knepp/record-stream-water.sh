#designed to run every hour to create hourly snapshots of an mp3 stream. eg at one minute past the hour with cron "1 * * * *"

DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$DIR"

URL=http://locus.creacast.com:9001/knepp_water.mp3

REC=recordings/water

$DIR/stop-water.sh

FORMAT=%H-%d-%m-%Y

YEAR=`date +'%Y'`
MONTH=`date +'%m'`
DAY=`date +'%d'`

mkdir -p $DIR/$REC/$YEAR/$MONTH/$DAY

nohup wget -q $URL -O $DIR/$REC/$YEAR/$MONTH/$DAY/knepp-`date +"$FORMAT"`.mp3 & 

PID=$!

echo "kill $!" > $DIR/stop-water.sh

chmod +x $DIR/stop-water.sh
