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
  sudo apt -y install zsh git openjdk-8-jdk openjdk-17-jdk
}
clone-self-repository(){
  echo "--------------------------------------------"
  echo "Cloning dotfiles repository"
  echo "--------------------------------------------"

  git clone https://github.com/mwcodefun/mw-dev-tool
  cd mw-dev-tool
  rm -rf .git
}
clone-git-repositories(){
  mkdir java-projects &2 > /dev/null
  cd java-projects
  if [ ! -e order_push ]; then
    git clone https://gitee.com/lensung/order_push.git
  fi
  if [ ! -e trade-sync ]; then
    git clone https://gitee.com/lensung/trade-sync.git
  fi
  if [ ! -e x-taobao-sdk ]; then
    git clone https://gitee.com/lensung/x-taobao-sdk.git
  fi
  cd $HOME
}
start
change-apt-source
install-linux-package
clone-self-repository
clone-git-repositories
