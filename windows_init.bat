@echo off
echo 默认将配置文件放在%APPDATA%\.emacs.d中
rem git clone git@github.com:phenix3443/emacs.d.git %APPDATA%\.emacs.d
cd %~dp0\

echo check python2.7
rem todo: check python2.7, if not installed, install it
rem python27安装路径
set python_install_path=C:\Python27
set path=%path%;%python_install_path%;%python_install_path%\Scripts\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"
echo 安装Pygments
pip install Pygments

set path=%path%;%APPDATA%\.emacs.d\win_apps\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"

echo install GNU Global
win_apps\unzip -d win_apps\ -o win_apps\glo651wb.zip
set path=%path%;%APPDATA%\.emacs.d\win_apps\glo651wb\bin\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"
cp \win_apps\.globalrc %APPDATA%

gtags --debug

echo Done successfully!
echo 现在启动emacs之后先从elpa下载相应的扩展插件

pause
