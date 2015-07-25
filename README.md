emacs.d
=======
我使用的操作系统
windows8.1 x64
ubuntu 15 x64
一些常用的软件都是64位的，在32位机器上不能运行，我也不会做兼容。
Emacs配置文件。按照Emacs Manual 章节排列。
windows安装准备工作：
安装git，执行git clone https://github.com/phenix3443/emacs.d.git %APPDATA%\.emacs.d
为GNU Global做准备：
安装python 2.7.9


如果要使用gpg，自行安装%APPDATA%\.emacs.d\win_apps\gpg4win-2.2.5.exe

以管理员权限执行windows_init.bat


ubuntu安装步骤：
git clone https://github.com/phenix3443/emacs.d.git ~/.emacs.d

sudo ~/.emacs.d/ubuntu_init.sh

Note:
这两个脚本对分别对emacs运行需要的一些系统环境进行配置，如解压缩依赖的第三方软件，修改环境变量。只能执行一次！只能执行一次！只能执行一次！重要的事情说三次

windows下使用helm-locate依赖于es.exe，而es.exe必须和everything配合使用，所以启动emacs的时候就自动启动everything。

同样，windows下pageant.exe伴随emacs自动启动。
