#!/bin/bash
# check if file /etc/redhat-release exists
if [ ! -f /etc/redhat-release ]; then
    echo "This script is only for RHEL systems"
    exit 1
fi

# extract the version number from the file
version=$(cat /etc/redhat-release | sed -e 's/^[^0-9]*\([0-9]\).*/\1/')
echo "Version: $version"
