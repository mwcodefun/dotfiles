#!/bin/bash
if [[ "$0" == "/bin/bash" ]]; then
    cat ./profile/server.profile > $HOME/.profile
    source $HOME/.profile
fi