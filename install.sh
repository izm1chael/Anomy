#!/bin/bash

echo "Checking if tor is installed";
sleep 5; # Wait 5 seconds before cheking apt status

if [ $(dpkg-query -W -f='${Status}' tor 2>/dev/null | grep -c "ok installed") -eq 1 ]; # Check if tor is already installed
then
  echo "Tor is already installed" # Status Message
fi

if [ $(dpkg-query -W -f='${Status}' tor 2>/dev/null | grep -c "ok installed") -eq 0 ]; # Check if tor is not installed
then
  echo "Installing Tor"; # Status Message
  apt-get install tor -y; # Install tor
fi

echo "Checking Torsocks is installed";
sleep 5;  # Wait 5 seconds before cheking apt status

if [ $(dpkg-query -W -f='${Status}' torsocks 2>/dev/null | grep -c "ok installed") -eq 1 ]; # Check if  torsocks is already installed
then
  echo "Torsocks is already installed" # Status Message
fi

if [ $(dpkg-query -W -f='${Status}' torsocks 2>/dev/null | grep -c "ok installed") -eq 0 ]; # Check if torsocks is not installed
then
  echo "Installing Torsocks"; # Status message
  apt-get install torsocks -y; # Install torsocks
fi

cp anomy.sh /tmp/anomy #Copy anomy to tmp

mv /tmp/anomy /usr/local/bin # Move Anomy to  /usr/bin/local

chmod +x /usr/local/bin/anomy # Make Anomy executable
