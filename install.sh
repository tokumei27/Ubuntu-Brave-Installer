#!/usr/bin/env bash

printf "You must enter your password below. If you have never done this in a terminal before, don't be alarmed when no text appears. Despite it looking as if it isn't working, just type your password and hit enter. This is the default behavior of the sudo program.\n"

printf "Creating temporary directory \'/tmp/brave-install\'\n"
sudo mkdir  /tmp/brave-install
cd /tmp/brave-install

printf "Installing apt-transport-https and curl\n"
sudo apt --yes --force-yes install apt-transport-https curl

printf "Using curl to download the brave  GPG keyring\n"
curl -s 'https://brave-browser-apt-release.s3.brave.com/brave-core.asc' | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

printf "Syncing up with the Ubuntu repositories\n"
sudo apt --yes --force-yes update
printf "Installing brave!\n"
sudo apt --yes --force-yes install brave-browser

printf "Removing temporary directory located at \'/tmp/brave-install\'"
sudo rm  -rf /tmp/brave-install


