#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

# for c++
sudo apt-get install -y  clang llvm libclang-dev
sudo apt install cppcheck

# for go

# for lua
sudo apt install luarocks
sudo luarocks install luacheck

# for flycheck
sudo apt install shellcheck

# for python
sudo apt-get install -y python python-pip
sudo pip install --upgrade pip
sudo pip install pylint flake8

# for shellcheck
# sudo apt install cabal-install
# git clone git@github.com:koalaman/shellcheck.git
# cd shellcheck && cabal install

# GNU global
sudo apt-get install -y silversearcher-ag dos2unix exuberant-ctags global
sudo pip install pygments

echo "# gnu global env start" >> ~/.bashrc
echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.profile
echo "export GTAGSLABEL=pygments" >> ~/.profile
echo "# gnu global evn end" >> ~/.profile

echo Prepare work has Done successfully!
echo Start emacs and wait a moment for installing packages from ELPA
