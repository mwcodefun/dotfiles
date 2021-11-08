#!/bin/bash

start(){
  clear
  echo "================================="
  echo "Start install software on wsl"
  cd $HOME
}

change-apt-source(){
  sed -i "s/security.ubuntu.com/mirrors.aliyun.com/"
}

install-linux-package(){
  sudo apt update
  sudo apt -y install zsh git 
}
start
change-apt-source
install-linux-package

