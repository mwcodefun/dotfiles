alias q=clear
alias rezsh="source ~/.zshrc"
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
