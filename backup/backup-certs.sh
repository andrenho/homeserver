#!/bin/sh

set -xe

BACKUP_FILE=~/certs-$(date -I).tar.bz2

tar -cvjf $BACKUP_FILE $CERTS_DIR
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/ --sse --storage-class ONEZONE_IA
rm -f $BACKUP_FILE
