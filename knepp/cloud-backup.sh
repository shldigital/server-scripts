#!/bin/bash

DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$DIR"

RCLONE_REPO="box-alice"

LOGFILE=$DIR/rclone.log
exec 1>${LOGFILE}
exec 2>${LOGFILE}
rclone copy --verbose --transfers 10 --retries 5 --checksum $DIR/recordings $RCLONE_REPO:RESEARCH/DATA/AUDIO/KNEPP/recordings
