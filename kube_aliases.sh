#!/bin/bash
# Import as source into your bashrc

export ETCDCTL_API=3

alias k='kubectl'
alias kc='kubectl config current-context'
alias kns='kubens'
alias update-kube-scripts='GIT_DIR=$(mktemp -d); git clone -n --depth 1 git@github.com:colinliddlemyob/kube-shell-scripts.git ${GIT_DIR}; git -C ${GIT_DIR} checkout HEAD installer.sh; ${GIT_DIR}/installer.sh; rm -rf ${GIT_DIR}'
alias check-ds-nodes='${KUBE_SCRIPTS_SRC}/alias-scripts/check-daemonset-nodes.sh'
alias check-node-resources='${KUBE_SCRIPTS_SRC}/alias-scripts/check-node-resources.sh'
