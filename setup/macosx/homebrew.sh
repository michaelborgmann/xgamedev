#!/bin/bash

BREW=false

function is_brew() {
    if [ -f /usr/local/bin/brew ]
    then
        BREW=true
    else
        BREW=false
    fi
}

function install_Homebrew() {
    is_brew
    if $BREW is true
    then
        echo "[X] Found Homebrew (www.brew.sh)"
    else
        echo "[!] Try intalling Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

function install_AllBrews() {
    is_brew
    if $BREW is true
    then
        brew install git cmake mercurial subversion tmux
    fi
}
