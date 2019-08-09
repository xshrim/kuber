#!/bin/sh

SERVER=`oc whoami --show-server`
TOKEN=`oc whoami --show-token`
USER="system:admin"

URL="$SERVER/api/v1/nodes"

curl -k -H "Authorization: Bearer $TOKEN" -H "Impersonate-User: $USER" $URL

oc login -u system:admin
