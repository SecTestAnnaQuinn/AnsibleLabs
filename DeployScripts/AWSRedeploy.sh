#!/bin/bash

#Obtain AMI Information
aws_host=$1
ssh_key=$3

#Make hosts and add initial server
chmod 600 $ssh_key
#Determine if argument was provided for ansible host name
if [ -z "$2" ]; then
    # Set a default value if no argument is provided
    ansible_host="testing"
else
    # Use the provided argument
    ansible_host="$2"
fi
echo -e "[$ansible_host]\n$aws_host ansible_ssh_private_key_file=$ssh_key" > /etc/ansible/hosts

cd /opt/aws_ansible
touch ansible.yml
