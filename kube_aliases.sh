#!/bin/bash
# Import as source into your bashrc

export ETCDCTL_API=3

alias k='kubectl'
alias kc='kubectl config current-context'
alias kns='kubens'
alias update-kube-scripts='GIT_DIR=$(mktemp -d); git clone -n --depth 1 git@github.com:colinliddlemyob/kube-shell-scripts.git ${GIT_DIR}; git -C ${GIT_DIR} checkout HEAD installer.sh; ${GIT_DIR}/installer.sh; rm -rf ${GIT_DIR}'
alias check-ds-nodes='${KUBE_SCRIPTS_SRC}/alias-scripts/check-daemonset-nodes.sh'
alias check-node-resources='${KUBE_SCRIPTS_SRC}/alias-scripts/check-node-resources.sh'
alias connect-to-node='${KUBE_SCRIPTS_SRC}/alias-scripts/connect-to-node.sh'
alias kube-node-taints='kubectl get nodes -o go-template-file="${KUBE_SCRIPTS_SRC}/alias-scripts/node-taints.tmpl"'
alias eks-auth='aws eks --region ap-southeast-2 update-kubeconfig --name '
