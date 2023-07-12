#!/bin/bash
sudo su

SECONDS=0

# UBUNTU TEMEL GÜNCELLEMELER.
apt update -y
apt upgrade -y

# ZAMAN DİLİMİ AYARLAMASI
timedatectl set-timezone $TIMEZONE

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/swap-enable.sh
bash swap-enable.sh
rm swap-enable.sh


# UBUNTU TEMEL PAKET KURULUMLARI.
apt install curl -y
apt install git -y
apt install unzip -y

# PAKET KURULUMLARI.

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/nginx-install.sh
bash nginx-install.sh
rm nginx-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/php/php-install.sh
bash php-install.sh $PHP_VERSION
rm php-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/composer-install.sh
bash composer-install.sh $PHP_VERSION
rm composer-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/mysql-install.sh
bash mysql-install.sh
rm mysql-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/mongodb-install.sh
bash mongodb-install.sh
rm mongodb-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/phpmyadmin-install.sh
bash phpmyadmin-install.sh
rm phpmyadmin-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/nodejs-install.sh
bash nodejs-install.sh
rm nodejs-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/postfix-install.sh
bash postfix-install.sh
rm postfix-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/mailcatcher-install.sh
bash mailcatcher-install.sh
rm mailcatcher-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/supervisor-install.sh
bash supervisor-install.sh
rm supervisor-install.sh

wget https://raw.githubusercontent.com/netkod-bilisim/vagrant-shell-script/master/ubuntu/focal64/scripts/redis-install.sh
bash redis-install.sh
rm redis-install.sh

echo "127.0.0.1 local.$DIR.$DOMAIN" >> /etc/hosts

apt-get autoremove -y;
apt-get clean -y;

echo 'The installation has been completed successfully.' "$(($SECONDS / 60)) minutes and $(($SECONDS % 60)) seconds elapsed."

echo "Don't forget to add the following entry to the hosts file:"
echo "127.0.0.1 $DOMAIN";
