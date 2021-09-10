#!/usr/bin/env bash

# This script install the tools for a compiler lab.
# Author: Adriano J. Holanda
# Date: 2021-09-06

# Run this script as root or using sudo
# bash lnx.sh
# sudo bash lnx.sh

function install_vscode() {
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update && sudo apt install code
}

# Change according to distro [default=Ubuntu|Debian]
INSTALL="apt install"

TOOLS="apt-transport-https curl bison flex gcc make pandoc software-properties-common"

for t in ${TOOLS}; do
    [[ `which $t` == "" ]]  $t && ${INSTALL} $t
done

read -r -p "Do you want install VS Code? [y/N] " response
case "$response" in
    [yY][sS]|[yY]) 
        install_vscode
        ;;
    *)
    echo "Ok: no need for VS Code!"
        ;;
esac

exit 0