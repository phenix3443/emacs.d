#!/bin/bash
cd ~/.emacs.d/
# install Exuberant Ctags
mdir ~/projects/
cd ~/projects/
wget -P ~/Downloads http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zxf ~/Downloads/ctags-5.8.tar.gz
cd ctags-5.8 && ./configure && make && sudo make install && make clean

# install pygment
sudo apt-get install -y python python-pip
sudo pip install Pygments

# install GNU global
cd ~/projects/
sudo apt-get -y install libncurses5-dev
wget -P ~/Downloads http://tamacom.com/global/global-6.5.1.tar.gz
tar zxf ~/Downloads/global-6.5.1.tar.gz
cd global-6.5.1 && ./configure && make && sudo make install && make clean

gtags --debug

echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
