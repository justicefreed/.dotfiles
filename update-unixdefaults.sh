#!/bin/bash

wget -O ~/.bash_profile https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/.bash_profile
wget -O ~/.nanorc https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/.nanorc
wget -O /usr/local/bin/update-all https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/update-all.sh && chmod +x /usr/local/bin/update-all

# update myself
wget -O /usr/local/bin/update-unixdefaults https://raw.githubusercontent.com/justicefreed/unixdefaults/refs/heads/main/update-unixdefaults.sh && chmod +x /usr/local/bin/update-unixdefaults
