#!/bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh
rm nodesource_setup.sh

sudo apt install nodejs -y
