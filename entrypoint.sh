#!/bin/bash
set -e

eval $(ssh-agent -s)
echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
mkdir /root/.ssh
echo $SSH_PRIVATE_KEY > /root/.ssh/id_rsa_deployer
chmod 600 /root/.ssh/id_rsa_deployer
echo "IdentityFile ~/.ssh/id_rsa_deployer\n" >> ~/.ssh/config

dep $1 $2

bash