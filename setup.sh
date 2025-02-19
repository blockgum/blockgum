#!/bin/bash

# Fetch the codename of the release
codename=$(lsb_release -cs)

# Update needrestart configuration based on codename
case $codename in
  bionic|focal|jammy|kinetic|lunar|noble)
    if [ -f /etc/needrestart/needrestart.conf ]; then
      sudo sed -i "/#\$nrconf{restart} = 'i';/s/.*/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
      echo "needrestart configuration updated for $codename."
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
    ;;
  *)
    echo "Unsupported distribution: $codename"
    exit 1
    ;;
esac

# General system update
sudo apt update
sudo apt install -y gnupg unzip

# Download and install specific OpenSSL package if necessary
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb

# Install MongoDB
sudo apt-get install -y curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg
echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg] https://repo.mongodb.org/apt/ubuntu $codename/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod

# Configure MongoDB and system permissions
sudo mkdir -p /data/db
sudo touch /tmp/mongodb-27017.sock
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown mongodb:mongodb /tmp/mongodb-27017.sock
sudo systemctl restart mongod

# Configure Blockgum application
sudo useradd -m blockgum
cd /home/blockgum
wget -q $(curl -s https://api.github.com/repos/blockgum/blockgum/releases/latest | grep "browser_download_url.*zip" | cut -d '"' -f 4)
unzip bg_latest.zip
sudo apt install -y nginx
cp ./Tools/blockgum-nginx.conf /etc/nginx/conf.d/
cp ./Tools/status.json /etc/nginx/
sudo service nginx reload

# Make executable and set up service
chmod +x bg_mongo_linux bg_wallet_linux bg_utils_linux startchains.sh
cp ./Tools/blockgum.service /etc/systemd/system
systemctl daemon-reload
systemctl enable blockgum.service
systemctl start blockgum.service
./bg_utils_linux
