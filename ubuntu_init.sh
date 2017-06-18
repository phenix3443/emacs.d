#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

sudo apt-get install -y silversearcher-ag dos2unix

# GNU global
sudo apt-get -y install global
# Exuberant Ctags and pygments for global plugin
sudo apt-get install -y exuberant-ctags python-pygments

echo "# gnu global env start" >> ~/.bashrc
echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.bashrc
echo "export GTAGSLABEL=pygments" >> ~/.bashrc
echo "# gnu global evn end" >> ~/.bashrc

# for jedi
sudo apt-get install -y python python-dev
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

# for ac-lang
sudo apt-get install -y  clang llvm libclang-dev

#for lua
sudo apt install luarocks
# for flycheck
sudo apt install shellcheck
sudo apt install cppcheck
sudo pip install pylint flake8
sudo luarocks install luacheck
sudo apt install cppcheck
# for shellcheck
# sudo apt install cabal-install
# git clone git@github.com:koalaman/shellcheck.git
# cd shellcheck && cabal install

echo Prepare work has Done successfully!
echo Start emacs and wait a moment for installing packages from ELPA
