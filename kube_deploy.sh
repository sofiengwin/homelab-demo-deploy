#!/bin/bash

  # helm upgrade sofien-release ./sofien --reuse-values --set deployment.image=sofiencloud/sofien:RC-20240510-1717
# RERLEASE_PATH="$HOME/Projects/Kubernetes/kube-demo"
# helm upgrade $1-release "$RERLEASE_PATH/$1" --reuse-values --set deployment.image=sofiencloud/$1:latest
# helm upgrade -f "$RERLEASE_PATH/$1" --force #--reuse-values --set deployment.image=sofiencloud/$1:latest


# ./kube_deploy.sh sofien

echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"
echo "Deploying $1"



export PASSPHRASE=$PASSPHRASE
export SSH_ASKPASS="./askpass.sh"
export SSH_ASKPASS_REQUIRE=force
export DISPLAY=:0

# Working version
# StrictHostKeyChecking=no SSH_ASKPASS_REQUIRE=force SSH_ASKPASS="./askpass.sh" ssh sofien@192.168.1.104

ssh -o StrictHostKeyChecking=no -o PasswordAuthentication=no sofien@192.168.1.104
