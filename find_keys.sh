#!/bin/bash
#
# script to find all authorized_keys and authorized_keys2 on a unix server
# https://github.com/deralexxx/authorized_keys_finder
# 
# see https://github.com/deralexxx/authorized_keys_finder/LICENSE 

for user in $(cut -f6 -d ':' /etc/passwd |sort |uniq); do
    if [ -s "${user}/.ssh/authorized_keys" ]; then
        echo "### ${user}: "
        cat "${user}/.ssh/authorized_keys"
        echo ""
    fi
    if [ -s "${user}/.ssh/authorized_keys2" ]; then
        echo "### ${user}: "
        cat "${user}/.ssh/authorized_keys2"
        echo ""
    fi
done
