#!/bin/sh

set -xe

BACKUP_FILE=~/data-$(date -I).tar.bz2

tar --exclude plex --exclude reader/cache -cvjf $BACKUP_FILE $DATA_DIR
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/ --sse --storage-class ONEZONE_IA
rm -f $BACKUP_FILE
