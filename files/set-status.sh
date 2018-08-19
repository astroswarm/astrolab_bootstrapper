#!/usr/bin/env bash

# Hack to pass our status to the Astroswarm API via CURL
/usr/bin/curl --request POST -H "Content-Type: application/vnd.api+json" --data '{"data":{"type":"astrolabs","attributes":{"serial-number":"'"$(/bin/cat /sys/class/net/eth0/address | /bin/sed s/\://g)"'","private-ip-address":"","tunnel-endpoint": "", "status": "'"$1"'"}}}' https://api.astroswarm.com/v1/astrolabs --silent
