#!/usr/bin/env bash

# This script install the tools for a compiler lab.
# Author: Adriano J. Holanda
# Date: 2021-09-06

# Run this script as root or using sudo
# bash lnx.sh
# sudo bash lnx.sh

# Change according to distro [default=Ubuntu|Debian]
INSTALL="apt install"

TOOLS="bison flex gcc make pandoc"

for t in ${TOOLS}; do
    [[ `which $t` == "" ]]  $t && ${INSTALL} $t
done

exit 0