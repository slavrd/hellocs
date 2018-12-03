#!/usr/bin/env bash
# Provision with the needed packages

# register the Microsoft key and the product repository
wget -P /tmp -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb

# install needed packages
sudo apt-get update
sudo apt-get install -y apt-transport-https dotnet-sdk-2.1 git

# clean up
sudo apt-get clean
rm /tmp/packages-microsoft-prod.deb

# download the project
git clone https://github.com/slavrd/hellocs.git
sudo chown -R vagrant hellocs/
