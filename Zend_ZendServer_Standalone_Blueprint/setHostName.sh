#!/bin/bash

# Use ENV_NAME if specified.

# set Hostname variable
HOST_NAME="ora-"$ENV_NAME"-oid-d1"

echo $HOST_NAME

# change VM hostname

hostname $HOST_NAME

# Add DNS entry for this host

# replace hostname in /etc/hosts
sed -i "s~$IP_ADDRESS.*~$IP_ADDRESS $HOST_NAME.$DOMAIN_NAME $HOST_NAME~g" /etc/hosts

# set HOST_NAME INCLUDING DOMAIN
HOST_NAME="$HOST_NAME"."$DOMAIN_NAME"

echo "Setting hostname to $HOST_NAME"

