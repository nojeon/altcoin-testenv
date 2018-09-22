#!/bin/bash
# this script installs all desired packages in the new guest VM

# optimize apt sources to select best mirror
perl -pi -e 's@^\s*(deb(\-src)?)\s+http://us.archive.*?\s+@\1 mirror://mirrors.ubuntu.com/mirrors.txt @g' /etc/apt/sources.list

# update repositories
apt-get update

# msttcorefonts hack
echo ttf-mscorefonts-installer \
   msttcorefonts/accepted-mscorefonts-eula \
   select true \
   | sudo debconf-set-selections

# install the RNS windows wallet for illustration purposes 
apt-get -y install winetricks unzip
add-apt-repository -y ppa:ricotz/unstable
# update repositories
apt-get update && apt-get -y install wine-stable winetricks


# installer permissions
chmod 775 /usr/local/bin/runwallet