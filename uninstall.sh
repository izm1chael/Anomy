#!/bin/bash

echo "Removing Anomy and its dependencies";
sleep 5; # Wait 5 seconds before cheking apt status
echo "Checking if Tor is installed"; # Status Message

if [ $(dpkg-query -W -f='${Status}' tor 2>/dev/null | grep -c "ok installed") -eq 1 ]; # Check if tor is already installed
then
  echo "Removing tor" # Status Message
  apt-get purge tor -y; # Remove tor from system
fi

if [ $(dpkg-query -W -f='${Status}' tor 2>/dev/null | grep -c "ok installed") -eq 0 ]; # Check if tor is not installed
then
  echo "Tor is not currently installed"; # Status Message
fi

echo "Checking if Torsocks is installed";
sleep 5;  # Wait 5 seconds before cheking apt status

if [ $(dpkg-query -W -f='${Status}' torsocks 2>/dev/null | grep -c "ok installed") -eq 1 ]; # Check if  torsocks is already installed
then
  echo "Removing Torsocks" # Status Message
  apt-get purge torsocks; # Remove torsocks from system
fi

if [ $(dpkg-query -W -f='${Status}' torsocks 2>/dev/null | grep -c "ok installed") -eq 0 ]; # Check if torsocks is not installed
then
  echo "Torsocks is not currently installed"; # Status message
fi

rm /usr/local/bin/anomy
