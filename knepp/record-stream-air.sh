#designed to run every hour to create hourly snapshots of an mp3 stream. eg at one minute past the hour with cron "1 * * * *"

URL=http://locus.creacast.com:9001/knepp_air.mp3

DIR=/home/u294757808/domains/peru-echidna-597998.hostingersite.com/public_html/knepp
REC=recordings/air

cd $DIR

$DIR/stop-air.sh

FORMAT=%H-%d-%m-%Y

YEAR=`date +'%Y'`
MONTH=`date +'%m'`
DAY=`date +'%d'`

mkdir -p $DIR/$REC/$YEAR/$MONTH/$DAY

nohup wget -q $URL -O $DIR/$REC/$YEAR/$MONTH/$DAY/knepp-`date +"$FORMAT"`.mp3 > air.log & 

PID=$!

echo "kill $!" > $DIR/stop-air.sh

chmod +x $DIR/stop-air.sh
