#!/bin/bash

set -e

# Takes one argument which is the node name
if [ $# -ne 1 ]; then
	echo "Requires node name as argument"
	exit 1
fi

# Get node to check that it exists first
kubectl get nodes "${1}"
NODE_INSTANCE=$(kubectl get nodes "${1}" -o json | jq -r '.metadata.labels."aws.myob.com/instanceID"')

echo "Connecting to instance ${NODE_INSTANCE}"
aws ssm start-session --target "${NODE_INSTANCE}"
