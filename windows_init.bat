rem .emacs.d文件夹所在目录
set emacs_d_path="%APPDATA%\.emacs.d\"

rem 添加python执行路径到环境变量path
set python_install_path="D:\programs\Python27\"
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%python_install_path%;%python_install_path%\Scripts\"

rem install pygments
python %emacs_d_path%\win_apps\python get-pip.py
pip install Pygments

rem 添加第三方工具路径到path环境变量
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%emacs_d_path%\win_apps;%emacs_d_path%\glo65wb\bin\"

rem 添加gnu global使用的环境变量
wmic ENVIRONMENT create name="GTAGSCONF",username="<system>",VariableValue="%emacs_d_path%\win_apps\glo65wb\share\gtags\gtags.conf"
wmic ENVIRONMENT create name="GTAGSLABEL",username="<system>",VariableValue="pygment"

rem 解压GNU Global
unzip -o glo65wb.zip


echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
