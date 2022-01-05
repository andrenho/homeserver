import boto3
import ipaddress
import os
import requests
import time

DNS_NAME = os.getenv('DNS_NAME')
PUBLIC_IP_WS = os.getenv('PUBLIC_IP_WS')
STORED_IP_PATH = '/tmp/public_ip.txt'

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

def update_ip_on_route_53(dns_name, public_ip):
    pass

if __name__ == '__main__':
    while True:
        public_ip = get_public_ip()
        print('Public IP is ' + public_ip)  # TODO - remove
        if public_ip != stored_public_ip():
            print('An IP change was identified! The new IP is ' + public_ip)
            save_public_ip(public_ip)
            update_ip_on_route_53(DNS_NAME, public_ip)
        time.sleep(10)  # TODO - change time
