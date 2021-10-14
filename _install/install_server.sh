#!/bin/bash
if [[ "$SHELL" == "/bin/bash" ]]; then
    echo "append profile"
    cat ./profile/server.profile > $HOME/.profile
    source $HOME/.profile
    echo "append profile success"
fi