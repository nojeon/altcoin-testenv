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
apt-get -y install wine-development winetricks unzip

cat > /usr/local/bin/runwallet <<'EOF'
#!/bin/bash
winetricks settings win7
wget https://github.com/RenosCoin/RenosCoin/releases/download/v1.0.0.0/renoscoin-qt.zip
unzip renoscoin-qt.zip
wine renoscoin-qt.exe
EOF

# run the wallet after installation with the following command:
echo "run the wallet after installation with the following command: /usr/local/bin/runwallet"