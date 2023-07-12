#!/bin/bash

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/php/$1-install.sh
bash $1-install.sh
rm $1-install.sh
