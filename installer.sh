#!/bin/bash
# Installs the scripts into your bashrc/zshrc

SRC_FOLDER="${HOME}/.kube_aliases"
ALIAS_SCRIPTS_FOLDER="alias-scripts"
ALIASES_FILE="kube_aliases.sh"

# Download latest from github into source folder
rm -rf ${SRC_FOLDER}
git clone --depth 1 git@github.com:colinliddlemyob/kube-shell-scripts.git ${SRC_FOLDER}

# operate from the cloned directory
cd ${SRC_FOLDER}

add_to_shell_startup() {
	if [ ! -f $1 ]; then
		echo "Could not find shell startup script $1"
		echo "Please manually add ${SRC_FOLDER}/${ALIASES_FILE} into your shell startup script" 
		exit 1
	fi

	if grep "${ALIASES_FILE}" "${1}" >/dev/null 2>&1; then
		echo "Aliases already sourced in ${1}"
	else
		echo "Adding source to ${1}..."
		echo "source ${SRC_FOLDER}/${ALIASES_FILE}" >> $1
	fi
}

# Check the depencies
if ! ./check_dependencies.sh; then
	echo "Dependencies not satisfied"
	exit 1
fi

echo "export KUBE_SCRIPTS_SRC=${SRC_FOLDER}" >> "${ALIASES_FILE}"

# Check if this is bash or zsh and add/overwrite the source line
if [[ "zsh" =~ "zsh" ]]; then
	echo "Installing into .zshrc"
	add_to_shell_startup "${HOME}/.zshrc"
elif [[ "bash" =~ "bash" ]]; then
	echo "Installing into .bashrc"
	add_to_shell_startup "${HOME}/.bashrc"
else
	# Don't fail if we can't determine where to add this, just exit and let the user add it manually
	echo "Could not determine shell... please manually add ${SRC_FOLDER}/${ALIASES_FILE} into your shell startup script"
	exit 1
fi
