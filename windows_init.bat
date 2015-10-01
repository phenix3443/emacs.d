@echo off
echo 默认将配置文件放在%APPDATA%\.emacs.d中
rem git clone git@github.com:phenix3443/emacs.d.git %APPDATA%\.emacs.d
cd %~dp0\

rem emacs.d安装路径
set emacs_d_path=%APPDATA%\.emacs.d

echo 删除已有的HOME环境变量
wmic ENVIRONMENT where "name='HOME'" delete
echo 添加HOME环境变量
wmic ENVIRONMENT create name="HOME",username="<system>",VariableValue=%APPDATA%

echo Path环境变量中添加Python27的可执行文件路径，包括通过pip安装的
rem python27安装路径
set python_install_path=C:\Python27
set path=%path%;%python_install_path%;%python_install_path%\Scripts\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"
echo 安装Pygments
pip install Pygments

echo 添加第三方工具（es.exe,lua.exe等）到path环境变量
set path=%path%;%emacs_d_path%\win_apps\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"

echo 解压GNU Global
rem %~dp0\win_apps\unzip -d %~dp0\win_apps\ -o %~dp0\win_apps\glo651wb.zip
win_apps\unzip -d win_apps\ -o win_apps\glo651wb.zip

echo 添加GNU Global到path环境变量
set path=%path%;%emacs_d_path%\win_apps\glo651wb\bin\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"

echo 创建环境变量GTAGSCONF
rem 删除已有的GTAGSCONF环境变量
wmic ENVIRONMENT where "name='GTAGSCONF'" delete
wmic ENVIRONMENT create name="GTAGSCONF",username="<system>",VariableValue="%emacs_d_path%\win_apps\glo651wb\share\gtags\gtags.conf"
echo 创建环境变量GTAGSLABEL
rem 删除已有的GTAGSLABEL环境变量
wmic ENVIRONMENT where "name='GTAGSLABEL'" delete
wmic ENVIRONMENT create name="GTAGSLABEL",username="<system>",VariableValue="pygments"

gtags --debug

echo Done successfully!
echo 现在启动emacs之后先从elpa下载相应的扩展插件

pause
