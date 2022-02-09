#!/bin/sh

set -xe

BACKUP_FILE=~/data-$(date -I).tar.bz2

# compress data - don't kill the script if files were modified during compress

set +e
tar --exclude plex --exclude reader/cache -cvjf $BACKUP_FILE $DATA_DIR
exitcode=$?

if [ "$exitcode" != "1" ] && [ "$exitcode" != "0" ]; then
  exit $exitcode
fi
set -e

aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/ --sse --storage-class ONEZONE_IA
rm -f $BACKUP_FILE
