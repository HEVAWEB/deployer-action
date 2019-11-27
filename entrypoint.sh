#!/bin/bash
set -e

eval $(ssh-agent -s)
echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
mkdir -p $GITHUB_WORKSPACE/.ssh
echo $SSH_PRIVATE_KEY > $GITHUB_WORKSPACE/.ssh/id_rsa_deployer
chmod 600 $GITHUB_WORKSPACE/.ssh/id_rsa_deployer
echo "IdentityFile $GITHUB_WORKSPACE/.ssh/id_rsa_deployer\n" >> $GITHUB_WORKSPACE/.ssh/config

dep $1 $2

bash