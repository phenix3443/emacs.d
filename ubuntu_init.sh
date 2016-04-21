#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

# for cedet ycmd
git submodule update --init --recursive

# cedet
cd ${CUR_DIR}/3rd-party/cedet-git
make
cd ${CUR_DIR}

# Exuberant Ctags
sudo apt-get install -y exuberant-ctags

# pygment
sudo apt-get install -y python python-pip python-dev
sudo pip install -y pygments


# GNU global
sudo apt-get -y install libncurses-dev
wget http://tamacom.com/global/global-6.5.4.tar.gz
tar zxf global-6.5.4.tar.gz
cd global-6.5.4 && ./configure && make && sudo make install && make clean

cd ${CUR_DIR}
rm -fr global-6.5.4
rm -f global-*.tar.gz

echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.bashrc
echo "GTAGSLABEL=pygments" >> ~/.bashrc

# ycmd
sudo apt-get install build-essential cmake python-dev
cd ${CUR_DIR}/3rd-party/ycmd/
./build.py --all
cd ${CUR_DIR}

echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA
