#!/bin/bash
clear
##Get current user name
user=$(whoami)
perm=$(sudo -v)
##Check if user has sudo permissions

source installer.sh

echo "$(tput bold) Package installation completed!$(tput sgr 0)"
read -p "Press any key to continue"
clear

##Find the adapter
net_adapter=$(ip addr show | awk '/inet.*scope global dynamic/{print $NF; exit}')
##We need to find someway to let the program return that instead of assigning it manually
mkdir ~/vpnserver-wireguard
touch server_ip
##Determine external IP address of server
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo $ip > server_ip
mkdir ~/vpnserver-wireguard/client/
sudo ./serversetup.sh $user $net_adapter

echo "Please read README to get database ready"

echo "You can configure clients by executing client_generate.sh"
