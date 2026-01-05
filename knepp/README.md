# KNEPP container scripts
These are the scripts used by the KNEPP project. This runs scripts that write audio streams (from `locus.creacast.com`) of site recordings to file, saving them as 1 minute mp3 files.

The `stop-*.sh` scripts work by being overwritten with the `PID` of the recording process after it has been started and captured by the `record-stream-*.sh` script using `$!` (`PID` of last background task).

An additional backup script copies all files nightly over to whichever rclone repo is defined in the `cloud-backup.sh` script. Additional helper files for running this as a service are included, as well as some scripts for managing local backups.

The crontab configuration for the project could be something like:

```
1 * * * * /mnt/knepp_extra/record-stream-air.sh
1 * * * * /mnt/knepp_extra/record-stream-water.sh
20 2 * * * /mnt/knepp_extra/knepp-backup.sh
```
