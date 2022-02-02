#!/bin/bash

CHANGEREC="$(mktemp)"

cat <<EOF  > $CHANGEREC
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

DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')
echo "++++++ Finding hosted zone for domain $DOMAIN..."
HOSTED_ZONE=$(aws route53 list-hosted-zones-by-name | jq --arg name "$DOMAIN." -r '.HostedZones | .[] | select(.Name=="\($name)") | .Id')
echo "++++++ Found hosted zone $HOSTED_ZONE."

echo "++++++ Creating authorization record '_acme-challenge.$CERTBOT_DOMAIN' with value '$CERTBOT_VALIDATION'..."
ID=$(aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE --change-batch file://$CHANGEREC | jq -r ".ChangeInfo.Id")

echo "++++++ Record '_acme-challenge.$CERTBOT_DOMAIN' with value '$CERTBOT_VALIDATION'... created with request id '$ID'. Now waiting for change..."

aws route53 wait resource-record-sets-changed --id "$ID"
echo "++++++ Change '$ID' completed."
