#!/bin/bash

# Fetch release information
release=$(lsb_release -a 2>/dev/null)

# Check for 'jammy' and update the needrestart configuration if the file exists
if echo "$release" | grep -q -w "jammy"; then
  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf && codename="jammy"
    echo "needrestart configuration updated for jammy."
  else
    echo "needrestart.conf not found. Attempting to install needrestart."
    sudo apt-get update && sudo apt-get install -y needrestart
    if [ -f /etc/needrestart/needrestart.conf ]; then
      sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    else
      echo "Installation failed or needrestart.conf still not found."
      exit 1
    fi
  fi
elif echo "$release" | grep -q -w "focal"; then
  codename="focal"
elif echo "$release" | grep -q -w "bionic"; then
  codename="bionic"
elif echo "$release" | grep -q -w "xenial"; then
  codename="xenial"
else
  codename="jammy"
fi&&
  sudo apt update &&
  sudo apt install gnupg -y &&
  sudo apt install unzip -y &&
  sudo apt update &&
  wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb &&
  sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb &&
  rm -rf libssl1.1_1.1.1f-1ubuntu2_amd64.deb &&
  wget -qO - https://www.mongodb.org/static/pgp/server-7.0.asc | sudo apt-key add - &&
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $codename/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list &&
  sudo apt update &&
  sudo mkdir -p /data/db &&
  sudo apt install -y mongodb-org &&
  sudo systemctl enable mongod &&
  sudo service mongod start &&
  sudo touch /tmp/mongodb-27017.sock &&
  sudo chown -R mongodb:mongodb /var/lib/mongodb && 
  sudo chown mongodb:mongodb /tmp/mongodb-27017.sock &&
  sudo systemctl restart mongod &&
  sudo useradd -m blockgum &&
  cd /home/blockgum &&
  wget -q $(curl -s https://api.github.com/repos/blockgum/blockgum/releases/latest | grep "browser_download_url.*zip" | cut -d '"' -f 4) &&
  unzip bg_latest.zip &&
  sudo apt install nginx -y &&
  cp ./Tools/blockgum-nginx.conf /etc/nginx/conf.d/ &&
  cp ./Tools/status.json /etc/nginx/ &&
  sudo service nginx reload &&
  chmod +x bg_mongo_linux bg_wallet_linux bg_utils_linux startchains.sh &&
  cp ./Tools/blockgum.service /etc/systemd/system && systemctl daemon-reload && systemctl enable blockgum.service && systemctl start blockgum.service && ./bg_utils_linux
