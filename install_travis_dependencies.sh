#!/bin/bash

languages=""

if [ -n "$SNIPPET_LANGUAGE" ]; then
  echo "Installing dependencies for: ${SNIPPET_LANGUAGE//:/,}"
  languages="$SNIPPET_LANGUAGE"
fi

# Install common dependencies
jdk_switcher use oraclejdk8
sudo apt-get install -y --force-yes build-essential ca-certificates git curl

if [[ $languages == *"java"* ]]; then
  sudo add-apt-repository ppa:cwchien/gradle -y
  sudo apt-get update
  sudo apt-get install -y --force-yes gradle
fi

if [[ $languages == *"node"* ]]; then
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  sudo apt-get install -y --force-yes nodejs
  sudo npm install -g n
  sudo n lts
  ". $HOME/.nvm/nvm.sh"
  nvm install stable
  nvm use stable
fi

if [[ $languages == *"python"* ]]; then
  sudo apt-get install -y --force-yes python-dev python-pip
  sudo pip install --upgrade pip wheel --quiet
fi

if [[ $languages == *"php"* ]]; then
  sudo apt-get install -y --force-yes php5-cli git php5-curl
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi

