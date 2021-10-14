#!/bin/bash
clone-or-download(){
    if ! command -v git &> /dev/null
    then
        wget -O mw-dev-tool.zip https://codeload.github.com/mwcodefun/mw-dev-tool/zip/refs/heads/master
        unzip mw-dev-tool.zip
        cd mw-dev-tool-master
    else
        git clone git@github.com:mwcodefun/mw-dev-tool.git
        cd mw-dev-tool
        rm -r -f .git
    fi
}
install_profile(){
    if [[ "$SHELL" == "/bin/bash" ]]; then
        echo "append profile"
        cat ./profile/server.profile > $HOME/.profile
        source $HOME/.profile
        echo "append profile success"
    fi
}

clone-or-download
install_profile