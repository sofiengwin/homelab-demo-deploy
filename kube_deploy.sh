#!/bin/bash

  # helm upgrade sofien-release ./sofien --reuse-values --set deployment.image=sofiencloud/sofien:RC-20240510-1717
RERLEASE_PATH="$HOME/Projects/Kubernetes/kube-demo"
helm upgrade $1-release "$RERLEASE_PATH/$1" --reuse-values --set deployment.image=sofiencloud/$1:latest


# ./kube_deploy.sh sofien