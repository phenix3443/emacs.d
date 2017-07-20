#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

sudo apt install -y silversearcher-ag dos2unix

# GNU global
sudo apt install -y global
# Exuberant Ctags and pygments for global plugin
sudo apt install -y exuberant-ctags python-pygments

echo "# gnu global env start" >> ~/.bashrc
echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.bashrc
echo "export GTAGSLABEL=pygments" >> ~/.bashrc
echo "# gnu global evn end" >> ~/.bashrc

# python
sudo apt install python python3
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
# for jedi
sudo apt install -y python-dev

# for ac-lang
sudo apt install -y  clang llvm libclang-dev

#for lua
sudo apt install -y luarocks

# for flycheck
sudo apt install shellcheck
sudo apt install cppcheck
sudo pip install pylint flake8
sudo luarocks install luacheck

# for shellcheck
# sudo apt install cabal-install
# git clone git@github.com:koalaman/shellcheck.git
# cd shellcheck && cabal install

echo Prepare work has Done successfully!
echo Start emacs and wait a moment for installing packages from ELPA
