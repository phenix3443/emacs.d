#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

# cedet
tar zxf ${CUR_DIR}/3rd-party/cedet-build.tar.gz -C ${CUR_DIR}/3rd-party/

# Exuberant Ctags
sudo apt-get install -y exuberant-ctags

# pygment
sudo apt-get install -y python python-pip python-dev
sudo pip install -y pygments
sudo pip install -y --upgrade pip
sudo pip install -y --upgrade virtualenv

# GNU global
sudo apt-get -y install libncurses-dev
wget http://tamacom.com/global/global-6.5.4.tar.gz
tar zxf global-6.5.4.tar.gz
cd global-6.5.4 && ./configure && make && sudo make install && make clean && cd ..

rm -fr global-6.5.4
rm -f global-*.tar.gz

echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.bashrc
echo "GTAGSLABEL=pygments" >> ~/.bashrc

cd ~/.emacs.d/
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
exprot GTAGSLABEL=pygments

echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
