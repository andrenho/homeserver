#!/bin/sh

echo 'Cleaning up authorization record...'

cat <<EOF  > createrec.json
{
  "Comment": "Challenge for certbot",
  "Changes": [{
    "Action": "DELETE",
    "ResourceRecordSet": {
      "Name": "_acme-challenge.$CERTBOT_DOMAIN",
      "Type": "TXT",
      "TTL": 300,
      "ResourceRecords": [{ "Value": "\"$CERTBOT_VALIDATION\""}]
  }}]
}
EOF

aws route53 change-resource-record-sets --hosted-zone-id Z1E6IX3AW27X6H --change-batch file://createrec.json

sleep 10
