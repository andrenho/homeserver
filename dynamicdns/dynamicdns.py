import boto3
import ipaddress
import tldextract
import os
import requests
import time

PUBLIC_IP_WS = os.getenv('PUBLIC_IP_WS')
RECORD_NAME = os.getenv('RECORD_NAME')
STORED_IP_PATH = '/tmp/public_ip.txt'

client = boto3.client('route53')

def get_public_ip():
    r = requests.get(PUBLIC_IP_WS)
    r.raise_for_status()
    ipaddress.ip_address(r.text)   # validate IP address
    return r.text

def stored_public_ip():
    try:
        with open(STORED_IP_PATH, 'r') as f:
            return f.read().rstrip()
    except FileNotFoundError:
        return None

def save_public_ip(public_ip):
    with open(STORED_IP_PATH, 'w') as f:
        return f.write(public_ip)

def find_zone_id(record_name):
    e = tldextract.extract(record_name)
    tld = '{}.{}.'.format(e.domain, e.suffix)
    r = client.list_hosted_zones_by_name(DNSName=tld)
    return r['HostedZones'][0]['Id']

def update_ip_on_route_53(zone_id, public_ip, record_name):
    client.change_resource_record_sets(HostedZoneId=zone_id, ChangeBatch={
        'Changes': [{
            'Action': 'UPSERT',
            'ResourceRecordSet': {
                'ResourceRecords': [{ 'Value': public_ip }],
                'Name': record_name,
                'Type': 'A',
                'TTL': 60
            }
        }],
        'Comment': 'Public IP updated to ' + public_ip
    })
    print('IP updated on AWS.')

if __name__ == '__main__':
    while True:
        public_ip = get_public_ip()
        if public_ip != stored_public_ip():
            print('An IP change was identified! The new IP is ' + public_ip)
            save_public_ip(public_ip)
            zone_id = find_zone_id(RECORD_NAME)
            print('Hosted zone: ' + zone_id)
            update_ip_on_route_53(zone_id, public_ip, RECORD_NAME)
            update_ip_on_route_53(zone_id, public_ip, '*.' + RECORD_NAME)
        time.sleep(10)
