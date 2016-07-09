#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)


# for cedet ycmd

git submodule update --init --recursive

# cedet
cd ${CUR_DIR}/3rd-party/cedet-git
make
cd ${CUR_DIR}

# Exuberant Ctags
sudo apt-get install -y exuberant-ctags silversearcher-ag dos2unix

# pygment
sudo apt-get install -y python python-pip python-dev
sudo pip install pygments


# GNU global
sudo apt-get -y install global

echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.bashrc
echo "export GTAGSLABEL=pygments" >> ~/.bashrc

# for jedi
sudo apt-get install -y python python-dev
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

# for ac-lang
# sudo apt-get install -y  clang llvm libclang-dev

# ycmd
# sudo apt-get install build-essential cmake python-dev clang llvm libclang-dev
# cd ${CUR_DIR}/3rd-party/ycmd/
# ./build.py --all
# cd ${CUR_DIR}

echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA
