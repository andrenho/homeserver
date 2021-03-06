#!/bin/sh

set -xe

BACKUP_FILE=~/certs-$(date -I).tar.bz2

# compress data - don't kill the script if files were modified during compress

set +e
tar -cvjf $BACKUP_FILE $CERTS_DIR
exitcode=$?

if [ "$exitcode" != "1" ] && [ "$exitcode" != "0" ]; then
  exit $exitcode
fi
set -e

aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/ --sse --storage-class ONEZONE_IA
rm -f $BACKUP_FILE
