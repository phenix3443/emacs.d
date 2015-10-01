emacs.d
=======
我使用的操作系统
# windows8.1 x64
1. git clone https://github.com/phenix3443/emacs.d.git %APPDATA%\.emacs.d
2. 为GNU Global需要安装python 2.*版本。
3. 如果要使用gpg，自行安装%APPDATA%\.emacs.d\win_apps\gpg4win-2.2.5.exe。windows下pageant.exe伴随emacs自动启动。
4. 以管理员权限执行windows_init.bat，不要重复执行。
5. windows下使用helm-locate依赖于es.exe，而es.exe必须和everything配合使用，所以启动emacs的时候就自动启动everything。

# ubuntu 15 x64
1. git clone https://github.com/phenix3443/emacs.d.git ~/.emacs.d
2. sudo ~/.emacs.d/ubuntu_init.sh

# Emacs配置
1. Emacs配置按照Emacs Manual顺序整理。
