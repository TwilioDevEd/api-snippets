#!/bin/bash

languages=""

if [ -n "$SNIPPET_LANGUAGE" ]; then
  echo "Installing dependencies for: ${SNIPPET_LANGUAGE//:/,}"
  languages="$SNIPPET_LANGUAGE"
fi

# Install common dependencies
sudo apt-get install -y --force-yes build-essential ca-certificates git curl
sudo add-apt-repository ppa:cwchien/gradle -y
sudo apt-get update
sudo apt-get install -y --force-yes gradle

if [[ $languages == *"python"* ]]; then
  sudo apt-get install -y --force-yes python-dev python-pip
  sudo pip install --upgrade pip wheel virtualenv virtualenvwrapper --quiet
  sudo pip install -r requirements.txt
fi

if [[ $languages == *"php"* ]]; then
  sudo apt-get install python-software-properties
  sudo add-apt-repository ppa:ondrej/php -y
  sudo apt-get update
  sudo apt-get install -y --force-yes php5.6
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi

if [[ $languages == *"node"* ]]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm install --lts
  npm install
fi
