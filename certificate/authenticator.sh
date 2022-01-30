#!/bin/bash

echo 'Writing authorization record...'

cat <<EOF  > createrec.json
{
  "Comment": "Challenge for certbot",
  "Changes": [{
    "Action": "UPSERT",
    "ResourceRecordSet": {
      "Name": "_acme-challenge.$CERTBOT_DOMAIN",
      "Type": "TXT",
      "TTL": 300,
      "ResourceRecords": [{ "Value": "\"$CERTBOT_VALIDATION\""}]
  }}]
}
EOF

ID=$(aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE --change-batch file://createrec.json | jq ".ChangeInfo.Id")
aws route53 wait resource-record-sets-changed --id $ID
