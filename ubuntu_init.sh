#!/bin/bash

# install Exuberant Ctags
cd ~/projects/
wget -P ~/Downloads http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zxf ~/Downloads/ctags-5.8.tar.gz
cd ctags-5.8 && ./configure && make && sudo make install && make clean

# install pygment
sudo apt-get install -y mercurial meld python python-pip
sudo pip install Pygments

# install GNU global
cd ~/projects/
sudo apt-get -y install libncurses5-dev
wget -P ~/Downloads http://tamacom.com/global/global-6.5.tar.gz
tar zxf ~/Downloads/global-6.4.tar.gz
cd global-6.5 && ./configure && make && sudo make install && make clean

# 使用global-pygments-plugin可以将pygments作为global的代码分析工具，global源码中也已经集成了该功能，但是单独安装可以保持最新的特性。需要注意的是这个要在安装global和pygments之后安装。
cd ~/projects/
git clone git@github.com:yoshizow/global-pygments-plugin.git
./reconf.sh
make && sudo make install && make clean
cp sample-globalrc ~/.globalrc



echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
