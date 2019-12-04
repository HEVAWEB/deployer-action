#!/bin/bash
set -e

eval $(ssh-agent -s)
echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
mkdir -p $GITHUB_WORKSPACE/.ssh
echo "$SSH_PRIVATE_KEY" | tr -d '\r' > $GITHUB_WORKSPACE/.ssh/id_rsa_deployer
chmod 600 $GITHUB_WORKSPACE/.ssh/id_rsa_deployer
ssh-add $GITHUB_WORKSPACE/.ssh/id_rsa_deployer

dep $1 $2
