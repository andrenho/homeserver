#!/bin/bash

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

echo "Creating authorization record '_acme-challenge.$CERTBOT_DOMAIN' with value '$CERTBOT_VALIDATION'..."
ID=$(aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE --change-batch file://createrec.json | jq ".ChangeInfo.Id")

echo "Record '_acme-challenge.$CERTBOT_DOMAIN' with value '$CERTBOT_VALIDATION'... created with request id $ID. Now waiting for change..."

aws route53 wait resource-record-sets-changed --id $ID
echo "Change $ID completed."
