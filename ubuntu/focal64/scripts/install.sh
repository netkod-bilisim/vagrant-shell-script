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

echo "127.0.0.1 local.$DIR.$DOMAIN" >> /etc/hosts

apt-get autoremove -y;
apt-get clean -y;

echo 'The installation has been completed successfully.' "$(($SECONDS / 60)) minutes and $(($SECONDS % 60)) seconds elapsed."

echo "Don't forget to add the following entry to the hosts file:"
echo "127.0.0.1 $DOMAIN";
