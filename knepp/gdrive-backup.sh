#!/bin/bash
LOGFILE=/home/data/alicee/knepp_extra/rclone.log
exec 1>${LOGFILE}
exec 2>${LOGFILE}
rclone copy --verbose --transfers 10 --retries 5 --checksum /home/data/alicee/knepp_extra/recordings gdrive-alicee:RESEARCH/DATA/AUDIO/KNEPP/recordings
