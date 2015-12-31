#!/bin/bash

# install Exuberant Ctags
sudo apt-get install -y exuberant-ctags

# install pygment
sudo apt-get install -y python python-dev python-pip
sudo pip install Pygments

# install GNU global
sudo apt-get -y install libncurses-dev
wget -P ~/Downloads http://tamacom.com/global/global-6.5.1.tar.gz
tar zxf ~/Downloads/global-6.5.1.tar.gz
cd global-6.5.1 && ./configure && make && sudo make install && make clean

rm -fr global-6.5.1
rm -f global-*.tar.gz

echo "export GTAGSCONF=/usr/local/share/gtags/gtags.conf" >> ~/.bashrc
echo "GTAGSLABEL=pygments" >> ~/.bashrc

cd ~/.emacs.d/
export GTAGSCONF=/usr/local/share/gtags/gtags.conf
exprot GTAGSLABEL=pygments
gtags --debug

echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
