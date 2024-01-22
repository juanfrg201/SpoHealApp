#!/bin/bash
echo "Instalando Rails y sus dependencias..."

# Instalación de herramientas y dependencias necesarias para Rails
sudo apt-get update
sudo apt-get install -y curl gnupg2 dirmngr

# Instalación de RVM para manejar versiones de Ruby
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Instalación de Node.js y Yarn para Rails
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y nodejs yarn

# Instalación de Rails
gem install rails

echo "Rails instalado correctamente."