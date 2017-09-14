#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

# for c++
sudo apt-get install -y  clang llvm libclang-dev
sudo apt install cppcheck

# for go
echo "export GOROOT=/usr/local/go" >> ~/.profile
echo "export GOPATH=$HOME/gospace" >> ~/.profile
echo "export PATH=$PATH:$GOROOT/bin:$HOME/gospace/bin" >> ~/.profile

go get -u github.com/nsf/gocode
go get -u github.com/rogpeppe/godef
# for lua
sudo apt install luarocks
sudo luarocks install luacheck

# for flycheck
sudo apt install shellcheck

# for python
sudo apt-get install -y python python-pip python3 python3-pip
sudo pip install --upgrade pip
sudo pip install pylint flake8
sudo pip install yapf

# for jedi
sudo pip install virtualenv
sudo pip install jedi

# for shellcheck
# sudo apt install cabal-install
# git clone git@github.com:koalaman/shellcheck.git
# cd shellcheck && cabal install

# GNU global
wget http://tamacom.com/global/global-6.5.7.tar.gz
tar zxf global-6.5.7.tar.gz
cd global-6.5.7
sudo apt install ncurses-dev
make && sudo make install
sudo apt-get install -y silversearcher-ag dos2unix exuberant-ctags
sudo pip install pygments

echo "# gnu global env start" >> ~/.profile
echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.profile
echo "export GTAGSLABEL=pygments" >> ~/.profile
echo "# gnu global evn end" >> ~/.profile

echo Prepare work has Done successfully!
echo Start emacs and wait a moment for installing packages from ELPA
