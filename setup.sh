#"you need a script!" - aicra
#!/usr/bin/env bash

function update_packages {
#upgrading kernel without updating grub dependencies
#sudo apt-mark hold grub2-common grub-common

sudo apt-get -y update && sudo apt-get -y upgrade
}

function expand_filesystem {
sudo raspi-config nonint do_expand_rootfs
}

function install_packages {
sudo apt-get install byobu htop
sudo apt-get install etckeeper
}

function boot_options{
sudo raspi-config nonint get_boot_cli
#b1 console code

}

#function international_options {
#change locale
#change time
#change wifi country - raspi-config nonint do_wifi_country %s

reboot

#function install_lamp{
#proposed 7.0 or 7.2 sudo apt-get install apache2 php7.0 libapache2-mod-php7.0
#OLD sudo apt-get install apache 2 php5 libapache2-mod-php5
#}

#function dns_mask{
#sudo apt-get install dnsmasq hostapd
#sudo cp -a /etc/dhcpcd.conf /etc/dhcpcd.conf.orig
#whoever wrote this was old school - nice

#append these lines to the end of /etc/dhcpcd.conf:
#interface wlan0
#    static ip_address=10.10.10.10/24
#sudo cp - a /etc/network/interfaces /etc/network/interfaces.orig
#allow-hotplug

#}

#Old Apache content for VirtualHost - not 2.4 but 2.2

#<Directory /var/www/html>
#                Options Indexes FollowSymLinks MultiViews
#                AllowOverride All
#                Order allow,deny
#                allow from all
#        </Directory>

#Set Hostname: raspi-config nonint do_hostname %s

function solar_main {
  raspbian_update_packages
  install_packages 
  expand_filesystem
  boot_options
#international_options
#install_lamp

}

  # Install Language Pack support for Spanish
  #sudo dpkg-reconfigure locales
  #https://wiki.debian.org/Locale

##########################
# Raspbian customization #
##########################

solar_main
