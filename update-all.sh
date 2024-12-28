#!/bin/bash

apt update -y
apt full-upgrade -y
apt autoremove -y --purge
apt clean -y
history -c

wget -O /usr/local/bin/update-unixdefaults https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/update-unixdefaults.sh && chmod +x /usr/local/bin/update-unixdefaults && /usr/local/bin/update-unixdefaults
