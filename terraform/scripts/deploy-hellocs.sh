#!/usr/bin/env bash
# Script to deploy the hellocs application from a release in GitHub
# Takes one agrument - the GitHub version of the realease

# Downolad the application zip
VER=$1
wget -q -P /tmp https://github.com/slavrd/hellocs/releases/download/"$VER"/hellocs-ubuntu.16.04-x64.zip

[ -f /tmp/hellocs-ubuntu.16.04-x64.zip ] || {
  echo "hellocs-ubuntu.16.04-x64.zip was not downloaded."
  exit 1 
}

# Install unzip if missing
which unzip || {
  sudo apt-get update
  sudo apt-get install -y unzip
}

# Set up the application
sudo unzip /tmp/hellocs-ubuntu.16.04-x64.zip -d /opt
sudo chmod +x /opt/hellocs-ubuntu.16.04-x64/hellocs

# Clean up
sudo apt-get clean
rm /tmp/hellocs-ubuntu.16.04-x64.zip
