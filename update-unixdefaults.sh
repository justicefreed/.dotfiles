#!/bin/bash

wget -O ~/.bash_profile https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/.bash_profile
wget -O ~/.nanorc https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/.nanorc

# update myself
wget -O /usr/bin/update-unixdefaults https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/update-unixdefaults.sh && chmod +x /usr/bin/update-unixdefaults
