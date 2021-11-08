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
set-up-oh-my-zsh(){

  echo "==========================================================="
  echo "                      Shells Enviroment"
  echo "-----------------------------------------------------------"
  echo "* Installing Oh-My-Zsh..."
  echo "-----------------------------------------------------------"

  curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
  echo "-----------------------------------------------------------"
  echo "* Installing ZSH Custom Plugins & Themes:"
  echo ""
  echo "  - zsh-autosuggestions"
  echo "  - fast-syntax-highlighting"
  echo "  - zsh-gitcd"
  echo "  - p10k zsh-theme"
  echo "  - zsh-z"
  echo "-----------------------------------------------------------"

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/sukkaw/zsh-gitcd.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-gitcd
  git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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
    echo "Cloning order-push project."
    git clone https://gitee.com/lensung/order_push.git
  fi
  if [ ! -e trade-sync ]; then
    echo "Cloing trade-sync project."
    git clone https://gitee.com/lensung/trade-sync.git
  fi
  if [ ! -e x-taobao-sdk ]; then
    echo "Cloing x-top project."
    git clone https://gitee.com/lensung/x-taobao-sdk.git
  fi
  cd $HOME
}
start
change-apt-source
install-linux-package
clone-self-repository
clone-git-repositories
set-up-oh-my-zsh