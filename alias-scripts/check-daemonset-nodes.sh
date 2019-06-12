#!/bin/bash

# Checks what nodes a daemonset is and isn't deployed on
# Note, this assumes the namespace has been selected with kubens

if [[ $# -ne 1 ]]; then
	echo "Please provide the daemonset as the argument"
	exit 1
fi

$(kubectl describe ds $1 | awk '/^Selector:.*/{print "kubectl get pods -o wide --selector="$2}') | awk '/ip.*/{print $7}' > /tmp/temp-pods-nodes.txt
kubectl get nodes | awk '/ip.*/{print $1}' > /tmp/temp-nodes.txt

echo "Nodes that daemonset $1 is not deployed on:"
grep -vxFf /tmp/temp-pods-nodes.txt /tmp/temp-nodes.txt

echo ""

echo "Nodes that daemonset $1 is deployed on:"
cat /tmp/temp-pods-nodes.txt
