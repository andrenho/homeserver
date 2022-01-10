#!/bin/sh

set -xe

BACKUP_FILE=~/data-$(date -I).tar.bz2

tar --exclude plex -cvjf $BACKUP_FILE $DIR_ORIGIN
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/ --sse --storage-class ONEZONE_IA
rm -f $BACKUP_FILE
